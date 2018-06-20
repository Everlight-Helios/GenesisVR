// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "test03_astrid"
{
	Properties
	{
		_Color1("Color 1", Color) = (0.4352941,1,0.9529412,0)
		_Color0("Color 0", Color) = (1,0.6882353,0.2205882,0)
		_Color2("Color 2", Color) = (1,0.4941176,0.945098,0)
		_Distribution1("Distribution 1", Range( 0 , 1)) = 0.2
		_Distribution2("Distribution 2", Range( 0 , 1)) = 0.2
		_StartPoint2("Start Point 2", Range( -1 , 1)) = 0.1
		_StartPoint1("Start Point 1", Range( -1 , 1)) = 0.1
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
		uniform float _StartPoint1;
		uniform float _Distribution1;
		uniform float4 _Color0;
		uniform float _StartPoint2;
		uniform float _Distribution2;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float4 lerpResult7 = lerp( _Color1 , _Color2 , saturate( ( ( ase_vertex3Pos.y + _StartPoint1 ) / _Distribution1 ) ));
			float4 lerpResult18 = lerp( lerpResult7 , _Color0 , saturate( ( ( ase_vertex3Pos.y + _StartPoint2 ) / _Distribution2 ) ));
			o.Emission = lerpResult18.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15401
560;99;1112;881;1563.268;898.0729;1.807154;True;False
Node;AmplifyShaderEditor.PosVertexDataNode;12;-892.5547,-125.1828;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;13;-891.0083,39.46365;Float;False;Property;_StartPoint1;Start Point 1;6;0;Create;True;0;0;False;0;0.1;0.1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;15;-606.8987,-126.3876;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-893.6871,131.5646;Float;False;Property;_Distribution1;Distribution 1;3;0;Create;True;0;0;False;0;0.2;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-637.1879,423.6704;Float;False;Property;_StartPoint2;Start Point 2;5;0;Create;True;0;0;False;0;0.1;0.1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;20;-638.7343,259.024;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;16;-478.0759,1.892073;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-639.8668,515.7713;Float;False;Property;_Distribution2;Distribution 2;4;0;Create;True;0;0;False;0;0.2;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;23;-353.0782,257.8192;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;24;-224.2556,386.0988;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;8;-823.4964,-663.7341;Float;False;Property;_Color1;Color 1;0;0;Create;True;0;0;False;0;0.4352941,1,0.9529412,0;1,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;17;-293.7104,-4.079257;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;9;-815.6608,-474.2414;Float;False;Property;_Color2;Color 2;2;0;Create;True;0;0;False;0;1,0.4941176,0.945098,0;0,1,0.213793,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;19;-814.7049,-309.2635;Float;False;Property;_Color0;Color 0;1;0;Create;True;0;0;False;0;1,0.6882353,0.2205882,0;0,1,0.213793,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;25;-39.89013,380.1275;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;7;-379.9096,-635.7334;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;18;-132.3355,-413.5639;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;129.9141,-383.3432;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;test03_astrid;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;False;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;15;0;12;2
WireConnection;15;1;13;0
WireConnection;16;0;15;0
WireConnection;16;1;14;0
WireConnection;23;0;20;2
WireConnection;23;1;21;0
WireConnection;24;0;23;0
WireConnection;24;1;22;0
WireConnection;17;0;16;0
WireConnection;25;0;24;0
WireConnection;7;0;8;0
WireConnection;7;1;9;0
WireConnection;7;2;17;0
WireConnection;18;0;7;0
WireConnection;18;1;19;0
WireConnection;18;2;25;0
WireConnection;0;2;18;0
ASEEND*/
//CHKSM=974EA2F519A4CADC4697B7EC3493D97156551033