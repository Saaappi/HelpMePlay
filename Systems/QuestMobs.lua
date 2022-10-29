local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local iconKey = addonName .. "Icon"
local tooltip = _G.CreateFrame("GameTooltip", "HMPQuestTooltip", nil, "GameTooltipTemplate")

local function UpdateNamePlate(namePlate, unit)
	local icon = namePlate:CreateTexture(nil, "OVERLAY")
	namePlate[iconKey] = icon
	if not UnitIsPlayer(unit) then
		tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
		tooltip:SetHyperlink("unit:" .. UnitGUID(unit))
		for i = 3, tooltip:NumLines() do
			local line = _G["HMPQuestTooltipTextLeft"..i]
			local text = line:GetText()
			if string.find(text, "\%\)") or string.find(text, "%d\/%d") then
				icon:ClearAllPoints()
				icon:SetSize(20, 20)
				icon:SetPoint("TOP", 0, 10)
				icon:SetTexture("Interface\\Garrison\\MobileAppIcons")
				icon:SetTexCoord(0.381836, 0.506836, 0.254883, 0.379883)
				
				for k,v in pairs(namePlate) do
					print(k)
				end
				
				icon:Show()
				return
			end
		end
	end
	if icon then
		icon:Hide()
	end
end

e:RegisterEvent("NAME_PLATE_UNIT_ADDED")
e:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
e:SetScript("OnEvent", function(self, event, unit)
	if event == "NAME_PLATE_UNIT_ADDED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
		
		local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
		UpdateNamePlate(namePlate, unit)
	end
	
	if event == "NAME_PLATE_UNIT_REMOVED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
		
		local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
        if namePlate[iconKey] then
            namePlate[iconKey]:Hide()
        end
	end
end)

