using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using SoundInput;

/* To do:
 * - fix launching ball
 * - add lifetime to ball
 * - explode ball
 * - add particles to ball
 * - leave transform.pos for target on Destroy();
 * - instantiate FishBoid with target and num;
 */


public class BoidSpawner2 : MonoBehaviour
{
    public float radius = 1f;
    public float lifetime = 3f;
    public int perFrame = 3;
    public FlowFieldBoid boid;
    public Flowfield3DBase target;
    public static int fishcount = 0;

    public float _forceAdd;

    public float _minSpeakTime = 0.5f;
    public bool _playSoundMade = true;
    public Transform _spawnLocation;
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

    private float _highestAmplitude;

    private void Update()
    {
        _micPitch = SIC.inputData.relativeFrequency;

        _micAmplitude = SIC.inputData.relativeAmplitude;

        if ((_micAmplitude > 0) && (!_isSpeaking)) //start speaking SPAWN
        {
            //SIC.SetTime(0.0f);

            _isSpeaking = true;

            //_currentRigidbody = _currentBall.GetComponent<Rigidbody>();

            //_currentBall.transform.position = _spawnLocation.position;
            //_currentBall.transform.rotation = _spawnLocation.rotation; //or transform.LookAt(target);
            //newBoid.Target = target;
            //newBoid.name = ("Fish" + fishcount);

            //print(_currentBall.name);
            //_currentRigidbody.isKinematic = true;
            _clipStart = SIC.GetComponent<AudioSource>().time;
            //_currentBall.GetComponent<DestroyAtZeroVelocity>().playerCollider = playerCollider;

        }

        if ((_micAmplitude <= 0) && (_isSpeaking)) //stop speaking RELEASE
        {

            if (_timeRecording >= _minSpeakTime)
            {
                _clipEnd = SIC.GetComponent<AudioSource>().time;
                if (_playSoundMade)
                {
                    _currentClip = MakeSubclip(SIC.GetComponent<AudioSource>().clip, _clipStart, _clipEnd);
                    //_currentBall.GetComponent<AudioSource>().clip = _currentClip;
                }


                //_currentRigidbody.AddForce(this.transform.forward * _forceAdd * _highestAmplitude);

                _highestAmplitude = 0;
                SIC.NullifyClipData();

            }
            else
            {

                //_currentBallNum -= 1;
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
                //_currentColor = Color.Lerp(lowPitchColor, midPitchColor, Mathf.Clamp01(lowMid));
            }
            else
            {

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

    private IEnumerator Start()
    {
        while (true)
        {
            for (int i = 0; i < perFrame; i++)
            {
                fishcount++;
                var newBoid = Instantiate(boid, transform.position + Random.insideUnitSphere * radius, Quaternion.identity);
                newBoid.Target = target;
                newBoid.name = ("Fish" + fishcount);
            }
            yield return null;
        }
    }

    private void OnDrawGizmosSelected()
    {
        Gizmos.DrawWireSphere(transform.position, radius);
    }
}