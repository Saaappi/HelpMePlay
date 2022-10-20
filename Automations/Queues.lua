local addonName, addonTable = ...
local e = CreateFrame("Frame")
local normalTexture = e:CreateTexture()
local highlightTexture = e:CreateTexture()
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local HMPQueueButton = _G.CreateFrame(
	"Button",
	"HMPQueueButton",
	_G.CharacterMicroButton,
	"OptionsButtonTemplate"
)

local function GetTimeForHoliday(eventId)
	local startTime, endTime = "", ""
	local numEvents = C_Calendar.GetNumDayEvents(0, date("%d"))
	for i = 1, numEvents do
		local eventData = C_Calendar.GetDayEvent(0, date("%d"), i)
		if eventData.eventID == eventId then
			startTime = eventData.startTime.month .. "/" .. eventData.startTime.monthDay .. " " .. eventData.startTime.hour .. ":00"
			endTime = eventData.endTime.month .. "/" .. eventData.endTime.monthDay .. " " .. eventData.endTime.hour .. ":00"
			break
		end
	end
	return startTime, endTime
end

LFGDungeonReadyDialogEnterDungeonButton:SetScript("OnShow", function()
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if HelpMePlayDB.QueuesEnabled then
		LFGDungeonReadyDialogEnterDungeonButton:Click()
	end
end)

e:RegisterEvent("PLAYER_ENTERING_WORLD")
e:RegisterEvent("ZONE_CHANGED_NEW_AREA")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.HolidayQueuesEnabled then
			local isInitialLogin, isReload = ...
			if isInitialLogin or isReload then
				if date("%m") == "10" then
					local startTime, endTime = GetTimeForHoliday(324) -- Hallow's End
					if date("%m/%d %H:%M") >= startTime and date("%m/%d %H:%M") <= endTime then
						local isDailyRewardCollected = GetLFGDungeonRewards(285)
						if isDailyRewardCollected == false then
							if not select(11, C_MountJournal.GetMountInfoByID(219)) then
								normalTexture:SetTexture("Interface\\ICONS\\inv_belt_12")
								normalTexture:SetSize(28, 26)
							end
						end
					end
				elseif date("%m") == "09" then
					local startTime, endTime = GetTimeForHoliday(372) -- Brewfest
					if date("%m/%d %H:%M") >= startTime and date("%m/%d %H:%M") <= endTime then
						local isDailyRewardCollected = GetLFGDungeonRewards(287)
						if isDailyRewardCollected == false then
							if not select(11, C_MountJournal.GetMountInfoByID(202)) or not select(11, C_MountJournal.GetMountInfoByID(226)) then
								normalTexture:SetTexture("Interface\\ICONS\\ability_mount_kotobrewfest")
								normalTexture:SetSize(28, 26)
							end
						end
					end
				elseif date("%m") == "02" then
					local startTime, endTime = GetTimeForHoliday(423) -- Love is in the Air
					if date("%m/%d %H:%M") >= startTime and date("%m/%d %H:%M") <= endTime then
						local isDailyRewardCollected = GetLFGDungeonRewards(288)
						if isDailyRewardCollected == false then
							if not select(11, C_MountJournal.GetMountInfoByID(352)) then
								normalTexture:SetTexture("Interface\\ICONS\\inv_rocketmountpink")
								normalTexture:SetSize(28, 26)
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
				HMPQueueButton:SetPoint("LEFT", -30, 0)

				HMPQueueButton:Show()
			end
		end
	end
	if event == "ZONE_CHANGED_NEW_AREA" then
		if date("%m") == "10" then -- Hallow's End
			local isDailyRewardCollected = GetLFGDungeonRewards(285)
			if isDailyRewardCollected then
				HMPQueueButton:Hide()
			end
		elseif date("%m") == "09" then -- Brewfest
			local isDailyRewardCollected = GetLFGDungeonRewards(287)
			if isDailyRewardCollected then
				HMPQueueButton:Hide()
			end
		elseif date("%m") == "02" then -- Love is in the Air
			local isDailyRewardCollected = GetLFGDungeonRewards(288)
			if isDailyRewardCollected then
				HMPQueueButton:Hide()
			end
		end
	end
end)

HMPQueueButton:HookScript("OnClick", function(self)
	SetLFGRoles(false, true, true, true)
	if date("%m/%d %H:%M") <= "11/01 11:00" then -- Hallow's End
		LFG_JoinDungeon(LE_LFG_CATEGORY_LFD, 285, LFDDungeonList, LFDHiddenByCollapseList)
	elseif date("%m/%d %H:%M") <= "02/20 10:00" then -- Love is in the Air
		LFG_JoinDungeon(LE_LFG_CATEGORY_LFD, 288, LFDDungeonList, LFDHiddenByCollapseList)
	elseif date("%m/%d %H:%M") <= "10/06 10:00" then -- Brewfest
		LFG_JoinDungeon(LE_LFG_CATEGORY_LFD, 287, LFDDungeonList, LFDHiddenByCollapseList)
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