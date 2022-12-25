local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local CONSTANTS = {
	-- Timers
	["HALF_SECOND"]				= 0.5,
	["ONE_SECOND"]				= 1,
	["FIVE_SECONDS"]			= 5,
	-- Inventory Slot IDs
	["INVTYPE_HEAD"] 			= 1,
	["INVTYPE_NECK"] 			= 2,
	["INVTYPE_SHOULDER"] 		= 3,
	["INVTYPE_BODY"] 			= 4,
	["INVTYPE_CHEST"] 			= 5,
	["INVTYPE_WAIST"] 			= 6,
	["INVTYPE_LEGS"] 			= 7,
	["INVTYPE_FEET"] 			= 8,
	["INVTYPE_WRIST"] 			= 9,
	["INVTYPE_HAND"] 			= 10,
	["INVTYPE_FINGER"] 			= 11, -- and 12
	["INVTYPE_TRINKET"] 		= 13, -- and 14
	["INVTYPE_CLOAK"] 			= 15,
	["INVTYPE_WEAPON"] 			= 16, -- and 17
	["INVTYPE_2HWEAPON"] 		= 16,
	["INVTYPE_RANGEDRIGHT"] 	= 16,
	["INVTYPE_RANGED"] 			= 16,
	["INVTYPE_SHIELD"] 			= 17,
	["INVTYPE_HOLDABLE"] 		= 17,
	-- Levels
	["MAX_PLAYER_LEVEL"] 		= 70,
	["WAR_MODE_MAX_LEVEL"]		= 60,
	["MAX_HEIRLOOM_LEVEL"]		= 59,
	-- Dragonriding
	["DRAGONRIDING_TREE_ID"] 	= 672,
	-- Miscellaneous
	["LAST_SUPPORTED_VERSION"] 	= "2.0.7",
}
addonTable.CONSTANTS = CONSTANTS