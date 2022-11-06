local addonName, addonTable = ...
local e = CreateFrame("Frame")
local normalTexture = e:CreateTexture()
local highlightTexture = e:CreateTexture()
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local queueInfo = ""
local HMPQueueButton = _G.CreateFrame(
	"Button",
	"HMPQueueButton",
	_G.LFDMicroButton,
	"UIPanelButtonTemplate"
)
local HMPDungeonQueueButton = _G.CreateFrame(
	"Button",
	"HMPDungeonQueueButton",
	_G.LFDMicroButton,
	"UIPanelButtonTemplate"
)

LFGDungeonReadyDialogEnterDungeonButton:SetScript("OnShow", function()
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if HelpMePlayDB.QueuesEnabled then
		LFGDungeonReadyDialogEnterDungeonButton:Click()
	end
end)

e:RegisterEvent("PLAYER_ENTERING_WORLD")
e:RegisterEvent("QUEST_ACCEPTED")
e:RegisterEvent("ZONE_CHANGED_NEW_AREA")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.HolidayQueuesEnabled then
			local isInitialLogin, isReload = ...
			if isInitialLogin or isReload then
				local hideButton = false
				local isDailyRewardCollected = false
				local calendarDate = C_DateAndTime.GetCurrentCalendarTime()
				local timeStamp = calendarDate.month .. "/" .. calendarDate.monthDay .. " " .. calendarDate.hour .. ":" .. calendarDate.minute
				GameTimeFrame:Click(); CalendarCloseButton:Click()
				
				for i = 1, C_Calendar.GetNumDayEvents(0, calendarDate.monthDay) do
					local event = C_Calendar.GetDayEvent(0, calendarDate.monthDay, i)
					if event then
						local startTime = event.startTime.month .. "/" .. event.startTime.monthDay .. " " .. event.startTime.hour .. ":00"
						local endTime = event.endTime.month .. "/" .. event.endTime.monthDay .. " " .. event.endTime.hour .. ":00"
						if event.eventID == 324 then -- Hallow's End
							if timeStamp >= startTime and timeStamp <= endTime then
								isDailyRewardCollected = GetLFGDungeonRewards(285)
								if not isDailyRewardCollected then
									if not select(11, C_MountJournal.GetMountInfoByID(219)) then
										normalTexture:SetTexture("Interface\\ICONS\\inv_belt_12")
										normalTexture:SetSize(28, 26)
									end
								end
							else
								hideButton = true
							end
						elseif event.eventID == 372 then -- Brewfest
							if timeStamp >= startTime and timeStamp <= endTime then
								isDailyRewardCollected = GetLFGDungeonRewards(287)
								if not isDailyRewardCollected then
									if not select(11, C_MountJournal.GetMountInfoByID(202)) or not select(11, C_MountJournal.GetMountInfoByID(226)) then
										normalTexture:SetTexture("Interface\\ICONS\\ability_mount_kotobrewfest")
										normalTexture:SetSize(28, 26)
									end
								end
							else
								hideButton = true
							end
						elseif event.eventID == 423 then -- Love is in the Air
							if timeStamp >= startTime and timeStamp <= endTime then
								isDailyRewardCollected = GetLFGDungeonRewards(288)
								if not isDailyRewardCollected then
									if not select(11, C_MountJournal.GetMountInfoByID(352)) then
										normalTexture:SetTexture("Interface\\ICONS\\inv_rocketmountpink")
										normalTexture:SetSize(28, 26)
									end
								end
							else
								hideButton = true
							end
						end
					end
				end
				highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
				highlightTexture:SetSize(24, 23)
				
				HMPQueueButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
				
				HMPQueueButton:SetNormalTexture(normalTexture)
				HMPQueueButton:SetHighlightTexture(highlightTexture, "ADD")
				
				HMPQueueButton:SetSize(28, 26)
				HMPQueueButton:SetPoint("BOTTOM", 0, 40)

				if not isDailyRewardCollected and UnitLevel("player") >= 50 and hideButton == false then
					HMPQueueButton:Show()
				else
					HMPQueueButton:Hide()
				end
			end
		end
	end
	
	if event == "QUEST_ACCEPTED" then
		local questId = ...
		dungeonInfo = addonTable.DUNGEON_QUEUES_BY_QUEST[questId]
		if dungeonInfo then
			normalTexture:SetTexture(dungeonInfo.t)
			normalTexture:SetSize(28, 26)
			highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
			highlightTexture:SetSize(24, 23)
			
			HMPDungeonQueueButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
			
			HMPDungeonQueueButton:SetNormalTexture(normalTexture)
			HMPDungeonQueueButton:SetHighlightTexture(highlightTexture, "ADD")
			
			HMPDungeonQueueButton:SetSize(28, 26)
			HMPDungeonQueueButton:SetPoint("BOTTOM", 0, 40)
			HMPDungeonQueueButton:Show()
		end
	end
	
	if event == "ZONE_CHANGED_NEW_AREA" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.HolidayQueuesEnabled then
			local calendarDate = C_DateAndTime.GetCurrentCalendarTime()
			if calendarDate.month == 10 and calendarDate.monthDay > 6 then -- Hallow's End
				local isDailyRewardCollected = GetLFGDungeonRewards(285)
				if isDailyRewardCollected then
					HMPQueueButton:Hide()
				end
			elseif calendarDate.month == 9 or calendarDate.month == 10 then -- Brewfest
				local isDailyRewardCollected = GetLFGDungeonRewards(287)
				if isDailyRewardCollected then
					HMPQueueButton:Hide()
				end
			elseif calendarDate.month == 2 then -- Love is in the Air
				local isDailyRewardCollected = GetLFGDungeonRewards(288)
				if isDailyRewardCollected then
					HMPQueueButton:Hide()
				end
			end
		end
	end
