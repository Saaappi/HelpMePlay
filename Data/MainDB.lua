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

-- Vehicles
local VEHICLES = {
	89619,	-- Murky (Highmountain)
}
addonTable.VEHICLES = VEHICLES