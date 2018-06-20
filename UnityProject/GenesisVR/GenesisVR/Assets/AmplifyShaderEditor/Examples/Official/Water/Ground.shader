// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ASESampleShaders/LocalGradient"
{
	Properties
	{
		_Bottom("Bottom", Color) = (0,0,0,0)
		_Top("Top", Color) = (0,0,0,0)
		_Float0("Float 0", Range( 0 , 10)) = 0.7083043
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		ZTest LEqual
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			half2 uv_texcoord;
		};

		uniform half4 _Bottom;
		uniform half4 _Top;
		uniform half _Float0;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			half2 temp_cast_0 = (_Float0).xx;
			float2 uv_TexCoord12 = i.uv_texcoord + temp_cast_0;
			float4 lerpResult3 = lerp( _Bottom , _Top , uv_TexCoord12.y);
			o.Albedo = lerpResult3.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15401
135;462;1024;655;1909.14;262.4066;2.029072;False;False
Node;AmplifyShaderEditor.RangedFloatNode;13;-893.5087,210.9578;Float;False;Property;_Float0;Float 0;2;0;Create;True;0;0;False;0;0.7083043;1.6;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;12;-553.2368,169.2735;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;4;-542.8,-201.1001;Float;False;Property;_Bottom;Bottom;0;0;Create;True;0;0;False;0;0,0,0,0;0,0.9172413,1,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1;-533.7999,-30.2;Float;False;Property;_Top;Top;1;0;Create;True;0;0;False;0;0,0,0,0;0.8455882,0.1305688,0.7371027,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;3;-220.5998,44.29988;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Half;False;True;2;Half;ASEMaterialInspector;0;0;Standard;ASESampleShaders/LocalGradient;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;3;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;0;4;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;12;1;13;0
WireConnection;3;0;4;0
WireConnection;3;1;1;0
WireConnection;3;2;12;2
WireConnection;0;0;3;0
ASEEND*/
//CHKSM=B6E288C90CE54BCBD67A07CEBD1058DAE3FC2F14