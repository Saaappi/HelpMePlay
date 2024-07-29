local addonName, HelpMePlay = ...
local eventFrame = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local button

HelpMePlay.CreatePetBattleBandageButton = function()
	if not button then
		button = HelpMePlay.CreateWidget("SecureButton", {
			name = format("%s%s", addonName, "PetBattleBandageButton"),
			scale = 0.65,
			icon = 133675,
			isMovable = true,
			saveName = "PetBattleBandageButton"
		})

		button:ClearAllPoints()
		if HelpMePlayDB.Positions["PetBattleBandageButton"] then
			local pos = HelpMePlayDB.Positions["PetBattleBandageButton"]
			button:SetPoint(pos.anchor, pos.parent, pos.relativeAnchor, pos.xOff, pos.yOff)
		else
			button:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
		end

		button:SetScript("PreClick", function(_, _, isDown)
            -- Check if any of the pets are injured. If not, then we return
            -- so as not to waste a bandage.
            local useBandage = false
            for i = 1, 3 do
                local health = C_PetBattles.GetHealth(1, i)
                if health < 100 then
                    useBandage = true
                    break
                end
            end
            if not useBandage then return end
		end)

		button:SetAttribute("type", "macro")
        button:SetAttribute("macrotext", format("/use item:%d", 86143))

		button:SetScript("OnEnter", function(self)
			HelpMePlay.Tooltip_OnEnter(self, LHMP:ColorText("COMMON", "Pet Battles"), HelpMePlay.Tooltips.PetBattleBandageButton)
		end)
		button:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
	end

	if HelpMePlayDB["ShowPetBattleBandageButton"] then
		button:Show()
	else
		button:Hide()
	end
end

local function OnEvent(_, event, ...)
    if event == "PET_BATTLE_CLOSE" then
        if button and not button:IsVisible() then
            button:Show()
        end
    end
    if event == "PET_BATTLE_OPENING_START" then
        if button and button:IsVisible() then
            button:Hide()
        end
    end
    if event == "PLAYER_LOGIN" then
        eventFrame:UnregisterEvent("PLAYER_LOGIN")

        if HelpMePlayDB["ShowPetBattleBandageButton"] == false then return end

        HelpMePlay.CreatePetBattleBandageButton()
    end
end

eventFrame:RegisterEvent("PET_BATTLE_CLOSE")
eventFrame:RegisterEvent("PET_BATTLE_OPENING_START")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:SetScript("OnEvent", OnEvent)