using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FishDebugger : MonoBehaviour {
	
	public Boid firstFish;
	public int fishes;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		int i = 0;
		foreach(GameObject g in GameObject.FindGameObjectsWithTag("Fishes")){
			i++;
		}
		fishes = i;
		i=0;
		this.GetComponent<TextMesh>().text = "Amount of Fishes: " + fishes;
	}
}
