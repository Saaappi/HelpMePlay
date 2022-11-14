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
			if text:match("(%d+)%%") or text:match("(%d+)/(%d+)") then
				local continue = true
				local minProgress, maxProgress = text:match("(%d+)/(%d+)")
				local percentProgress = text:match("(%d+)%%")
				if minProgress and maxProgress then
					minProgress = tonumber(minProgress)
					maxProgress = tonumber(maxProgress)
					if minProgress == maxProgress then
						continue = false
					end
				end
				
				if percentProgress then
					percentProgress = tonumber(percentProgress)
					if percentProgress == 100 then
						continue = false
					end
				end
				
				if continue then
					icon:ClearAllPoints()
					icon:SetSize(20, 20)
					if HelpMePlayDB.QuestMobIconPosition == 0 then
						icon:SetPoint("TOP", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					elseif HelpMePlayDB.QuestMobIconPosition == 1 then
						icon:SetPoint("BOTTOM", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					elseif HelpMePlayDB.QuestMobIconPosition == 2 then
						icon:SetPoint("LEFT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					elseif HelpMePlayDB.QuestMobIconPosition == 3 then
						icon:SetPoint("RIGHT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					elseif HelpMePlayDB.QuestMobIconPosition == 4 then
						icon:SetPoint("TOPLEFT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					elseif HelpMePlayDB.QuestMobIconPosition == 5 then
						icon:SetPoint("TOPRIGHT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					elseif HelpMePlayDB.QuestMobIconPosition == 6 then
						icon:SetPoint("BOTTOMLEFT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					elseif HelpMePlayDB.QuestMobIconPosition == 7 then
						icon:SetPoint("BOTTOMRIGHT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					elseif HelpMePlayDB.QuestMobIconPosition == 8 then
						icon:SetPoint("CENTER", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					end
					if HelpMePlayDB.QuestMobIconId == 0 then
						icon:SetTexture("Interface\\Garrison\\MobileAppIcons")
						icon:SetTexCoord(0.381836, 0.506836, 0.254883, 0.379883)
					elseif HelpMePlayDB.QuestMobIconId == 1 then
						icon:SetTexture(HelpMePlayDB.QuestMobIcon)
					end
					
					icon:Show()
					return
				end
			end
		end
	end
	if icon then
		icon:Hide()
	end
end

e:RegisterEvent("NAME_PLATE_UNIT_ADDED")
e:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "NAME_PLATE_UNIT_ADDED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
		
		local unit = ...
		
		local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
		UpdateNamePlate(namePlate, unit)
	end
	
	if event == "NAME_PLATE_UNIT_REMOVED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
		
		local unit = ...
		
		local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
        if namePlate[iconKey] then
            namePlate[iconKey]:Hide()
        end
	end
end)

