local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local COVENANT_ICONS = {
	["Kyrian"]				= "|T3257748:0|t",
	["Necrolord"]			= "|T3257749:0|t",
	["Night Fae"]			= "|T3257750:0|t",
	["Venthyr"]				= "|T3257751:0|t",
}
local ZONE_ICONS = {
	-- Kul Tiras
	["Drustvar"]			= "|T2065567:0|t",
	["Stormsong Valley"]	= "|T2065627:0|t",
	["Tiragarde Sound"]		= "|T2065630:0|t",
	-- Zandalar
	["Nazmir"]				= "|T2032229:0|t",
	["Vol'dun"]				= "|T2065632:0|t",
	["Zuldazar"]			= "|T2065640:0|t",
	-- Shadowlands
	["Ardenweald"]			= "|T3551336:0|t",
	["Bastion"]				= "|T3551337:0|t",
	["Maldraxxus"]			= "|T3551338:0|t",
	["Torghast"]			= "|T3642306:0|t",
	["Revendreth"]			= "|T3551339:0|t",
}

addonTable.COVENANT_ICONS = COVENANT_ICONS
addonTable.ZONE_ICONS = ZONE_ICONS