local addonName, addonTable = ...
local e = CreateFrame("Frame")

local function HideFrame(frame)
	if frame == "NPE_PointerFrame" then
		if NPE_PointerFrame_1Content then
			NPE_PointerFrame_1Content:Hide()
			NPE_PointerFrame_1.Glow:Hide()
			NPE_PointerFrame_1.Arrow_UP1:Hide()
			NPE_PointerFrame_1.Arrow_UP2:Hide()
			NPE_PointerFrame_1.Arrow_LEFT1:Hide()
			NPE_PointerFrame_1.Arrow_LEFT2:Hide()
			NPE_PointerFrame_1.Arrow_RIGHT1:Hide()
			NPE_PointerFrame_1.Arrow_RIGHT2:Hide()
			NPE_PointerFrame_1.Arrow_DOWN1:Hide()
			NPE_PointerFrame_1.Arrow_DOWN2:Hide()
		end
		if NPE_PointerFrame_2Content then
			NPE_PointerFrame_2Content:Hide()
			NPE_PointerFrame_2.Glow:Hide()
			NPE_PointerFrame_2.Arrow_UP1:Hide()
			NPE_PointerFrame_2.Arrow_UP2:Hide()
			NPE_PointerFrame_2.Arrow_LEFT1:Hide()
			NPE_PointerFrame_2.Arrow_LEFT2:Hide()
			NPE_PointerFrame_2.Arrow_RIGHT1:Hide()
			NPE_PointerFrame_2.Arrow_RIGHT2:Hide()
			NPE_PointerFrame_2.Arrow_DOWN1:Hide()
			NPE_PointerFrame_2.Arrow_DOWN2:Hide()
		end
	elseif frame == "KeyboardMouseFrame" then
		if NPE_TutorialKeyboardMouseFrame_Frame:IsVisible() then
			NPE_TutorialKeyboardMouseFrame_Frame:Hide()
		end
	elseif frame == "TutorialMainFrame" then
		if NPE_TutorialMainFrame_Frame:IsVisible() then
			NPE_TutorialMainFrame_Frame:Hide()
			NPE_TutorialWalk_Frame:Hide()
		end
	end
end

e:RegisterEvent("GET_ITEM_INFO_RECEIVED")
e:RegisterEvent("CHAT_MSG_LOOT")
e:RegisterEvent("LEARNED_SPELL_IN_TAB")
e:RegisterEvent("PLAYER_ENTERING_WORLD")
e:RegisterEvent("PLAYER_XP_UPDATE")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GET_ITEM_INFO_RECEIVED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.HideNPE == false or HelpMePlayDB.HideNPE == nil then return false end
		
		if ContainerFrame1:IsVisible() then
			local mapId = C_Map.GetBestMapForUnit("player")
			if mapId == 1409 or mapId == 1609 or mapId == 1610 then
				HideFrame("NPE_PointerFrame")
			end
		end
	end
	
	if event == "CHAT_MSG_LOOT" or event == "LEARNED_SPELL_IN_TAB" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.HideNPE == false or HelpMePlayDB.HideNPE == nil then return false end
		
		local mapId = C_Map.GetBestMapForUnit("player")
		if mapId == 1409 or mapId == 1609 or mapId == 1610 then
			HideFrame("NPE_PointerFrame")
		end
	end
	
	if event == "PLAYER_ENTERING_WORLD" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.HideNPE == false or HelpMePlayDB.HideNPE == nil then return false end
		
		local mapId = C_Map.GetBestMapForUnit("player")
		if mapId == 1726 or mapId == 1727 then
			HideFrame("KeyboardMouseFrame")
			HideFrame("TutorialMainFrame")
		end
	end
	
	if event == "PLAYER_XP_UPDATE" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.HideNPE == false or HelpMePlayDB.HideNPE == nil then return false end
		
		local mapId = C_Map.GetBestMapForUnit("player")
		if mapId == 1726 or mapId == 1727 then
			HideFrame("NPE_PointerFrame")
		end
	end
end)