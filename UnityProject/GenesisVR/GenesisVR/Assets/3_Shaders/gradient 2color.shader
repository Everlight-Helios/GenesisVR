// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "gradient 2color"
{
	Properties
	{
		_Color1("Color 1", Color) = (1,0,0,0)
		_Color2("Color 2", Color) = (0,1,0.213793,0)
		_Distribution("Distribution", Range( 0 , 1)) = 0.2
		_StartPoint("Start Point", Range( -1 , 1)) = 0.1
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha noshadow 
		struct Input
		{
			float3 worldPos;
		};

		uniform float4 _Color1;
		uniform float4 _Color2;
		uniform float _StartPoint;
		uniform float _Distribution;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float4 lerpResult7 = lerp( _Color1 , _Color2 , saturate( ( ( ase_vertex3Pos.y + _StartPoint ) / _Distribution ) ));
			o.Emission = lerpResult7.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15401
722;99;950;881;1248.766;835.2603;1.507154;True;False
Node;AmplifyShaderEditor.RangedFloatNode;13;-891.0083,39.46365;Float;False;Property;_StartPoint;Start Point;3;0;Create;True;0;0;False;0;0.1;0.1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;12;-892.5547,-125.1828;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;14;-893.6871,131.5646;Float;False;Property;_Distribution;Distribution;2;0;Create;True;0;0;False;0;0.2;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;15;-606.8987,-126.3876;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;16;-478.0759,1.892073;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;9;-511.2159,-349.1476;Float;False;Property;_Color2;Color 2;1;0;Create;True;0;0;False;0;0,1,0.213793,0;1,0.4926471,0.9440162,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;17;-293.7104,-4.079257;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;8;-513.6301,-511.5334;Float;False;Property;_Color1;Color 1;0;0;Create;True;0;0;False;0;1,0,0,0;0.4338235,1,0.953144,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;7;-125.2009,-381.0247;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;129.9141,-383.3432;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;gradient 2color;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;False;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;15;0;12;2
WireConnection;15;1;13;0
WireConnection;16;0;15;0
WireConnection;16;1;14;0
WireConnection;17;0;16;0
WireConnection;7;0;8;0
WireConnection;7;1;9;0
WireConnection;7;2;17;0
WireConnection;0;2;7;0
ASEEND*/
//CHKSM=17EE1C89C6CE226F2C0368BE6520E9EB5E23CBB1