Shader "Custom/Glass" {
	Properties {
		_MainTex("Texture", 2D) = "white"{}
	}
	SubShader {
		Tags { "Queue"="Transparent" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Standard alpha:fade
		#pragma target 3.0

		struct Input {
			float2 uv_MainTex;
		};

		sampler2D _MainTex;

		void surf (Input IN, inout SurfaceOutputStandard o) {
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;

			// 一度グレースケール化
			// テクスチャの色が黒に近い場合は透明度1, それ以外は0.7
			// o.Alpha = 1.0f;
			o.Alpha = (c.r*0.3 + c.g*0.6 + c.b*0.1) < 0.2 ? 1.0f : 0.7f;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
