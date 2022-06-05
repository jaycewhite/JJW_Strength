# JJW_Strength
Reshade shader for affecting the strength of other shaders

To download, click the green code button at the top right of this window, then click download zip. Extract and merge the shaders folder with your gshade shader folder.

To use, place JJW_StrengthBegin above to shader you want to affect, and put JJW_StrengthEnd after. Any number of shaders can be sandwiched between a pair like this.

It is always preferable to use a shaders built in strength control instead of this. This is a fallback for shaders that do not have "strength" controls.
