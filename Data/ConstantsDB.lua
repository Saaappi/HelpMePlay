local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local CONSTANTS = {
	-- Timers
	["HALF_SECOND"]				= 0.5,
	["ONE_SECOND"]				= 1,
	["FIVE_SECONDS"]			= 5,
	-- Levels
	["MAX_PLAYER_LEVEL"] 		= 70,
	["WAR_MODE_MAX_LEVEL"]		= 60,
	["MAX_HEIRLOOM_LEVEL"]		= 59,
	-- Dragonriding
	["DRAGONRIDING_TREE_ID"] 	= 672,
}
addonTable.CONSTANTS = CONSTANTS