local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addonLoaded)
	if event == "ADDON_LOADED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		
		if addonLoaded == "Blizzard_BarbershopUI" then
			-- Save Button
			local HMPBarberShopSaveButton = _G.CreateFrame(
				"Button",
				"HMPBarberShopSaveButton",
				_G.BarberShopFrame.ResetButton,
				"BarberShopButtonTemplate"
			)
			HMPBarberShopSaveButton:SetText("Save")
			HMPBarberShopSaveButton:SetPoint("TOP", 0, 100)
			HMPBarberShopSaveButton:Show()
			
			HMPBarberShopSaveButton:HookScript("OnClick", function(self)
				local _, _, classID = UnitClass("player")
				local characterData = C_BarberShop.GetCurrentCharacterData()
				local customizations = C_BarberShop.GetAvailableCustomizations()
				local sexID = tostring(characterData.sex)
				local choices = {}
				
				if not customizations or not characterData then
					return
				end
				
				-- Create the table structure, if needed.
				if HelpMePlayDB.BarberShop[characterData.name] == nil then
					HelpMePlayDB.BarberShop[characterData.name] = {}
					HelpMePlayDB.BarberShop[characterData.name][classID] = {
						["0"] = {}, -- Male
						["1"] = {}, -- Female
					}
				end
				
				for customizationID, customization in ipairs(customizations) do
					for optionID, option in ipairs(customization.options) do
						choices[option.id] = option.choices[option.currentChoiceIndex].id
					end
				end
				HelpMePlayDB.BarberShop[characterData.name][classID][sexID] = choices
			end)
			
			-- Load Button
			local HMPBarberShopLoadButton = _G.CreateFrame(
				"Button",
				"HMPBarberShopLoadButton",
				HMPBarberShopSaveButton,
				"BarberShopButtonTemplate"
			)
			HMPBarberShopLoadButton:SetText("Load")
			HMPBarberShopLoadButton:SetPoint("TOP", 0, 50)
			HMPBarberShopLoadButton:Show()
			
			HMPBarberShopLoadButton:HookScript("OnClick", function(self)
				local _, _, classID = UnitClass("player")
				local characterData = C_BarberShop.GetCurrentCharacterData()
				local sexID = tostring(characterData.sex)
				
				if HelpMePlayDB.BarberShop[classID] ~= nil then
					if next(HelpMePlayDB.BarberShop[characterData.name][classID][sexID]) then
						for optionID, choiceID in pairs(HelpMePlayDB.BarberShop[characterData.name][classID][sexID]) do
							C_BarberShop.SetCustomizationChoice(optionID, choiceID)
						end
						C_BarberShop.ApplyCustomizationChoices()
					end
				end
			end)
		end
	end
end)