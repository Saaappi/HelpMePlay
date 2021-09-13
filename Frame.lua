local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local function ShowTooltip(self, text)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetText(text)
	GameTooltip:Show()
end

local function HideTooltip(self)
	if GameTooltip:GetOwner() == self then
		GameTooltip:Hide()
	end
end

SLASH_HelpMePlay1 = L["Slash HMP"]
SlashCmdList["HelpMePlay"] = function(command, editbox)
	local _, _, command, arguments = string.find(command, "%s?(%w+)%s?(.*)") -- Using pattern matching the addon will be able to interpret subcommands.
	if not command or command == "" then
		if HMPOptionsFrame:IsVisible() then
			HMPOptionsFrame:Hide()
		else
			HMPOptionsFrame:Show()

			-- SetText for FontStrings
			HMPVersionText:SetText(GetAddOnMetadata(addonName, "Version"))
			HMPAdvMapsText:SetText(L["Adventure Maps"])

			-- Check settings first
			if HelpMePlayOptionsDB.AdventureMaps then
				HMPAdvMapsCB:SetChecked(true)
			else
				HMPAdvMapsCB:SetChecked(false)
			end

			-- Close Button
			HMPOptionsFrameCloseButton:SetScript("OnClick", function(self)
				self:GetParent():Hide()
			end)

			-- BFA Adventure Maps Check Button
			HMPAdvMapsCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L["Adventure Maps Check Button"])
			end)
			HMPAdvMapsCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPAdvMapsCB:SetScript("OnClick", function(self)
				if self:GetChecked() then
					HelpMePlayOptionsDB.AdventureMaps = true
				else
					HelpMePlayOptionsDB.AdventureMaps = false
				end
			end)
		end
	elseif command == L["Abandon Command"] then
		local quests = C_QuestLog.GetQuestsOnMap(addonTable.maps[string.upper(arguments)])
		for _, v in ipairs(quests) do
			C_QuestLog.SetSelectedQuest(v.questID)
			C_QuestLog.SetAbandonQuest()
			C_QuestLog.AbandonQuest()
		end
	end
end