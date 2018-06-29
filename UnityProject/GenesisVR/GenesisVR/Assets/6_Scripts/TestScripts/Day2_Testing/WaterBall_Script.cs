using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WaterBall_Script : MonoBehaviour {

	float timer = 0.0f;
	float floatTimer = 0.0f;
	public bool floatTimerStart = false;
	bool addTime = true;

	public float upNDownForce = 1.0f;
	public float fallTime = 10.0f;
	float currentVertical;

	// Use this for initialization
	void Start () {

	}

	// Update is called once per frame
	void Update () {

		//lowPos = startPos - new Vector3(0,1.0f,0);
		//highPos = startPos + new Vector3(0,1.0f,0);
		if(floatTimerStart){
			floatTimer += Time.deltaTime;
		}

		if(addTime){
			timer += Time.deltaTime;
			if(timer > 1.0f){
				addTime = false;
			}
		} else {
			timer -= Time.deltaTime;
			if(timer < -1.0f){
				addTime = true;
			}
		}
		if(floatTimer < fallTime){
			currentVertical = timer*upNDownForce;
			this.transform.position = transform.up*currentVertical;
		}else{
			this.GetComponent<Rigidbody>().useGravity = true;
		}
	}

	private void OnDisable()
	{
		addTime = true;
		timer = 0.0f;
		floatTimerStart = false;
		floatTimer = 0.0f;
		this.GetComponent<Rigidbody>().useGravity = false;
	}
}
