local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
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