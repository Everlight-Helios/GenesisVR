using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FishDebugger : MonoBehaviour {
	
	public BoidTarget boidTar;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		this.GetComponent<TextMesh>().text = 
			"Max Flock Size: " + BoidsManager.MaxFlockSize + 
			"\nSpeed: " + BoidsManager.Speed +
			"\nCohesion: " + BoidsManager.Cohesion + 
			"\nAlignment: " + BoidsManager.Alignment +
			"\nCloseTarget: " + BoidsManager.Target + 
			"\nTargetPos: " + boidTar.transform.position + 
			"\nZeroDistance: " + boidTar.ZeroDistance;
	}
}
