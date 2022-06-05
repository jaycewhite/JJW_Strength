# JJW_Strength
Reshade shader for affecting the strength of other shaders. Useful for if you like an effect but want it to be subtler, and there is no way to change the "strength" in the shaders own controls.

To download, click the green code button at the top right of this window, then click download zip. Extract and merge the shaders folder with your reshade shader folder.

To use, place JJW_StrengthBegin above to shader you want to affect, and put JJW_StrengthEnd after. Any number of shaders can be sandwiched between a pair like this.

There are 5 sets of this shader to use if you need multiple strengths or a specific order. JJW_StrengthBegin2 and JJW_StrengthEnd2 are a pair for example.

It is always preferable to use a shaders built in strength control instead of this. This is a fallback for shaders that do not have "strength" controls.
