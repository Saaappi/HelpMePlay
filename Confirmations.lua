local addonName, t = ...
local e = CreateFrame("Frame")

e:RegisterEvent("PLAYER_CHOICE_UPDATE")

e:SetScript("OnEvent", function(self, event, ...)
	if (event == "PLAYER_CHOICE_UPDATE") then
		C_Timer.After(0, function()
			C_Timer.After(4, function()
				StaticPopup1EditBox:SetText("FATE")
			end)
		end)
	end
end)