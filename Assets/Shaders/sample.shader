Shader "Custom/sample" {
	SubShader {
		Tags { "RenderType" = "Qpaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Standard
		#pragma target 3.0

		// VertexシェーダーからのIN
		struct Input {
			float2 uv_MainTex;
			float3 worldNormal;
			float3 viewDir;
		};

		// OUTはLigthingに送る用
		void surf (Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 baseColor = fixed4(0.05, 0.1, 0, 1);
			fixed4 rimColor  = fixed4(0.5, 0.7, 0.5, 1);

			o.Albedo = baseColor;
			float rim = 1 - saturate(dot(IN.viewDir, IN.worldNormal)); // saturate(x)はmax(0, min(1, x))と同じ
			o.Emission = rimColor * pow(rim, 2.5); // powは乗算, Emissionは自己発光
		}
		ENDCG
	}
	FallBack "Diffuse"
}
