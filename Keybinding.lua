local addonName, addon = ...
local e = CreateFrame("Frame")

BINDING_HEADER_HELPMEPLAY = "HelpMePlay"
BINDING_NAME_HELPMEPLAY_OPEN_SETTINGS = "Open Settings"
BINDING_NAME_HELPMEPLAY_ADD_TO_JUNKER = "Add to Junker"
BINDING_NAME_HELPMEPLAY_ADD_TO_JUNKER_BLACKLIST = "Add to Junker Blacklist"
BINDING_NAME_HELPMEPLAY_ADD_TO_JUNKER_GLOBAL = "Add to Junker Global"
BINDING_NAME_HELPMEPLAY_ADD_TO_JUNKER_GLOBAL_BLACKLIST = "Add to Junker Global Blacklist"

function HelpMePlayKeyPressHandler(key)
	if key == GetBindingKey("HELPMEPLAY_OPEN_SETTINGS") then
		Settings.OpenToCategory(addonName)
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
					if HelpMePlayDB.Junker.GlobalDB[itemId] then
						HelpMePlayJunkerDB[itemId] = nil
						HelpMePlayDB.Junker.GlobalDB[itemId] = nil
					else
						HelpMePlayJunkerBlacklistDB[itemId] = nil
						HelpMePlayDB.Junker.GlobalBlacklistDB[itemId] = nil
						HelpMePlayJunkerDB[itemId] = nil
						HelpMePlayDB.Junker.GlobalDB[itemId] = true
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
				end
			end
		end
	elseif key == GetBindingKey("HELPMEPLAY_ADD_TO_JUNKER_GLOBAL_BLACKLIST") then
		if GameTooltip:IsVisible() then
			local _, itemLink = GameTooltip:GetItem()
			if itemLink then
				local _, itemId = string.split(":", itemLink); itemId = tonumber(itemId)
				if HelpMePlayDB.Junker.GlobalBlacklistDB[itemId] then
					HelpMePlayJunkerBlacklistDB[itemId] = nil
					HelpMePlayDB.Junker.GlobalBlacklistDB[itemId] = nil
				else
					HelpMePlayJunkerDB[itemId] = nil
					HelpMePlayDB.Junker.GlobalDB[itemId] = nil
					HelpMePlayDB.Junker.GlobalBlacklistDB[itemId] = true
				end
			end
		end
	end
end