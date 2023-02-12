local addonName, addonTable = ...
local e = CreateFrame("Frame")
local normalTexture = e:CreateTexture()
local highlightTexture = e:CreateTexture()
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local HMPQueueButton = _G.CreateFrame(
	"Button",
	"HMPQueueButton",
	_G.CharacterMicroButton,
	"UIPanelButtonTemplate"
)
local HMPDungeonQueueButton = _G.CreateFrame(
	"Button",
	"HMPDungeonQueueButton",
	_G.CharacterMicroButton,
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
e:RegisterEvent("LFG_ROLE_CHECK_SHOW")
e:RegisterEvent("ZONE_CHANGED_NEW_AREA")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.HolidayQueuesEnabled then
			-- Put the holiday data (stored in MainDB) into a table local to this file.
			local HOLIDAYS = addonTable.HOLIDAYS
			
			-- Create a couple boolean variables. The first will determine if the holiday
			-- button should be visible or hidden.
			-- The second will determine whether or not the current character has collected
			-- the daily reward or not.
			local hideButton = false
			local isRewardCollected = false
			
			-- Get the current calendar date information such as day, month, year, and time.
			local calendarDate = C_DateAndTime.GetCurrentCalendarTime()
			
			-- Create a new variable that will the time since the epoch based on the current
			-- date information shown below.
			local timestamp = time({
				year 	= calendarDate.year,
				month 	= calendarDate.month,
				day 	= calendarDate.monthDay,
				hour 	= calendarDate.hour,
				minute 	= calendarDate.minute,
			})
			
			-- From the first event in the day to the last event of the day, let's check for any
			-- holidays we're interested in showing a button for.
			for i = 1, C_Calendar.GetNumDayEvents(0, calendarDate.monthDay) do
				-- Get the information about the event, such as its start and end datetime information
				-- and store it in the variable.
				local event = C_Calendar.GetDayEvent(0, calendarDate.monthDay, i)
				if event then
					-- Assuming the event is storing an event and isn't nil, let's ensure it's
					-- an event we're interested in by checking the keys in our HOLIDAY table.
					if HOLIDAYS[event.eventID] then
						-- Now that we know it's an event we're interested in, let's build
						-- a couple variables to hold the epoch values for the start and
						-- end times of the event.
						local eventStart = time({
							year 	= event.startTime.year,
							month 	= event.startTime.month,
							day 	= event.startTime.monthDay,
							hour 	= event.startTime.hour,
							minute 	= event.startTime.minute,
						})
						local eventEnd = time({
							year 	= event.endTime.year,
							month 	= event.endTime.month,
							day 	= event.endTime.monthDay,
							hour 	= event.endTime.hour,
							minute 	= event.endTime.minute,
						})
						
						-- Using the 'timestamp' variable created earlier, let's compare it to
						-- the datetime epoch variables we just created to see if the event is
						-- active.
						if (timestamp >= eventStart) and (timestamp <= eventEnd) then
							-- Check if the player has collected the event's mount.
							local mount = C_MountJournal.GetMountInfoByID(HOLIDAYS[event.eventID].mountID)
							local hasMount = mount[11]
							if not hasMount then
								-- Determine if the daily reward has been collected.
								isRewardCollected = GetLFGDungeonRewards(HOLIDAYS[event.eventID].rewardID)
								if not isRewardCollected then
									-- Set the button's texture (holiday mount icon).
									normalTexture:SetTexture(HOLIDAYS[event.eventID].icon)
									normalTexture:SetSize(HOLIDAYS[event.eventID].width, HOLIDAYS[event.eventID].height)
									
									-- Set the highlight texture for the button.
									highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
									highlightTexture:SetSize(24, 23)
									
									-- Register the button for left and right clicks.
									HMPQueueButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
									
									-- Apply the textures to the button.
									HMPQueueButton:SetNormalTexture(normalTexture)
									HMPQueueButton:SetHighlightTexture(highlightTexture, "ADD")
								else
									hideButton = true
								end
							end
						else
							hideButton = true
						end
					end
				end
			end
			
			-- Set the size and position of the button.
			HMPQueueButton:SetSize(28, 26)
			HMPQueueButton:SetPoint("RIGHT", -20, 0)
			
			-- If the daily reward is uncollected, the player's level is at or above the minimum level,
			-- and the button should be visible, then show the button, else hide it.
			C_Timer.After(5, function()
				if (not isRewardCollected) and (UnitLevel("player") >= addonTable.CONSTANTS["MIN_DUNGEON_RWD_LEVEL"]) and (hideButton == false) then
					HMPQueueButton:Show()
				else
					HMPQueueButton:Hide()
				end
			end)
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
	
	if event == "LFG_ROLE_CHECK_SHOW" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.QueuesEnabled then
			LFDRoleCheckPopupAcceptButton:Click()
		end
	end
	
	if event == "ZONE_CHANGED_NEW_AREA" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.HolidayQueuesEnabled then
			local calendarDate = C_DateAndTime.GetCurrentCalendarTime()
			if calendarDate.month == 10 and calendarDate.monthDay > 6 then -- Hallow's End
				local isRewardCollected = GetLFGDungeonRewards(285)
				if isRewardCollected then
					HMPQueueButton:Hide()
				end
			elseif calendarDate.month == 9 or calendarDate.month == 10 then -- Brewfest
				local isRewardCollected = GetLFGDungeonRewards(287)
				if isRewardCollected then
					HMPQueueButton:Hide()
				end
			elseif calendarDate.month == 2 then -- Love is in the Air
				local isRewardCollected = GetLFGDungeonRewards(288)
				if isRewardCollected then
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
		
		if calendarDate.month == 10 and calendarDate.monthDay > 6 then -- Hallow's End
			LFG_JoinDungeon(LE_LFG_CATEGORY_LFD, 285, LFDDungeonList, LFDHiddenByCollapseList)
		elseif calendarDate.month == 9 or calendarDate.month == 10 then -- Brewfest
			LFG_JoinDungeon(LE_LFG_CATEGORY_LFD, 287, LFDDungeonList, LFDHiddenByCollapseList)
		elseif calendarDate.month == 2 then -- Love is in the Air
			LFG_JoinDungeon(LE_LFG_CATEGORY_LFD, 288, LFDDungeonList, LFDHiddenByCollapseList)
		end
	end
end)

HMPQueueButton:HookScript("OnEnter", function(self)
	local calendarDate = C_DateAndTime.GetCurrentCalendarTime()
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	
	if calendarDate.month == 10 and calendarDate.monthDay > 6 then -- Hallow's End
		GameTooltip:SetText(L_GLOBALSTRINGS["Holiday.HallowsEnd"])
	elseif calendarDate.month == 9 or calendarDate.month == 10 then -- Brewfest
		GameTooltip:SetText(L_GLOBALSTRINGS["Holiday.Brewfest"])
	elseif calendarDate.month == 2 then -- Love is in the Air
		GameTooltip:SetText(L_GLOBALSTRINGS["Holiday.LoveIsInTheAir"])
	end

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