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
		if HelpMePlayOptionsFrame:IsVisible() then
			HelpMePlayOptionsFrame:Hide()
		else
			HelpMePlayOptionsFrame:Show()

			HelpMePlayOptionsFrameCloseButton:SetScript("OnClick", function(self)
				self:GetParent():Hide()
			end)

			HMPAdvMapsCB_BFA:SetScript("OnEnter", function(self)
				ShowTooltip(self, L["BFA Adventure Maps Check Button"])
			end)
			HMPAdvMapsCB_BFA:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)

			--[[HelpMePlayCommandsInfoHoverTexture:SetScript("OnEnter", function(self)
				ShowTooltip(self, L["Available Commands"] .. "\n" .. 
					L["Abandon Command"] .. ": " .. L["Abandon Command Description"]
				)
			end)
			HelpMePlayCommandsInfoHoverTexture:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)]]
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