end)

HMPQueueButton:HookScript("OnClick", function(self)
	local hasData = GetLFGQueueStats(LE_LFG_CATEGORY_LFD)
	if not hasData then
		local calendarDate = C_DateAndTime.GetCurrentCalendarTime()
		
		local _, _, _, _, role = GetSpecializationInfo(GetSpecialization())
		if role == "TANK" then
			SetLFGRoles(false, true, false, false)
		elseif role == "HEALER" then
			SetLFGRoles(false, false, true, false)
		else
			SetLFGRoles(false, false, false, true)
		end
		
		if calendarDate.month == 10 and calendarDate.monthDay > 6 then
			LFG_JoinDungeon(LE_LFG_CATEGORY_LFD, 285, LFDDungeonList, LFDHiddenByCollapseList)
		elseif calendarDate.month == 9 or calendarDate.month == 10 then -- Love is in the Air
			LFG_JoinDungeon(LE_LFG_CATEGORY_LFD, 288, LFDDungeonList, LFDHiddenByCollapseList)
		elseif calendarDate.month == 2 then -- Brewfest
			LFG_JoinDungeon(LE_LFG_CATEGORY_LFD, 287, LFDDungeonList, LFDHiddenByCollapseList)
		end
	end
end)

HMPQueueButton:HookScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetText(L_GLOBALSTRINGS["UI.Button.HolidayQueue.Desc"])
	GameTooltip:Show()
end)

HMPQueueButton:HookScript("OnLeave", function(self)
	if GameTooltip:GetOwner() == self then
		GameTooltip:Hide()
	end
end)

HMPDungeonQueueButton:HookScript("OnClick", function(self)
	local hasData = GetLFGQueueStats(LE_LFG_CATEGORY_LFD)
	if not hasData then
		LFG_JoinDungeon(LE_LFG_CATEGORY_LFD, dungeonInfo.id, LFDDungeonList, LFDHiddenByCollapseList)
	end
	HMPDungeonQueueButton:Hide()
end)

HMPDungeonQueueButton:HookScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetText(string.format(L_GLOBALSTRINGS["UI.Button.DungeonQueue.Desc"], "|cffFFD100" .. dungeonInfo.n .. "|r"))
	GameTooltip:Show()
end)

HMPDungeonQueueButton:HookScript("OnLeave", function(self)
	if GameTooltip:GetOwner() == self then
		GameTooltip:Hide()
	end
end)