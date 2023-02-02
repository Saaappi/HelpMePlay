local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local AceGUI = LibStub("AceGUI-3.0")

local function GetLoadouts(race, class, sex)
    local loadouts = {}

	if HelpMePlayDB.BarberShop[race] ~= nil then
		for id in pairs(HelpMePlayDB.BarberShop[race][class][sex]) do
			table.insert(loadouts, {
				id = id,
				name = id,
			})
		end
	end

    return loadouts
end

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addonLoaded)
	if event == "ADDON_LOADED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		
		if addonLoaded == "Blizzard_BarbershopUI" then
			-- Loadout Dropdown Menu
			local HMPBarberShopLoadoutDropdown = _G.CreateFrame(
				"Frame",
				"HMPBarberShopLoadoutDropdown",
				_G.CharCustomizeFrame.SmallButtons.ResetCameraButton,
				"UIDropDownMenuTemplate"
			)
			
			-- Set the dropdown menu's width and point in the barber shop UI.
			UIDropDownMenu_SetWidth(HMPBarberShopLoadoutDropdown, 200)
			HMPBarberShopLoadoutDropdown:SetPoint("TOPLEFT", _G.CharCustomizeFrame.SmallButtons.ResetCameraButton, "BOTTOMLEFT", -5, -20)
			
			UIDropDownMenu_Initialize(HMPBarberShopLoadoutDropdown, function(self)
				local characterData = C_BarberShop.GetCurrentCharacterData()
				local _, _, classID = UnitClass("player")
				local currentID = self.selected or HelpMePlayDB.BarberShop["currentLoadoutID"]
				
				for i, loadout in ipairs(GetLoadouts(characterData.name, classID, tostring(characterData.sex))) do
					local info = UIDropDownMenu_CreateInfo()
					
					if HelpMePlayDB.BarberShop["currentLoadoutID"] then
						UIDropDownMenu_SetSelectedValue(HMPBarberShopLoadoutDropdown, HelpMePlayDB.BarberShop["currentLoadoutID"], HelpMePlayDB.BarberShop["currentLoadoutID"])
						UIDropDownMenu_SetText(HMPBarberShopLoadoutDropdown, HelpMePlayDB.BarberShop["currentLoadoutID"])
					end

					info.checked = i == currentID
					info.text = i
					info.value = i
					info.func = function(item)
						UIDropDownMenu_SetSelectedValue(HMPBarberShopLoadoutDropdown, item.value, item.value)
						UIDropDownMenu_SetText(HMPBarberShopLoadoutDropdown, item.value)
						item.checked = true
						HelpMePlayDB.BarberShop["currentLoadoutID"] = item.value
						
						local _, _, classID = UnitClass("player")
						local characterData = C_BarberShop.GetCurrentCharacterData()
						local sexID = tostring(characterData.sex)
						
						for index, barberData in ipairs(HelpMePlayDB.BarberShop[characterData.name][classID][sexID]) do
							if index == item.value then
								for optionID, choiceID in pairs(barberData) do
									C_BarberShop.SetCustomizationChoice(optionID, choiceID)
								end
								break
							end
						end
					end
					info.arg1 = i

					UIDropDownMenu_AddButton(info)
				end
			end)
			
			HMPBarberShopLoadoutDropdown:Show()
			
			-- Apply Button
			local HMPBarberShopApplyButton = _G.CreateFrame(
				"Button",
				"HMPBarberShopApplyButton",
				HMPBarberShopLoadoutDropdown,
				"UIPanelButtonTemplate"
			)
			HMPBarberShopApplyButton:SetSize(80, 25)
			HMPBarberShopApplyButton:SetText("Apply")
			HMPBarberShopApplyButton:SetPoint("LEFT", HMPBarberShopLoadoutDropdown, "RIGHT", 10, 3)
			
			HMPBarberShopApplyButton:SetScript("OnClick", function(self)
				C_BarberShop.ApplyCustomizationChoices()
			end)
			
			-- Save Button
			local HMPBarberShopSaveButton = _G.CreateFrame(
				"Button",
				"HMPBarberShopSaveButton",
				HMPBarberShopLoadoutDropdown,
				"BarberShopButtonTemplate"
			)
			HMPBarberShopSaveButton:SetText("Save")
			HMPBarberShopSaveButton:SetPoint("TOP", 0, -25)
			HMPBarberShopSaveButton:Show()
			
			HMPBarberShopSaveButton:SetScript("OnClick", function(self)
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
				
				-- Only insert the new loadout IF the player has less than 3 customizations
				-- for the current race/class/sex.
				if (#HelpMePlayDB.BarberShop[characterData.name][classID][sexID] <= 2) then
					table.insert(HelpMePlayDB.BarberShop[characterData.name][classID][sexID], choices)
				else
					UIErrorsFrame:SetTimeVisible(5)
					UIErrorsFrame:AddMessage("\n\n" .. "You can't have more than 3 loadouts!", 1, 0, 0, nil)
					PlaySound(1883, "Master", true, true) -- VO_HumanMale_Error_SpellCooling
					return false
				end
			end)
			
			-- Delete Button
			local HMPBarberShopDeleteButton = _G.CreateFrame(
				"Button",
				"HMPBarberShopDeleteButton",
				HMPBarberShopLoadoutDropdown,
				"UIPanelButtonTemplate"
			)
			HMPBarberShopDeleteButton:SetSize(80, 25)
			HMPBarberShopDeleteButton:SetText("Delete")
			HMPBarberShopDeleteButton:SetPoint("LEFT", HMPBarberShopApplyButton, "RIGHT", 10, 0)
			
			HMPBarberShopDeleteButton:SetScript("OnClick", function(self)
				local _, _, classID = UnitClass("player")
				local characterData = C_BarberShop.GetCurrentCharacterData()
				local sexID = tostring(characterData.sex)
				
				for index, barberData in ipairs(HelpMePlayDB.BarberShop[characterData.name][classID][sexID]) do
					if index == HelpMePlayDB.BarberShop["currentLoadoutID"] then
						table.remove(HelpMePlayDB.BarberShop[characterData.name][classID][sexID], index)
						local size = #HelpMePlayDB.BarberShop[characterData.name][classID][sexID]
						if size > 0 then
							UIDropDownMenu_SetSelectedValue(HMPBarberShopLoadoutDropdown, 1, 1)
							UIDropDownMenu_SetText(HMPBarberShopLoadoutDropdown, 1)
							item.checked = true
							HelpMePlayDB.BarberShop["currentLoadoutID"] = 1
							
							local _, _, classID = UnitClass("player")
							local characterData = C_BarberShop.GetCurrentCharacterData()
							local sexID = tostring(characterData.sex)
							
							for index, barberData in ipairs(HelpMePlayDB.BarberShop[characterData.name][classID][sexID]) do
								if index == item.value then
									for optionID, choiceID in pairs(barberData) do
										C_BarberShop.SetCustomizationChoice(optionID, choiceID)
									end
									break
								end
								next(HelpMePlayDB.BarberShop[characterData.name][classID][sexID])
							end
						end
					end
				end
			end)
		end
	end
end)