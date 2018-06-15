using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RingBehaviour : MonoBehaviour {

    public float lifeTime = 3f;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
       
        Destroy(transform.parent.gameObject, lifeTime);
    }
    private void OnTriggerEnter(Collider other)
    {

       
    }
}
