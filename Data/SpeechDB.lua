local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local SPEECH = {
	[L_GLOBALSTRINGS["Speech.PlayfulTrickster.Praise"]]				= { type="emote", emote="praise" },
	[L_GLOBALSTRINGS["Speech.PlayfulTrickster.Cheer"]]				= { type="emote", emote="cheer" },
	[L_GLOBALSTRINGS["Speech.PlayfulTrickster.Dance"]]				= { type="emote", emote="dance" },
	[L_GLOBALSTRINGS["Speech.PlayfulTrickster.Introduce"]]			= { type="emote", emote="bow" },
	[L_GLOBALSTRINGS["Speech.PlayfulTrickster.Thank"]]				= { type="emote", emote="thank" },
	[L_GLOBALSTRINGS["Speech.PlayfulTrickster.Flex"]]				= { type="emote", emote="flex" },
	[L_GLOBALSTRINGS["Speech.Al'dalil.Buttons1"]]					= { type="glow", button=1 },
	[L_GLOBALSTRINGS["Speech.Al'dalil.Buttons2"]]					= { type="glow", button=1 },
	[L_GLOBALSTRINGS["Speech.Al'dalil.Lever1"]]						= { type="glow", button=2 },
	[L_GLOBALSTRINGS["Speech.Al'dalil.Lever2"]]						= { type="glow", button=2 },
	[L_GLOBALSTRINGS["Speech.Al'dalil.Bonk1"]]						= { type="glow", button=3 },
	[L_GLOBALSTRINGS["Speech.Al'dalil.Bonk2"]]						= { type="glow", button=3 },
	[L_GLOBALSTRINGS["Speech.TrainerIkaros.Jab"]]					= { type="glow", button=1 },
	[L_GLOBALSTRINGS["Speech.TrainerIkaros.Kick"]]					= { type="glow", button=2 },
	[L_GLOBALSTRINGS["Speech.TrainerIkaros.Dodge"]]					= { type="glow", button=3 },
	[L_GLOBALSTRINGS["Speech.TalonedFlayedwing.Scared"]]			= { type="glow", button=1 },
	[L_GLOBALSTRINGS["Speech.TalonedFlayedwing.Shake"]]				= { type="glow", button=2 },
	[L_GLOBALSTRINGS["Speech.TalonedFlayedwing.Praise"]]			= { type="glow", button=3 },
	[L_GLOBALSTRINGS["Speech.SoulEater.Veer"]]						= { type="glow", button=1 },
	[L_GLOBALSTRINGS["Speech.SoulEater.Shake"]]						= { type="glow", button=2 },
	[L_GLOBALSTRINGS["Speech.SoulEater.Writhe"]]					= { type="glow", button=3 },
}

addonTable.SPEECH = SPEECH