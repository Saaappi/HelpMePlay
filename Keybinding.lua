local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

BINDING_HEADER_HELPMEPLAY = "HelpMePlay"
BINDING_NAME_HELPMEPLAY_OPEN_SETTINGS = L_GLOBALSTRINGS["Open Settings"]

function HelpMePlayKeyPressHandler(key)
	if key == GetBindingKey("HELPMEPLAY_OPEN_SETTINGS") then
		HelpMePlayLoadSettings()
	end
end