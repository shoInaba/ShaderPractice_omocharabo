Shader "Custom/CicleDraw" {
	Properties {
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Standard
		#pragma target 3.0

		struct Input {
			float3 worldPos;
		};

		void surf (Input IN, inout SurfaceOutputStandard o) {
			
			// 原点からの距離(スカラー値)
			float dist = distance(fixed3(0,0,0), IN.worldPos);

			// sinの絶対値
			float val = abs(sin(dist*3.0 - _Time*100));

			if(val > 0.98)
			{
				o.Albedo = fixed4(1,1,1,1);
			}
			else
			{
				o.Albedo = fixed4(110/255.0, 87/255.0, 139/255.0, 1);
			}

		}
		ENDCG
	}
	FallBack "Diffuse"
}
