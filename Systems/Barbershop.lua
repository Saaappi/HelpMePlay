local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

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

local function SetValue(val)
    --[[Core:SetCurrentProfileTo(val)

    UIDropDownMenu_SetText(ProfilePickerFrame.frame, Core:GetCurrentProfileName())

    if Core:IsCurrentProfileNew() then
        DeleteButtonFrame.frame:Disable()
        LoadButtonFrame.frame:Disable()
    else
        DeleteButtonFrame.frame:Enable()
        LoadButtonFrame.frame:Enable()
    end]]
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
				--local currentId = Core:GetCurrentProfileId()
				for i, loadout in ipairs(GetLoadouts(characterData.name, classID, tostring(characterData.sex))) do
					local info = UIDropDownMenu_CreateInfo()

					--info.checked = loadout.id == currentId
					info.checked = i
					info.text = i
					info.value = i
					info.func = SetValue
					info.arg1 = i

					UIDropDownMenu_AddButton(info)
				end
			end)
			
			HMPBarberShopLoadoutDropdown:Show()
			
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
			
			-- Load Button
			--[[local HMPBarberShopLoadButton = _G.CreateFrame(
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
			end)]]
		end
	end
end)