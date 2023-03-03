local addonName, addonTable = ...
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
	[153580]	= { gossip=false, emote="wave" }, 		-- Gor'groth (Exile's Reach)
	[162553] 	= { gossip=true, emote="flex" }, 		-- Runestone of Constructs
	[162559] 	= { gossip=true, emote="kneel" }, 		-- Runestone of Rituals
	[162562] 	= { gossip=true, emote="bleed" }, 		-- Runestone of Plague
	[162584] 	= { gossip=true, emote="sneak" }, 		-- Runestone of Eyes
	[162592] 	= { gossip=true, emote="salute" }, 		-- Runestone of Chosen
	[164835] 	= { gossip=false, emote="dismount" }, 	-- Kee-La (Exile's Reach)
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
	[159915] = { -- Gatamatos
		["note"] = "|cff3CB043CLICK ME!|r",
		["conditions"] = false,
	}, 
	[173806] = { -- Gatamatos
		["note"] = "|cff3CB043CLICK ME!|r",
		["conditions"] = false,
	}, 
	[164675] = { -- Lever (Torghast Chest)
		["note"] = "Order:\n|cffFFFFFF1, 2, 1, 3, 1, 2, 1, 4, 1, 2, 1, 3, 1, 2, 1|r",
		["conditions"] = false,
	}, 
	[193877] = { -- Lukoturukk
		["note"] = "|cffFF0000DO NOT ACCEPT QUESTS!|r",
		["conditions"] = {
			["level.lower"] = 70,
			["quests.incomplete"] = { 66212 }, -- Fishing: Aileron Seamoth
		},
	},
	[186568] = { -- Bukarakikk
		["note"] = "|cffFF0000DO NOT ACCEPT QUESTS!|r",
		["conditions"] = {
			["level.lower"] = 70,
			["quests.incomplete"] = { 66217 }, -- WANTED: Krojek the Shoreprowler
		},
	},
	[186480] = { -- Brena
		["note"] = "|cffFF0000DO NOT ACCEPT |cffFFFFFFBRACKENHIDE HOLLOW|r QUEST!|r",
		["conditions"] = {
			["level.lower"] = 70,
			["quests.incomplete"] = { 66211 }, -- Brackenhide Hollow: To the Source
		},
	},
	[188297] = { -- Caretaker Ventraz
		["note"] = "|cffFF0000DO NOT ACCEPT QUESTS!|r",
		["conditions"] = {
			["level.lower"] = 70,
		},
	},
	[194525] = { -- Apprentice Caretaker Zefren
		["note"] = "|cffFF0000DO NOT ACCEPT QUESTS!|r",
		["conditions"] = {
			["level.lower"] = 70,
		},
	},
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
local IGNORED_QUESTREWARDS = {
	[200880] = true, -- Wind-Sealed Mana Capsule
}
addonTable.QUESTREWARDS = QUESTREWARDS
addonTable.IGNORED_QUESTREWARDS = IGNORED_QUESTREWARDS

-- Quest Merchants
local QUESTMERCHANTS = {
	-- Legion
		-- Highmountain
	[100437] = { -- Lanna Skyspark
		{ ["questID"] = 40520, ["itemID"] = 132247, ["itemCount"] = 1 }, -- To See the Past (Bottle of Airspark)
	},
	-- Shadowlands
		-- Exile's Reach
	[156800] = { -- Quartermaster Richter (Alliance)
		{ ["questID"] = 55194, ["itemID"] = 117, ["itemCount"] = 1 }, -- Stocking Up on Supplies (Tough Jerky)
	},
	[167213] = { -- Provisioner Jin'hake (Horde)
		{ ["questID"] = 59950, ["itemID"] = 117, ["itemCount"] = 1 }, -- Stocking Up on Supplies (Tough Jerky)
	},
	-- DF
		-- The Azure Span
	[193637] = { -- Jinkutuk
		{ ["questID"] = 66223, ["itemID"] = 192153, ["itemCount"] = 7 }, -- Can We Keep It? (Frigidfish)
	},
}
addonTable.QUESTMERCHANTS = QUESTMERCHANTS

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

-- Holidays
local HOLIDAYS = {
	[324] = { -- Hallow's End
		["rewardID"] 	= 285,
		["mountID"] 	= 219,
		["icon"] 		= "Interface\\ICONS\\inv_belt_12",
		["width"] 		= 28,
		["height"] 		= 26,
	},
	[327] = { -- Brewfest
		["rewardID"] 	= 287,
		["mountID"] 	= 202,
		["icon"] 		= "Interface\\ICONS\\ability_mount_kotobrewfest",
		["width"] 		= 28,
		["height"] 		= 26,
	},
	[423] = { -- Love is in the Air
		["rewardID"] 	= 288,
		["mountID"] 	= 352,
		["icon"] 		= "Interface\\ICONS\\inv_rocketmountpink",
		["width"] 		= 28,
		["height"] 		= 26,
	},
}
addonTable.HOLIDAYS = HOLIDAYS