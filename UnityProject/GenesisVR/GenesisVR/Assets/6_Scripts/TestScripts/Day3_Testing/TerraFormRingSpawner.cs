using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using SoundInput;

public class TerraFormRingSpawner : MonoBehaviour {

	public SoundInputController SIC;
	public GameObject ring;
	public GameObject spawnLocation;

	private float _micPitch;
    private float _micAmplitude;
	private bool _isSpeaking = false;
	public float speakingTimer;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
		_micPitch =  SIC.inputData.relativeFrequency;
        _micAmplitude = SIC.inputData.relativeAmplitude;

		if ((_micAmplitude > 0) && (!_isSpeaking)){
			_isSpeaking = true;
		}
		if ((_micAmplitude <= 0) && (_isSpeaking)){
			_isSpeaking = false;
			SIC.NullifyClipData();
		}
		if (_isSpeaking){
			speakingTimer+=Time.deltaTime;
			if(speakingTimer >= 0.1f){
				GameObject.Instantiate(ring, spawnLocation.transform.position, this.transform.rotation);
				speakingTimer = 0.0f;
			}
		}

	}
}
