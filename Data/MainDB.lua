local addonName, addon = ...
local L_NOTES = addon.L_NOTES

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
addon.ADVENTURE_MAP_QUESTS = ADVENTURE_MAP_QUESTS

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
	{ ["nodeID"] = 92672, ["entryID"] = 114806 }, 	-- Aerial Halt
	{ ["nodeID"] = 92671, ["entryID"] = 114805 }, 	-- Airborne Recovery
	{ ["nodeID"] = 92679, ["entryID"] = 114815 }, 	-- Ground Skimming
	{ ["nodeID"] = 92678, ["entryID"] = 114814 }, 	-- Land's Blessing
}
addon.DRAGONRIDING_TRAITS = DRAGONRIDING_TRAITS

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
addon.DUNGEON_QUEUES_BY_QUEST = DUNGEON_QUEUES_BY_QUEST

local EMOTES = {
	[153580]	= { gossip=false, emote="wave" }, 		-- Gor'groth (Exile's Reach)
	[162553] 	= { gossip=true, emote="flex" }, 		-- Runestone of Constructs
	[162559] 	= { gossip=true, emote="kneel" }, 		-- Runestone of Rituals
	[162562] 	= { gossip=true, emote="bleed" }, 		-- Runestone of Plague
	[162584] 	= { gossip=true, emote="sneak" }, 		-- Runestone of Eyes
	[162592] 	= { gossip=true, emote="salute" }, 		-- Runestone of Chosen
	[164835] 	= { gossip=false, emote="dismount" }, 	-- Kee-La (Exile's Reach)
}
addon.EMOTES = EMOTES

local GARRISON_MISSIONS = {
	[2] 	= "Gronnlings Abound",
	[66]	= "Killing the Corrupted",
}
addon.GARRISON_MISSIONS = GARRISON_MISSIONS

local CINEMATIC_BADMAPS = {
	21, 	-- Silverpine Forest
	217,	-- Ruins of Gilneas
	1169,	-- Tol Dagor
}
addon.CINEMATIC_BADMAPS = CINEMATIC_BADMAPS

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
	[192498] = { -- Haephesta
		["note"] = "|cffFF0000DO NOT ACCEPT QUESTS!|r",
		["conditions"] = {
			["level.lower"] = 70,
		},
	},
}
addon.NOTES = NOTES

local IGNORED_GOSSIP_NPC = {
}
addon.IGNORED_GOSSIP_NPC = IGNORED_GOSSIP_NPC

local IGNORED_QUESTS = {
	[53437] = true, -- The MOTHERLODE!!: Raw Deal
	[59583] = true, -- Welcome to Stormwind
	[60343] = true, -- Welcome to Orgrimmar
}
addon.IGNORED_QUESTS = IGNORED_QUESTS

local QUESTREWARDS = {
	[45724] = "Champion's Purse",
}
local IGNORED_QUESTREWARDS = {
	[200880] = true, -- Wind-Sealed Mana Capsule
}
addon.QUESTREWARDS = QUESTREWARDS
addon.IGNORED_QUESTREWARDS = IGNORED_QUESTREWARDS

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
addon.QUESTMERCHANTS = QUESTMERCHANTS

local SPEECH = {
	-- Playful Trickster (Ardenweald)
	["not so much as a word of praise!"]										= { type="emote", emote="praise" },
	["the other spriggans were all cheering my name for days!"]					= { type="emote", emote="cheer" },
	["dance with me!"]															= { type="emote", emote="dance" },
	["introductions are an important part of first impressions!"]				= { type="emote", emote="bow" },
	["some ask permission, and always thank us for our trouble."]				= { type="emote", emote="thank" },
	["how strong he must have been!"]											= { type="emote", emote="flex" },
}
addon.SPEECH = SPEECH

local VEHICLES = {
	89619,	-- Murky (Highmountain)
}
addon.VEHICLES = VEHICLES