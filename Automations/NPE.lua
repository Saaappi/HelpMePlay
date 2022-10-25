local addonName, addonTable = ...
local e = CreateFrame("Frame")

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addon, ...)
	if event == "ADDON_LOADED" and addon == "Blizzard_NewPlayerExperience" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.HideNPE == false or HelpMePlayDB.HideNPE == nil then return false end
		
		hooksecurefunc(NPE_TutorialKeyboardMouseFrame_Frame, "ShowTutorial", function(self)
			self:Hide()
		end)
		hooksecurefunc(NPE_TutorialMainFrame_Frame, "ShowTutorial", function(self)
			self:Hide()
		end)
		hooksecurefunc(NPE_TutorialPointerFrame, "Show", function(self)
			for i = 1, 2 do
				local frame = _G["NPE_PointerFrame_"..i]
				if frame then
					frame:Hide()
				end
			end
			
			C_Timer.After(2, function()
				CloseAllBags()
			end)
		end)
	end
end)