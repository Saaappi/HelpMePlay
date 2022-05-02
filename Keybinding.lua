local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

BINDING_HEADER_HELPMEPLAY = "HelpMePlay"
BINDING_NAME_HELPMEPLAY_OPEN_SETTINGS = L_GLOBALSTRINGS["Open Settings"]
BINDING_NAME_HELPMEPLAY_LEARN_ALL_TRANSMOG = L_GLOBALSTRINGS["Learn All Transmog"]
BINDING_NAME_HELPMEPLAY_CALCULATE_REAGENTS = L_GLOBALSTRINGS["Calculate Reagents"]

function HelpMePlayKeyPressHandler(key)
	if key == GetBindingKey("HELPMEPLAY_OPEN_SETTINGS") then
		HelpMePlayLoadSettings()
	elseif key == GetBindingKey("HELPMEPLAY_LEARN_ALL_TRANSMOG") then
		HelpMePlay_GetEquippedItems()
	elseif key == GetBindingKey("HELPMEPLAY_CALCULATE_REAGENTS") then
		HelpMePlay_CalculateReagents()
	end
end