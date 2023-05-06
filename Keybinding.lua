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
					if HelpMePlayCharacterDB.Junker.DB[itemId] then
						HelpMePlayCharacterDB.Junker.DB[itemId] = nil
					else
						HelpMePlayCharacterDB.Junker.BlacklistDB[itemId] = nil
						HelpMePlayCharacterDB.Junker.DB[itemId] = true
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
						HelpMePlayCharacterDB.Junker.DB[itemId] = nil
						HelpMePlayDB.Junker.GlobalDB[itemId] = nil
					else
						HelpMePlayCharacterDB.Junker.BlacklistDB[itemId] = nil
						HelpMePlayDB.Junker.GlobalBlacklistDB[itemId] = nil
						HelpMePlayCharacterDB.Junker.DB[itemId] = nil
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
				if HelpMePlayCharacterDB.Junker.BlacklistDB[itemId] then
					HelpMePlayCharacterDB.Junker.BlacklistDB[itemId] = nil
				else
					HelpMePlayCharacterDB.Junker.DB[itemId] = nil
					HelpMePlayCharacterDB.Junker.BlacklistDB[itemId] = true
				end
			end
		end
	elseif key == GetBindingKey("HELPMEPLAY_ADD_TO_JUNKER_GLOBAL_BLACKLIST") then
		if GameTooltip:IsVisible() then
			local _, itemLink = GameTooltip:GetItem()
			if itemLink then
				local _, itemId = string.split(":", itemLink); itemId = tonumber(itemId)
				if HelpMePlayDB.Junker.GlobalBlacklistDB[itemId] then
					HelpMePlayCharacterDB.Junker.BlacklistDB[itemId] = nil
					HelpMePlayDB.Junker.GlobalBlacklistDB[itemId] = nil
				else
					HelpMePlayCharacterDB.Junker.DB[itemId] = nil
					HelpMePlayDB.Junker.GlobalDB[itemId] = nil
					HelpMePlayDB.Junker.GlobalBlacklistDB[itemId] = true
				end
			end
		end
	end
end