//JJW_Strength - Used for setting the strength of a shader
//
// Shader Start
#include "Reshade.fxh"

// Namespace everything
namespace JJW_Strength
{

	//ui
	uniform float Strength <
		ui_type = "slider";
		ui_min = 0; ui_max = 1;
		ui_step = 0.01;
		ui_tooltip = "The Strength of the sandwiched shader(s)";
	> = 1.0;
	

	texture texMask {Width = BUFFER_WIDTH; Height = BUFFER_HEIGHT; Format = RGBA16F; };

	sampler2D SamplerMask { Texture = texMask; };
	
	void strength_start(float4 pos : SV_Position, float2 texcoord : TEXCOORD, out float4 output : SV_Target)
	{
		float4 colour = tex2D(ReShade::BackBuffer, texcoord);
		output = colour;
	}
	
	void strength_end(float4 pos : SV_Position, float2 texcoord : TEXCOORD, out float4 output : SV_Target)
	{
		output = tex2D(SamplerMask, texcoord);
		output = lerp(output, tex2D(ReShade::BackBuffer, texcoord), Strength);
	}


	technique JJW_StrengthBegin
	< ui_tooltip = "Put this above the effect(s) you wish to affect."; >
	{
		pass mask { VertexShader = PostProcessVS; PixelShader = strength_start; RenderTarget = texMask; }
	}

	technique JJW_StrengthEnd
	< ui_tooltip = "Put this below the effect(s) you wish to affect."; >
	{
		pass display { VertexShader = PostProcessVS; PixelShader = strength_end; }
	}
}
