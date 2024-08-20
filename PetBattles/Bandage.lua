local addonName, HelpMePlay = ...
local eventFrame = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local button

local bandageID = 86143
local reviveSpellID = 125439
local reviveSpellName = C_Spell.GetSpellInfo(125439).name
local safariHatID = 92738

HelpMePlay.CreatePetBattleBandageButton = function()
	if not button then
		button = HelpMePlay.CreateWidget("SecureButton", {
			name = string.format("%s%s", addonName, "PetBattleBandageButton"),
			scale = 0.65,
			icon = 656581,
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

		button:SetScript("PreClick", function(self, btn)
			if InCombatLockdown() then return end

			local attributeType, attribute, text = "", "", ""

			-- Clear the attributes from the button.
			self:SetAttribute("type", nil)

			local function IsAnyPetInjured()
				for i = 1, 3 do
					local petGUID = C_PetJournal.GetPetLoadOutInfo(i)
					if petGUID then
						local currentHealth, maxHealth = C_PetJournal.GetPetStats(petGUID)
						if currentHealth < maxHealth then
							return true
						end
					end
				end
				return false
			end

			if btn == "LeftButton" then
				if IsAnyPetInjured() then
					local cooldown = select(2, GetSpellCooldown(reviveSpellID))
					if cooldown == 0 then
						attributeType, attribute, text = "macro", "macrotext", "/cast " .. reviveSpellName
					else
						attributeType, attribute, text = "macro", "macrotext", "/use item:" .. bandageID
					end
				end
			elseif btn == "RightButton" then
				attributeType, attribute, text = "toy", "toy", safariHatID
			end

			self:SetAttribute("type", attributeType)
        	self:SetAttribute(attribute, text)
		end)
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