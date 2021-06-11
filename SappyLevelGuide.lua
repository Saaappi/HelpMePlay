--[[
	The purpose of the addon is to make MY questing route faster.
]]--

--[[ TODO
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

e:RegisterEvent("ADDON_LOADED");
e:RegisterEvent("QUEST_DETAIL");
e:RegisterEvent("ZONE_CHANGED_NEW_AREA");
e:SetScript("OnEvent", function(self, event, addon)
	if (event == "ADDON_LOADED" and addon == addonName) then
		map = C_Map.GetBestMapForUnit("player");
	end
	if (event == "QUEST_DETAIL") then
		if (QuestFrame) then
			local title = QuestInfoTitleHeader:GetText();
			if (title) then
				print(t.quests[title]["id"]);
			end
		end
	end
	if (event == "ZONE_CHANGED_NEW_AREA") then
		map = C_Map.GetBestMapForUnit("player");
	end
end);