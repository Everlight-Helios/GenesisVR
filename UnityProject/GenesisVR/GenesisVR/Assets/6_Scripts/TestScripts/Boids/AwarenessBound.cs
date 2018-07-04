using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(SphereCollider))]
public class AwarenessBound : BoidBound {

<<<<<<< HEAD:UnityProject/GenesisVR/GenesisVR/Assets/6_Scripts/AwarenessBound.cs
<<<<<<< HEAD
//<<<<<<< HEAD:UnityProject/GenesisVR/GenesisVR/Assets/Scripts/AwarenessBound.cs
=======
/*
<<<<<<< HEAD:UnityProject/GenesisVR/GenesisVR/Assets/Scripts/AwarenessBound.cs
>>>>>>> a4f19bf9a58ffef2b8032a14a4fd54faee19cb97
=======
>>>>>>> origin/Evelyn_Testing:UnityProject/GenesisVR/GenesisVR/Assets/6_Scripts/TestScripts/Boids/AwarenessBound.cs
    void OnTriggerEnter(Collider other)
    {
        Boid otherBoid = other.GetComponentInParent<Boid>();
        if (otherBoid != null)
        {
            this.Boid.AddBoidToFlock(otherBoid);
        }
    }
<<<<<<< HEAD:UnityProject/GenesisVR/GenesisVR/Assets/6_Scripts/AwarenessBound.cs
<<<<<<< HEAD
/*=======
=======
======= */
>>>>>>> a4f19bf9a58ffef2b8032a14a4fd54faee19cb97
	void OnTriggerEnter(Collider other) {
		Boid otherBoid = other.GetComponentInParent<Boid>();
		if(otherBoid != null){
			this.Boid.AddBoidToFlock(otherBoid);
		}
<<<<<<< HEAD
		
	}*/
=======

	}
>>>>>>> a4f19bf9a58ffef2b8032a14a4fd54faee19cb97

//>>>>>>> Evelyn_Testing:UnityProject/GenesisVR/GenesisVR/Assets/6_Scripts/AwarenessBound.cs
=======
	
>>>>>>> origin/Evelyn_Testing:UnityProject/GenesisVR/GenesisVR/Assets/6_Scripts/TestScripts/Boids/AwarenessBound.cs
	void OnTriggerExit(Collider other) {
		Boid otherBoid = other.GetComponentInParent<Boid>();
		if(otherBoid != null){
			this.Boid.RemoveBoidFromFlock(otherBoid);
		}
	}
}
