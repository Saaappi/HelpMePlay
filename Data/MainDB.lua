local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

-- Adventure Maps
local ADVENTURE_MAP_QUESTS = {
	["BFA_Alliance"] = {
		47960, -- Tiragarde Sound
		47961, -- Drustvar
		47962, -- Stormsong Valley
	},
	["BFA_Horde"] = {
		47514, -- Zuldazar
		47512, -- Nazmir
		47513, -- Vol'dun
	},
	["SL"] = {
		64846, -- Torghast
		62277, -- Ardenweald
		62279, -- Revendreth
		62275, -- Bastion
		62278, -- Maldraxxus
	},
	["DF"] = {
		72266, -- The Waking Shores
		72267, -- Ohn'ahran Plains
		72268, -- Azure Span
		72269, -- Thaldraszus
	},
}
addonTable.ADVENTURE_MAP_QUESTS = ADVENTURE_MAP_QUESTS

-- Dragonriding
local DRAGONRIDING_TRAITS = {
	{ ["nodeID"] = 64066, ["entryID"] = 82387 }, 	-- Take to the Skies
	{ ["nodeID"] = 81466, ["entryID"] = 102427 }, 	-- Redirection
	{ ["nodeID"] = 64069, ["entryID"] = 82390 }, 	-- Dynamic Stretching
	{ ["nodeID"] = 64068, ["entryID"] = 82389 }, 	-- Thrill Chaser
	{ ["nodeID"] = 64067, ["entryID"] = 82388 }, 	-- Ohn'ahra's Gusts
	{ ["nodeID"] = 64065, ["entryID"] = 82385 }, 	-- Dragonrider's Compassion
	{ ["nodeID"] = 64064, ["entryID"] = 82384 }, 	-- Restorative Travels
	{ ["nodeID"] = 64063, ["entryID"] = 82383 }, 	-- Airborne Tumbling
	{ ["nodeID"] = 64061, ["entryID"] = 82380 }, 	-- Dragonriding Learner
	{ ["nodeID"] = 64062, ["entryID"] = 82381 }, 	-- Dragonrider's Hunt
	{ ["nodeID"] = 64059, ["entryID"] = 82378 }, 	-- Beyond Infinity
	{ ["nodeID"] = 64060, ["entryID"] = 82379 }, 	-- Yearning for the Sky
	{ ["nodeID"] = 64058, ["entryID"] = 82377 }, 	-- At Home Aloft
}
addonTable.DRAGONRIDING_TRAITS = DRAGONRIDING_TRAITS

-- Dungeon Queues
local DUNGEON_QUEUES_BY_QUEST = {
	[55992] = { -- Darkmaul Citadel (A)
		["id"] 	= 2043,
		["n"] 	= C_Map.GetMapInfo(1609).name,
		["t"] 	= "INTERFACE\\ICONS\\levelupicon-lfd",
	},
	[59984] = { -- Darkmaul Citadel (H)
		["id"] 	= 2043,
		["n"] 	= C_Map.GetMapInfo(1609).name,
		["t"] 	= "INTERFACE\\ICONS\\levelupicon-lfd",
	},
}
addonTable.DUNGEON_QUEUES_BY_QUEST = DUNGEON_QUEUES_BY_QUEST

-- Emotes
	-- These emotes are processed when the specified
	-- NPC is targeted.
	-- Set 'gossip' to false if the GOSSIP_SHOW event
	-- shouldn't be handled for a specific NPC.
local EMOTES = {
	[33224]		= { gossip=false, emote="kiss" }, 		-- Lake Frog
	[41539]		= { gossip=false, emote="whistle" }, 	-- Stolen Ram
	[153580]	= { gossip=false, emote="wave" }, 		-- Gor'groth
	[162553] 	= { gossip=true, emote="flex" }, 		-- Runestone of Constructs
	[162559] 	= { gossip=true, emote="kneel" }, 		-- Runestone of Rituals
	[162562] 	= { gossip=true, emote="bleed" }, 		-- Runestone of Plague
	[162584] 	= { gossip=true, emote="sneak" }, 		-- Runestone of Eyes
	[162592] 	= { gossip=true, emote="salute" }, 		-- Runestone of Chosen
}
addonTable.EMOTES = EMOTES

-- Garrison Missions
local GARRISON_MISSIONS = {
	[2] 	= "Gronnlings Abound",
	[66]	= "Killing the Corrupted",
}
addonTable.GARRISON_MISSIONS = GARRISON_MISSIONS

-- Maps
local CINEMATIC_BADMAPS = {
	21, 	-- Silverpine Forest
	217,	-- Ruins of Gilneas
	1169,	-- Tol Dagor
}
addonTable.CINEMATIC_BADMAPS = CINEMATIC_BADMAPS

-- Notes
local NOTES = {
	[33224]  = L_NOTES["Note: CLICK ME!"],		-- Lake Frog
	[170080] = L_NOTES["Note: CLICK ME!"],		-- Exposed Boggart
	[159915] = L_NOTES["Note: CLICK ME!"],		-- Gatamatos
	[173806] = L_NOTES["Note: CLICK ME!"],		-- Gatamatos
	[161726] = L_NOTES["Note: CLICK ME!"],		-- Kael'thas Sunstrider (Sin #1)
	[161734] = L_NOTES["Note: CLICK ME!"],		-- Kael'thas Sunstrider (Sin #2)
	[161737] = L_NOTES["Note: CLICK ME!"],		-- Kael'thas Sunstrider (Sin #3)
	[164675] = L_NOTES["Note: Torghast Lever"],	-- Lever (Torghast Chest)
}
addonTable.NOTES = NOTES

-- Quests
local IGNORED_QUESTS = {
	[53437] = true, -- The MOTHERLODE!!: Raw Deal
	[59583] = true, -- Welcome to Stormwind
	[60343] = true, -- Welcome to Orgrimmar
}
addonTable.IGNORED_QUESTS = IGNORED_QUESTS

-- Quest Rewards
local QUESTREWARDS = {
	[45724] = "Champion's Purse",
}
addonTable.QUESTREWARDS = QUESTREWARDS

-- Speech
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

-- Vehicles
local VEHICLES = {
	89619,	-- Murky (Highmountain)
}
addonTable.VEHICLES = VEHICLES