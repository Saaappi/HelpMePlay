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
				local sexID = tostring(characterData.sex)
				
				-- Create the table structure, if needed.
				if HelpMePlayDB.BarberShop[classID] == nil then
					HelpMePlayDB.BarberShop[classID] = {}
					HelpMePlayDB.BarberShop[classID]["0"] = {} -- Male
					HelpMePlayDB.BarberShop[classID]["1"] = {} -- Female
				end
				
				local customizations = C_BarberShop.GetAvailableCustomizations()
				for _, categories in ipairs(customizations) do
					for _, option in pairs(categories.options) do
						HelpMePlayDB.BarberShop[classID][sexID][option.id] = option.currentChoiceIndex
					end
				end
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
		end
	end
end)