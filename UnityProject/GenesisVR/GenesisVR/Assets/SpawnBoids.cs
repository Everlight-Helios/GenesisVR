using System.Collections;
using System.Collections.Generic;
using SoundInput;
using UnityEngine;

public class SpawnBoids : MonoBehaviour {

    /* To add:
     * - spawnRings >
     * - Target
     * - Locatie fish spawn aanpassen?
     * - SpawnBirds bool op Key + prefabs 
     */


    [Header("Spawn things")]
    public Transform _spawnLocation;
    public float _forceAdd = 10;

    public bool _spawnBirds = false;
    
    public float _minSpeakTime = 0.5f;
    public bool _playSoundMade = false;
    


    [Header("BoidsTarget")]
    public GameObject _target;

    [Header("Fish things")]
    public GameObject[] _fishPrefabs;

    [Header("Bird things")]
    public GameObject[] _birdPrefabs;

    //microphone variables
    [Header("Mic Options")]
    public SoundInputController SIC;
    public float _minPitch;
    public float _maxPitch;
    public float _maxRegisteredAmplitude;
    public float _micPitch;
    private float _micAmplitude;
    private float _timeRecording;
    public bool _isSpeaking;
    private float _clipStart;
    private float _clipEnd;
    private AudioClip _currentClip;

    private float _currentAmplitude;
    private float _highestAmplitude;
  

    [HideInInspector] public bool spawningBoids = true;
    
    private Rigidbody _currentRigidbody;
    private SphereCollider _currentSphereCollider;

  
    private int _pitchSelector = 0;

    // Use this for initialization
    void Start () {
       
    }
	
	// Update is called once per frame
	void Update () {
        //pitch
        _micPitch = SIC.inputData.relativeFrequency;
        _micAmplitude = SIC.inputData.amp01;

        if (spawningBoids)
        {
            if (_micAmplitude >= 0 && !_isSpeaking) //start speaking
            {
                _isSpeaking = true;
               
                _clipStart = SIC.GetComponent<AudioSource>().time;


            }
            if (_micAmplitude < 0 && _isSpeaking)
            {
                if (_timeRecording >= _minSpeakTime)
                {
                    _clipEnd = SIC.GetComponent<AudioSource>().time;
                    if (_playSoundMade)
                    {
                        _currentClip = MakeSubclip(SIC.GetComponent<AudioSource>().clip, _clipStart, _clipEnd);

                        //Zet de opgenomen audioclip op de vis/vogel
                        //_currentBall.GetComponent<AudioSource>().clip = _currentClip;
                    }


                    _highestAmplitude = Mathf.Clamp(_highestAmplitude, 0, _maxRegisteredAmplitude);
                    //print(_currentBoid.name + " - Exit force -> " + this.transform.forward * _forceAdd * _highestAmplitude);
                    //_currentRigidbody.AddForce(this.transform.forward * _forceAdd * _highestAmplitude);
                    if (_pitchSelector < 0)
                    {
                        _pitchSelector = 0;
                    }
                    if (!_spawnBirds)
                    {
                       GameObject fish = (GameObject)Instantiate(_fishPrefabs[_pitchSelector]);
                    }
                    else
                    {
                        GameObject bird = (GameObject)Instantiate(_birdPrefabs[_pitchSelector]);
                    }

                    _highestAmplitude = 0;
                    SIC.SetupMic();

                }
                else
                {
                    
                }
                _isSpeaking = false;
                _timeRecording = 0.0f;

            }
            if (_isSpeaking) //WHILE speaking
            {
                _timeRecording += Time.deltaTime;

                if (_micAmplitude > _highestAmplitude)
                {
                    _highestAmplitude = _micAmplitude;
                }
                _currentAmplitude = _micAmplitude;
                

                bool belowMid = true;
                float lowMid = 1.0f;
                float midHigh = 0.0f;

                if (_micPitch <= 0.5f)
                {
                    belowMid = true;
                    lowMid = _micPitch * 2;
                    midHigh = 0;
                }
                else if (_micPitch > 0.5f)
                {
                    belowMid = false;
                    midHigh = (_micPitch - 0.5f) * 2;
                    lowMid = 0;
                }
                if (belowMid)
                {
                    if (!_spawnBirds)
                    {
                        if (_fishPrefabs.Length >= 2)
                        {
                            _pitchSelector = Mathf.RoundToInt(lowMid); //0 = small fish, 1 = middlefish;
                        }
                    }
                    else
                    {
                        if (_birdPrefabs.Length >= 2)
                        {
                            _pitchSelector = Mathf.RoundToInt(lowMid); //0 = pidgy, 1 = pidgeotto
                        }
                    }
                    //Debug.Log(Mathf.RoundToInt(lowMid));
                }
                else
                {
                    if (!_spawnBirds)
                    {
                        if (_fishPrefabs.Length >= 3)
                        {
                            _pitchSelector = Mathf.RoundToInt(midHigh); //0 = middlefingerfishtick, 1 = bigfucker;
                        }
                    }
                    else
                    {
                        if (_birdPrefabs.Length >= 3)
                        {
                            _pitchSelector = Mathf.RoundToInt(midHigh); //0 = pidgeotto, 1 = Pidgeot;
                        }
                    }
                }

            }
        }

    }

    

    private AudioClip MakeSubclip(AudioClip clip, float start, float stop)
    {
        /* Create a new audio clip */
        int frequency = clip.frequency;
        float timeLength = stop - start;
        if (timeLength <= 0)
        {
            timeLength += 30.0f;
        }
        int samplesLength = (int)(frequency * timeLength);
        AudioClip newClip = AudioClip.Create(clip.name + "-sub", samplesLength, 1, frequency, false);
        /* Create a temporary buffer for the samples */
        float[] data = new float[samplesLength];
        /* Get the data from the original clip */
        clip.GetData(data, (int)(frequency * start));
        /* Transfer the data to the new clip */
        newClip.SetData(data, 0);
        /* Return the sub clip */
        return newClip;
    }


}


