// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:0,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:False,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:True,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:False,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:1,fgcg:0.5882353,fgcb:0.8182557,fgca:1,fgde:0.03,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:1242,x:32988,y:32656,varname:node_1242,prsc:2|diff-8546-OUT,amdfl-8546-OUT;n:type:ShaderForge.SFN_TexCoord,id:6689,x:31847,y:33075,varname:node_6689,prsc:2,uv:0;n:type:ShaderForge.SFN_Color,id:1468,x:32299,y:32710,ptovrint:False,ptlb:node_1468,ptin:_node_1468,varname:node_1468,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0.08965516,c4:1;n:type:ShaderForge.SFN_Color,id:3394,x:32273,y:32540,ptovrint:False,ptlb:node_3394,ptin:_node_3394,varname:node_3394,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.05882353,c3:0.05882353,c4:1;n:type:ShaderForge.SFN_Lerp,id:8546,x:32617,y:32654,varname:node_8546,prsc:2|A-3394-RGB,B-1468-RGB,T-500-OUT;n:type:ShaderForge.SFN_ComponentMask,id:9096,x:32031,y:33095,varname:node_9096,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-6689-V;n:type:ShaderForge.SFN_RemapRange,id:4928,x:32206,y:32900,varname:node_4928,prsc:2,frmn:0,frmx:1,tomn:-0.5,tomx:0.5|IN-9096-OUT;n:type:ShaderForge.SFN_Add,id:1233,x:32528,y:32973,varname:node_1233,prsc:2|A-4928-OUT,B-453-OUT;n:type:ShaderForge.SFN_Slider,id:453,x:32220,y:33266,ptovrint:False,ptlb:node_778_copy,ptin:_node_778_copy,varname:_node_778_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-2,cur:0.2193311,max:2;n:type:ShaderForge.SFN_ConstantClamp,id:500,x:32696,y:32973,varname:node_500,prsc:2,min:-1,max:1|IN-1233-OUT;proporder:3394-1468-453;pass:END;sub:END;*/

Shader "TeardropStalkInverted" {
    Properties {
        _node_3394 ("node_3394", Color) = (1,0.05882353,0.05882353,1)
        _node_1468 ("node_1468", Color) = (0,1,0.08965516,1)
        _node_778_copy ("node_778_copy", Range(-2, 2)) = 0.2193311
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _node_1468;
            uniform float4 _node_3394;
            uniform float _node_778_copy;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                float3 node_8546 = lerp(_node_3394.rgb,_node_1468.rgb,clamp(((i.uv0.g.r*1.0+-0.5)+_node_778_copy),-1,1));
                indirectDiffuse += node_8546; // Diffuse Ambient Light
                float3 diffuseColor = node_8546;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
