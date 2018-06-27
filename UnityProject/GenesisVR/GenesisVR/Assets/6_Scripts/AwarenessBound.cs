using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(SphereCollider))]
public class AwarenessBound : BoidBound {

//<<<<<<< HEAD:UnityProject/GenesisVR/GenesisVR/Assets/Scripts/AwarenessBound.cs
    void OnTriggerEnter(Collider other)
    {
        Boid otherBoid = other.GetComponentInParent<Boid>();
        if (otherBoid != null)
        {
            this.Boid.AddBoidToFlock(otherBoid);
        }
    }
/*=======
	void OnTriggerEnter(Collider other) {
		Boid otherBoid = other.GetComponentInParent<Boid>();
		if(otherBoid != null){
			this.Boid.AddBoidToFlock(otherBoid);
		}
		
	}*/

//>>>>>>> Evelyn_Testing:UnityProject/GenesisVR/GenesisVR/Assets/6_Scripts/AwarenessBound.cs
	void OnTriggerExit(Collider other) {
		Boid otherBoid = other.GetComponentInParent<Boid>();
		if(otherBoid != null){
			this.Boid.RemoveBoidFromFlock(otherBoid);
		}
	}
}
