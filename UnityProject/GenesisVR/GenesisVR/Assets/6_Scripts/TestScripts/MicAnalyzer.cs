using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MicAnalyzer : MonoBehaviour {

	public int SAMPLES = 512;
	public int FREQS = 1024;
	public int SAMPLE_RATE = 44100;
	public AudioSource source;
	public string micInput = null;
	public float outputFreq;

	private float[] sampleData;
	private float[] freqData;
	private float[] freqDataRaw;

	// Use this for initialization
	void Start () {
		
		//float duration = 1.0f/30.0f;

		sampleData = new float[SAMPLES];
		freqData = new float[FREQS];
		freqDataRaw = new float[FREQS];
		micInput = Microphone.devices[0];
		source.clip = Microphone.Start(micInput, true, 10, SAMPLE_RATE);
		source.Play();
		source.loop = true;


	}

	
	
	// Update is called once per frame
	void Update () {
		outputFreq = GetFundamentalFreqEstimate();
	}

	float BinToHz(float binNum) {
		return binNum * SAMPLE_RATE / FREQS;
	}

	float HzToBin(float hz) {
		return hz * FREQS / SAMPLE_RATE;
	}

	float HzToMidi(float hz) {
		return hz == 0 ? 0 : 12 * Mathf.Log(hz / 440, 2) + 69;
	}

	void  CopyData(float[] data) {
		float weight = 1.0f;
		for (int bin=0; bin < freqData.Length / 2; bin++) {
			freqData[bin] *= (weight - 1);
			freqData[bin] += weight * data[bin];
		}
	}

	void DoFFT() {
		source.GetSpectrumData(freqDataRaw, 0, FFTWindow.Hamming);
	}

	float GetFundamentalFreqEstimate(){

		DoFFT();
		int bin;
		float maxBin = -1.0f;
		float maxVal = 0.0f;
		//bool foundFirstPeak = false;
		for (bin=0; bin < freqDataRaw.Length / 2; bin++) {
			float dampening = 1 / Mathf.Log(bin, 2);
			float d = Mathf.Log(freqDataRaw[bin] / 0.001f, 2) * dampening;
			if (d > maxVal) {
				maxBin = bin;
				maxVal = d;
			}
			freqData[bin] = d;
		}


		float x = 0.0f;
		for (bin=0; bin < freqData.Length / 2; bin++) {
			float y = 1 * freqData[bin];
			var color = (bin == maxBin) ? Color.green : Color.white;
			color.a = 0.1f;
			//Debug.DrawLine(new Vector3(x, 0, 0), new Vector3(x, y, 0), color);
			x += 0.01f;
		}
		return maxBin < 0 ? 0 : BinToHz(maxBin);

	}

}
