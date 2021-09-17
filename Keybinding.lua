local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

BINDING_HEADER_HELPMEPLAY = addonName
BINDING_NAME_HELPMEPLAY_OPEN_SETTINGS = L["Open Settings"]

function HelpMePlayKeyPressHandler(key)
	if key == GetBindingKey("HELPMEPLAY_OPEN_SETTINGS") then
		HelpMePlayLoadSettings()
	end
end