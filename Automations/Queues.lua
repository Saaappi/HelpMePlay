local addonName, addonTable = ...
local e = CreateFrame("Frame")
local normalTexture = e:CreateTexture()
local highlightTexture = e:CreateTexture()
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

LFGDungeonReadyDialogEnterDungeonButton:SetScript("OnShow", function()
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if HelpMePlayDB.QueuesEnabled then
		LFGDungeonReadyDialogEnterDungeonButton:Click()
	end
end)

addonTable.HMPQueueButton = _G.CreateFrame(
	"Button",
	"HMPQueueButton",
	_G.CharacterMicroButton,
	"OptionsButtonTemplate"
)

e:RegisterEvent("PLAYER_LOGIN")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_LOGIN" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.QueuesEnabled then
			if C_QuestLog.IsQuestFlaggedCompleted(25482) == false and date("%m") == "10" then -- Headless Horseman
				if not select(11, C_MountJournal.GetMountInfoByID(219)) then
					if date("%m/%d %H:%M") <= "11/01 11:00" then
						normalTexture:SetTexture("Interface\\ICONS\\inv_belt_12")
						normalTexture:SetSize(28, 26)
					end
				end
			elseif C_QuestLog.IsQuestFlaggedCompleted(25485) == false and date("%m") == "02" then -- Love is in the Air
				if not select(11, C_MountJournal.GetMountInfoByID(352)) then
					if date("%m/%d %H:%M") <= "02/20 10:00" then
						normalTexture:SetTexture("Interface\\ICONS\\inv_rocketmountpink")
						normalTexture:SetSize(28, 26)
					end
				end
			elseif C_QuestLog.IsQuestFlaggedCompleted(25483) == false and date("%m") == "09" then -- Brewfest
				if not select(11, C_MountJournal.GetMountInfoByID(202)) or not select(11, C_MountJournal.GetMountInfoByID(226)) then
					if date("%m/%d %H:%M") <= "10/06 10:00" then
						normalTexture:SetTexture("Interface\\ICONS\\inv_rocketmountpink")
						normalTexture:SetSize(28, 26)
					end
				end
			end
			
			highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
			highlightTexture:SetSize(24, 23)
			
			HMPQueueButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
			
			HMPQueueButton:SetNormalTexture(normalTexture)
			HMPQueueButton:SetHighlightTexture(highlightTexture, "ADD")
			
			HMPQueueButton:SetSize(28, 26)
			HMPQueueButton:SetPoint("LEFT", -30, 0)
			
			HMPQueueButton:Show()
		end
	end
end)

HMPQueueButton:HookScript("OnClick", function(self)
	if date("%m/%d %H:%M") <= "11/01 11:00" then
		PVEFrame:Show(); DropDownList1Button2:Click(); LFDQueueFrameFindGroupButton:Click(); PVEFrame:Hide()
	end
end)

HMPQueueButton:HookScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetText(L_GLOBALSTRINGS["UI.Button.Queue.Desc"])
	GameTooltip:Show()
end)

HMPQueueButton:HookScript("OnLeave", function(self)
	if GameTooltip:GetOwner() == self then
		GameTooltip:Hide()
	end
end)