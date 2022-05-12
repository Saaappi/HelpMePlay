local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

BINDING_HEADER_HELPMEPLAY = "HelpMePlay"
BINDING_NAME_HELPMEPLAY_OPEN_SETTINGS = L_GLOBALSTRINGS["Open Settings"]
BINDING_NAME_HELPMEPLAY_LEARN_ALL_TRANSMOG = L_GLOBALSTRINGS["Learn All Transmog"]
BINDING_NAME_HELPMEPLAY_CALCULATE_REAGENTS = L_GLOBALSTRINGS["Calculate Reagents"]
BINDING_NAME_HELPMEPLAY_ADD_TO_JUNKER = L_GLOBALSTRINGS["Add to Junker"]

function HelpMePlayKeyPressHandler(key)
	if key == GetBindingKey("HELPMEPLAY_OPEN_SETTINGS") then
		HelpMePlayLoadSettings()
	elseif key == GetBindingKey("HELPMEPLAY_LEARN_ALL_TRANSMOG") then
		HelpMePlay_GetEquippedItems()
	elseif key == GetBindingKey("HELPMEPLAY_CALCULATE_REAGENTS") then
		HelpMePlay_CalculateReagents()
	elseif key == GetBindingKey("HELPMEPLAY_ADD_TO_JUNKER") then
		if GameTooltip:IsVisible() then
			local _, itemLink = GameTooltip:GetItem()
			if itemLink then
				local _, itemId = string.split(":", itemLink); itemId = tonumber(itemId)
				if HelpMePlayJunkerDB[itemId] then
					HelpMePlayJunkerDB[itemId] = nil
					print(string.format(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Removed Item Text"], itemLink))
				else
					HelpMePlayJunkerDB[itemId] = true
					print(string.format(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Added Item Text"], itemLink))
				end
			end
		end
	end
end