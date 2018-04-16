using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Logger : MonoBehaviour {

    private float n = 0.0f;

    void Start() {
        // Debug.LogWarning("sin:" + Mathf.Sin(30f * Mathf.Deg2Rad));
        // Debug.LogWarning("sin:" + Mathf.Sin(45f * Mathf.Deg2Rad));
        // Debug.LogWarning("sin:" + Mathf.Sin(60f * Mathf.Deg2Rad));
        // Debug.LogWarning("sin:" + Mathf.Sin(90f * Mathf.Deg2Rad));
    }

	// Update is called once per frame
	void Update () {
        // Debug.LogWarning("sin:" + Mathf.Sin(60));
        // Debug.LogWarning("n:" + n);
        float time = Time.realtimeSinceStartup;
        // Debug.LogWarning("Time:" + -time);
        Debug.LogWarning("Abs:" + Mathf.Abs(Mathf.Sin(1.0f-time)));
            
        // 原点からの距離(スカラー値)
        //float dist = distance(fixed3(0,0,0), IN.worldPos);

        // sinの絶対値

        //float val = abs(sin(dist*3.0 - _Time*100));

        transform.position = new Vector3(Mathf.Sin(n*3.0f), 0.6f, Mathf.Cos(n*3.0f));
        n += 0.01f;
	}
}
