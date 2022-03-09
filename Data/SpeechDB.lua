local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local SPEECH = {
	[L_GLOBALSTRINGS["Playful Trickster: Praise"]]				= { type="emote", emote="praise" },
	[L_GLOBALSTRINGS["Playful Trickster: Cheer"]]				= { type="emote", emote="cheer" },
	[L_GLOBALSTRINGS["Playful Trickster: Dance"]]				= { type="emote", emote="dance" },
	[L_GLOBALSTRINGS["Playful Trickster: Introduce"]]			= { type="emote", emote="bow" },
	[L_GLOBALSTRINGS["Playful Trickster: Thank"]]				= { type="emote", emote="thank" },
	[L_GLOBALSTRINGS["Playful Trickster: Flex"]]				= { type="emote", emote="flex" },
	[L_GLOBALSTRINGS["Al'dalil: Buttons 1"]]					= { type="glow", button=1 },
	[L_GLOBALSTRINGS["Al'dalil: Lever 1"]]						= { type="glow", button=2 },
	[L_GLOBALSTRINGS["Al'dalil: Bonk 1"]]						= { type="glow", button=3 },
	[L_GLOBALSTRINGS["Trainer Ikaros: Jab"]]					= { type="glow", button=1 },
	[L_GLOBALSTRINGS["Trainer Ikaros: Kick"]]					= { type="glow", button=2 },
	[L_GLOBALSTRINGS["Trainer Ikaros: Dodge"]]					= { type="glow", button=3 },
	[L_GLOBALSTRINGS["Taloned Flayedwing: Scared"]]				= { type="glow", button=1 },
	[L_GLOBALSTRINGS["Taloned Flayedwing: Shake"]]				= { type="glow", button=2 },
	[L_GLOBALSTRINGS["Taloned Flayedwing: Praise"]]				= { type="glow", button=3 },
	[L_GLOBALSTRINGS["Soul Eater: Veer"]]						= { type="glow", button=1 },
	[L_GLOBALSTRINGS["Soul Eater: Shake"]]						= { type="glow", button=2 },
	[L_GLOBALSTRINGS["Soul Eater: Writhe"]]						= { type="glow", button=3 },
}

addonTable.SPEECH = SPEECH