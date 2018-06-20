// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "[Test]/test04_astrid"
{
	Properties
	{
		_Color1("Color 1", Color) = (0.4352941,1,0.9529412,0)
		_Color3("Color 3", Color) = (1,0.6882353,0.2205882,0)
		_Color2("Color 2", Color) = (1,0.4941176,0.945098,0)
		_Dsitribution1("Dsitribution 1", Range( 0 , 1)) = 0.2
		_Dsitribution2("Dsitribution 2", Range( 0 , 1)) = 0.2
		_StartPoint2("Start Point 2", Range( -0.5 , 0.5)) = 0.1
		_StartPoint1("Start Point 1", Range( -0.5 , 0.5)) = -0.3069279
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
		uniform float _Dsitribution1;
		uniform float4 _Color3;
		uniform float _StartPoint2;
		uniform float _Dsitribution2;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float4 lerpResult7 = lerp( _Color1 , _Color2 , saturate( ( ( ( ase_vertex3Pos.y + _StartPoint1 ) + ( _Dsitribution1 / 2.0 ) ) / _Dsitribution1 ) ));
			float4 lerpResult18 = lerp( lerpResult7 , _Color3 , saturate( ( ( ( ase_vertex3Pos.y + _StartPoint2 ) + ( _Dsitribution2 / 2.0 ) ) / _Dsitribution2 ) ));
			o.Emission = lerpResult18.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15401
403;197;1223;864;2667.672;1206.921;2.878148;True;False
Node;AmplifyShaderEditor.RangedFloatNode;37;-1149.459,36.92082;Float;False;Property;_StartPoint1;Start Point 1;6;0;Create;True;0;0;False;0;-0.3069279;0.1;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-1152.138,129.0217;Float;False;Property;_Dsitribution1;Dsitribution 1;3;0;Create;True;0;0;False;0;0.2;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;36;-1151.006,-127.7256;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;42;-898.3184,513.2287;Float;False;Property;_Dsitribution2;Dsitribution 2;4;0;Create;True;0;0;False;0;0.2;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;40;-897.1859,256.481;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;41;-894.6395,422.1275;Float;False;Property;_StartPoint2;Start Point 2;5;0;Create;True;0;0;False;0;0.1;0.1;-0.5;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;52;-766.976,1.947402;Float;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;38;-865.3503,-128.9304;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;49;-479.4605,381.2409;Float;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;43;-611.5298,255.2763;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;53;-673.3758,-129.3526;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;54;-413.376,258.0474;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;46;-705.3274,107.2493;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;9;-823.6608,-503.0415;Float;False;Property;_Color2;Color 2;2;0;Create;True;0;0;False;0;1,0.4941176,0.945098,0;0,1,0.213793,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;8;-823.4964,-663.7341;Float;False;Property;_Color1;Color 1;0;0;Create;True;0;0;False;0;0.4352941,1,0.9529412,0;1,0,0,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;47;-450.2073,490.1557;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;44;-552.162,-6.62209;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;45;-298.3418,377.5846;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;19;-822.7048,-342.8636;Float;False;Property;_Color3;Color 3;1;0;Create;True;0;0;False;0;1,0.6882353,0.2205882,0;0,1,0.213793,0;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;7;-379.9096,-635.7334;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;18;-132.3355,-413.5639;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;129.9141,-383.3432;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;[Test]/test04_astrid;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;False;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;52;0;39;0
WireConnection;38;0;36;2
WireConnection;38;1;37;0
WireConnection;49;0;42;0
WireConnection;43;0;40;2
WireConnection;43;1;41;0
WireConnection;53;0;38;0
WireConnection;53;1;52;0
WireConnection;54;0;43;0
WireConnection;54;1;49;0
WireConnection;46;0;53;0
WireConnection;46;1;39;0
WireConnection;47;0;54;0
WireConnection;47;1;42;0
WireConnection;44;0;46;0
WireConnection;45;0;47;0
WireConnection;7;0;8;0
WireConnection;7;1;9;0
WireConnection;7;2;44;0
WireConnection;18;0;7;0
WireConnection;18;1;19;0
WireConnection;18;2;45;0
WireConnection;0;2;18;0
ASEEND*/
//CHKSM=FD243B7024473A01E455A0CF440306EAAE477CB6