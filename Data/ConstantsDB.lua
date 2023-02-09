local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local CONSTANTS = {
	-- Timers
	["HALF_SECOND"]				= 0.5,
	["ONE_SECOND"]				= 1,
	["FIVE_SECONDS"]			= 5,
	-- Levels
	["MAX_PLAYER_LEVEL"] 		= 70,
	["WAR_MODE_MAX_LEVEL"]		= 60,
	["CHROMIE_TIME_MAX_LEVEL"]	= 60,
	["MIN_DUNGEON_RWD_LEVEL"]	= 60,
	-- Dragonriding
	["DRAGONRIDING_TREE_ID"] 	= 672,
	["SLOTS"] 					= {
		[1] 	= 1, 			-- Head
		[2] 	= 2, 			-- Neck
		[3] 	= 3, 			-- Shoulder
		[4] 	= 4, 			-- Shirt
		[5] 	= 5, 			-- Chest
		[6] 	= 6, 			-- Waist
		[7] 	= 7, 			-- Legs
		[8] 	= 8, 			-- Feet
		[9] 	= 9, 			-- Wrist
		[10] 	= 10, 			-- Hands
		[11] 	= { 11, 12 },	-- Finger
		[12] 	= { 13, 14 },	-- Trinket
		[13] 	= { 16, 17 }, 	-- One-Handed Weapon
		[14] 	= 17, 			-- Off-Hand (Shield)
		[15] 	= 16, 			-- Ranged (Bow, Crossbow, Gun, etc.)
		[16] 	= 15, 			-- Back
		[17] 	= { 16, 17 }, 	-- Two-Handed Weapon
		[19] 	= 19, 			-- Tabard
		[20] 	= 5, 			-- Robe (Chest)
		[21] 	= 16, 			-- Main-Hand Weapon
		[22] 	= 17, 			-- Off-Hand Weapon
		[23] 	= 17, 			-- Holdable
		[26] 	= 16, 			-- Ranged Right Weapon
	},
	["TRANSMOG_SLOTS"] 			= {
		[1] 	= true,
		[3] 	= true,
		[4] 	= true,
		[5] 	= true,
		[6] 	= true,
		[7] 	= true,
		[8] 	= true,
		[9] 	= true,
		[10] 	= true,
		[13] 	= true,
		[14] 	= true,
		[15] 	= true,
		[16] 	= true,
		[17] 	= true,
		[20] 	= true,
		[21] 	= true,
		[22] 	= true,
		[23] 	= true,
		[26] 	= true,
	},
}
addonTable.CONSTANTS = CONSTANTS