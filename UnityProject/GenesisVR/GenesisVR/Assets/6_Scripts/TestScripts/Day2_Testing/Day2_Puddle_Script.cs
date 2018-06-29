using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Day2_Puddle_Script : MonoBehaviour {

	public Vector3 startingScale;
	public float toGrowScaleMultiplier;
	Vector3 endScale;
	//Vector3 currentScale;

	public float timeToGrow;
	float timer = 0.0f;


	// Use this for initialization
	void Start () {
		if(GetComponent<AudioSource>().clip){
			PlayAudioFaded.FadeInNOut(GetComponent<AudioSource>(), GetComponent<AudioSource>().clip.length/2, GetComponent<AudioSource>().clip.length/2);
		}
		this.transform.localScale = startingScale;
		endScale = startingScale*toGrowScaleMultiplier;
		timer = 0.0f;
	}
	
	// Update is called once per frame
	void Update () {
		//this.transform.localScale = startingScale;
		
		timer += Time.deltaTime/timeToGrow;

		this.transform.localScale = Vector3.Lerp(startingScale, endScale, timer);


	}
}
