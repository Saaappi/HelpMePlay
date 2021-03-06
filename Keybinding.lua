local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

BINDING_HEADER_HELPMEPLAY = "HelpMePlay"
BINDING_NAME_HELPMEPLAY_OPEN_SETTINGS = L_GLOBALSTRINGS["Open Settings"]
BINDING_NAME_HELPMEPLAY_CALCULATE_REAGENTS = L_GLOBALSTRINGS["Calculate Reagents"]
BINDING_NAME_HELPMEPLAY_ADD_TO_JUNKER = L_GLOBALSTRINGS["Add to Junker"]
BINDING_NAME_HELPMEPLAY_ADD_TO_JUNKER_BLACKLIST = L_GLOBALSTRINGS["Add to Junker Blacklist"]
BINDING_NAME_HELPMEPLAY_ADD_TO_JUNKER_GLOBAL = L_GLOBALSTRINGS["Add to Junker Global"]
BINDING_NAME_HELPMEPLAY_ADD_TO_JUNKER_GLOBAL_BLACKLIST = L_GLOBALSTRINGS["Add to Junker Global Blacklist"]

function HelpMePlayKeyPressHandler(key)
	if key == GetBindingKey("HELPMEPLAY_OPEN_SETTINGS") then
		HelpMePlayLoadSettings()
	elseif key == GetBindingKey("HELPMEPLAY_CALCULATE_REAGENTS") then
		HelpMePlay_CalculateReagents()
	elseif key == GetBindingKey("HELPMEPLAY_ADD_TO_JUNKER") then
		if GameTooltip:IsVisible() then
			local _, itemLink = GameTooltip:GetItem()
			if itemLink then
				local _, itemId = string.split(":", itemLink); itemId = tonumber(itemId)
				local _, _, itemQuality = GetItemInfo(itemLink)
				if itemQuality > 0 then
					if HelpMePlayJunkerDB[itemId] then
						HelpMePlayJunkerDB[itemId] = nil
					else
						HelpMePlayJunkerBlacklistDB[itemId] = nil
						HelpMePlayJunkerDB[itemId] = true
						print(string.format(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Added Item Text"], itemLink))
					end
				end
			end
		end
	elseif key == GetBindingKey("HELPMEPLAY_ADD_TO_JUNKER_GLOBAL") then
		if GameTooltip:IsVisible() then
			local _, itemLink = GameTooltip:GetItem()
			if itemLink then
				local _, itemId = string.split(":", itemLink); itemId = tonumber(itemId)
				local _, _, itemQuality = GetItemInfo(itemLink)
				if itemQuality > 0 then
					if HelpMePlayJunkerGlobalDB[itemId] then
						HelpMePlayJunkerDB[itemId] = nil
						HelpMePlayJunkerGlobalDB[itemId] = nil
					else
						HelpMePlayJunkerBlacklistDB[itemId] = nil
						HelpMePlayJunkerGlobalBlacklistDB[itemId] = nil
						HelpMePlayJunkerDB[itemId] = nil
						HelpMePlayJunkerGlobalDB[itemId] = true
						print(string.format(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Added Item Text Global"], itemLink))
					end
				end
			end
		end
	elseif key == GetBindingKey("HELPMEPLAY_ADD_TO_JUNKER_BLACKLIST") then
		if GameTooltip:IsVisible() then
			local _, itemLink = GameTooltip:GetItem()
			if itemLink then
				local _, itemId = string.split(":", itemLink); itemId = tonumber(itemId)
				if HelpMePlayJunkerBlacklistDB[itemId] then
					HelpMePlayJunkerBlacklistDB[itemId] = nil
				else
					HelpMePlayJunkerDB[itemId] = nil
					HelpMePlayJunkerBlacklistDB[itemId] = true
					print(string.format(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Blacklisted Item Text"], itemLink))
				end
			end
		end
	elseif key == GetBindingKey("HELPMEPLAY_ADD_TO_JUNKER_GLOBAL_BLACKLIST") then
		if GameTooltip:IsVisible() then
			local _, itemLink = GameTooltip:GetItem()
			if itemLink then
				local _, itemId = string.split(":", itemLink); itemId = tonumber(itemId)
				if HelpMePlayJunkerGlobalBlacklistDB[itemId] then
					HelpMePlayJunkerBlacklistDB[itemId] = nil
					HelpMePlayJunkerGlobalBlacklistDB[itemId] = nil
				else
					HelpMePlayJunkerDB[itemId] = nil
					HelpMePlayJunkerGlobalDB[itemId] = nil
					HelpMePlayJunkerGlobalBlacklistDB[itemId] = true
					print(string.format(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Blacklisted Item Text Global"], itemLink))
				end
			end
		end
	end
end