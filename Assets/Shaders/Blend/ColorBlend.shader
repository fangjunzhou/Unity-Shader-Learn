Shader "Tutorial/009_Color_Blending/Plain"
{
    Properties
    {
        _Color ("Color", Color) = (1, 1, 1, 1)
        _BlendColor ("BlendColor", Color) = (0, 0, 0, 1)
        _BlendVal ("Blend", Range(0, 1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            float4 _Color;
            float4 _BlendColor;
            float4 _Blend;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                float4 col = lerp(_Color, _BlendColor, _Blend);
                return col;
            }
            ENDCG
        }
    }
}
