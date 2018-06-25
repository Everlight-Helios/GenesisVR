using System.Collections;
using System.Collections.Generic;
using SoundInput;
using UnityEngine;

public class SpawnBoids : MonoBehaviour {

    /* To add:
     * -
     * - spawnRings >
     * - Target
     * - Locatie fish spawn aanpassen?
     * - SpawnBirds bool op Key + prefabs
     */



    [Header("Spawn things")]
    public Transform _spawnLocation;
    public GameObject _ring;
    public float _forceAdd = 30;
    public int maxBoids = 50;
    public bool _spawnBirds = false;

    [Header("Testing options")]
    public bool _spawnAllFish = false;


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
    public float _minSpeakTime = 0.5f;
    public bool _playSoundMade = false;

    [HideInInspector] public bool spawningBoids = true;

    private Rigidbody _currentRigidbody;
    private SphereCollider _currentSphereCollider;

    private int currentFish = 0;
    private int currentBird = 0;
    List<GameObject> _fishes;
    List<GameObject> _birds;
    private int _pitchSelector = 0;

    // Use this for initialization
    void Start () {
        _birds = new List<GameObject>();
        _fishes = new List<GameObject>();

        for (int i = 0; i < maxBoids; i++)
        {
            GameObject fish = (GameObject)Instantiate(_fishPrefabs[_pitchSelector], _spawnLocation);
            if (!_spawnAllFish)
            {
                fish.SetActive(false);
            }
            fish.name = "fish" + i;
            _fishes.Add(fish);

            /*if (_birdPrefabs[0] != null)
            {
                GameObject bird = (GameObject)Instantiate(_birdPrefabs[_pitchSelector], _spawnLocation);
                bird.SetActive(false);
                bird.name = "Bird" + i;
                _birds.Add(bird);
            }*/

        }
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
               // GameObject r = (GameObject)Instantiate(_ring, _spawnLocation);
               // _currentRigidbody = _ring.GetComponentInChildren<Rigidbody>();

            }
            if (_micAmplitude < 0 && _isSpeaking)
            {
                if (_timeRecording >= _minSpeakTime)
                {
                    _clipEnd = SIC.GetComponent<AudioSource>().time;
                    if (_playSoundMade)
                    {
                        _currentClip = MakeSubclip(SIC.GetComponent<AudioSource>().clip, _clipStart, _clipEnd);

                        //Zet de opgenomen audioclip op de vis/vogel/ring
                        //_currentBall.GetComponent<AudioSource>().clip = _currentClip;

                        if (_spawnBirds)
                        {
                            if (currentBird < maxBoids)
                                currentBird += 1;

                        }
                        else
                        {
                            if (currentFish < maxBoids)
                                currentFish += 1;
                        }


                    }


                    _highestAmplitude = Mathf.Clamp(_highestAmplitude, 0, _maxRegisteredAmplitude);
                    //print(_currentBoid.name + " - Exit force -> " + this.transform.forward * _forceAdd * _highestAmplitude);
                    //_currentRigidbody.AddForce(this.transform.forward * _forceAdd * _highestAmplitude);

                    if (_pitchSelector < 0)
                    {
                        _pitchSelector = 0;
                    }
                    if (!_spawnBirds) //To reduce lagg while playing we are loading the prefabs before the level starts and only setting them Active;
                    {
                        //GameObject fish = (GameObject)Instantiate(_fishPrefabs[_pitchSelector], _spawnLocation);
                    }
                    else
                    {
                        //GameObject bird = (GameObject)Instantiate(_birdPrefabs[_pitchSelector],_spawnLocation);
                    }

                    _highestAmplitude = 0;
                    SIC.SetupMic();

                }
                else
                {
                    if (_spawnBirds)
                    {
                        _birds[currentBird].SetActive(true);

                    }
                    else
                    {
                        _fishes[currentFish].SetActive(true);
                    }
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
                  //Influence the flock with your pitch
                  float _boidsFixer = Mathf.Clamp01(lowMid);

                  if (_boidsFixer == 0){
                    BoidsManager.Cohesion = 0.5f;
                    BoidsManager.Alignment = 1f;
                  } else {
                    BoidsManager.Cohesion = 1.5f;
                    BoidsManager.Alignment = 3f;

                  }
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
                  float _boidsFixer = Mathf.Clamp01(midHigh);

                  if (_boidsFixer == 0){
                    BoidsManager.Cohesion = 1.5f;
                    BoidsManager.Alignment = 3f;
                  } else {
                    BoidsManager.Cohesion = 2.5f;
                    BoidsManager.Alignment = 5f;

                  }
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
