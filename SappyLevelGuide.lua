--[[
	The purpose of the addon is to make MY questing route faster.
]]--

--[[ TODO
	- Figure out the event that fires when the flight path map is opened.
	- Figure out how to take a flight path programmatically.
	- Figure out the event that fires when a flight path is taken.
		- Mark 'shouldTakeFlightPath' as false here.
	
	- Figure out the event(s) that fire when a quest is auto accepted.
	- Figure out how to automatically acknowledge and auto accepted quest so the notification clears from the quest objective tracker.
	
	- Figure out how to auto claim quest rewards.
]]--

--[[
	These variables are provided to the addon by Blizzard.
		addonName	: This is self explanatory, but it's the name of the addon.
		t			: This is an empty table. This is how the addon can communicate between files or local functions, sort of like traditional classes.
]]--
local addonName, t = ...;

-- Variables
local e = CreateFrame("Frame");
local map = 0;
local shouldTakeFlightPath = false;
local title = "";

e:RegisterEvent("ADDON_LOADED");
e:RegisterEvent("CINEMATIC_START");
e:RegisterEvent("QUEST_ACCEPTED");
e:RegisterEvent("QUEST_DATA_LOAD_RESULT");
e:RegisterEvent("QUEST_DETAIL");
e:RegisterEvent("ZONE_CHANGED_NEW_AREA");
e:SetScript("OnEvent", function(self, event, addon)
	if (event == "ADDON_LOADED" and addon == addonName) then
		map = C_Map.GetBestMapForUnit("player");
	end
	if (event == "CINEMATIC_START") then
		local canBeCancelled = CanCancelScene();
		if (canBeCancelled and t.quests[map][title]["cancelCinematic"]) then
			StopCinematic();
		end
	end
	if (event == "QUEST_ACCEPTED") then
		if (t.quests[map][title]["flightPath"]) then -- The quest has a flight path that should be taken.
			shouldTakeFlightPath = true;
		end
	end
	if (event == "QUEST_DATA_LOAD_RESULT" or event == "QUEST_DETAIL") then
		local id = ...;
		if (QuestFrame) then
			if (id) then -- The quest's ID is available, so let's use that.
				title = select(2, C_QuestLine.GetQuestLineInfo(id, map); 
			else
				title = QuestInfoTitleHeader:GetText();
			end
			
			if (title) then
				print(t.quests[map][title]["id"]);
			end
		end
	end
	if (event == "ZONE_CHANGED_NEW_AREA") then
		map = C_Map.GetBestMapForUnit("player");
	end
end);