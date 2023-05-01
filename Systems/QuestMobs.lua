local addonName, addonTable = ...
local e = CreateFrame("Frame")
local iconKey = addonName .. "Icon"
local textKey = addonName .. "Text"

local function UpdateNamePlate(plate)
	C_Timer.After(0.1, function()
		--local plate = C_NamePlate.GetNamePlateForUnit(unit)

		local icon = plate:CreateTexture(nil, "OVERLAY")
		local fontString = plate:CreateFontString(nil, "OVERLAY")
		
		fontString:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
		fontString:SetTextColor(1, 1, 1)
		
		if (HelpMePlayDB.QuestMobIconID > 0) then
			fontString:SetPoint("LEFT", icon, "RIGHT", 5, 0)
		else
			fontString:SetPoint("LEFT", icon, "RIGHT")
		end
		
		plate[iconKey] = icon
		plate[textKey] = fontString
		
		local numCriteria = 0
		if (not UnitIsPlayer(unit)) then
			if (plate.QuestInfo) then
				local numObjectives = (#plate.QuestInfo)
				for i = 1, numObjectives do
					local objective = plate.QuestInfo[i]
					local continue = true
					
					local numDone = objective.amount; numDone = tonumber(numDone)
					local numNeeded = objective.total; numNeeded = tonumber(numNeeded)
					local percentProgress = objective.questText:match("(%d+)%%")
					if (numDone) and (numNeeded) then
						if (not (numDone == numNeeded)) then
							numCriteria = numCriteria + (numNeeded - numDone)
						end
					end
					
					if (percentProgress) then
						percentProgress = tonumber(percentProgress)
						if (percentProgress == 100) then
							continue = false
						end
					end
					
					if (continue) then
						icon:ClearAllPoints()
						icon:SetSize(20, 20)
						if (HelpMePlayDB.QuestMobIconPosition == 0) then
							icon:SetPoint("TOP", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
						elseif (HelpMePlayDB.QuestMobIconPosition == 1) then
							icon:SetPoint("BOTTOM", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
						elseif (HelpMePlayDB.QuestMobIconPosition == 2) then
							icon:SetPoint("LEFT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
						elseif (HelpMePlayDB.QuestMobIconPosition == 3) then
							icon:SetPoint("RIGHT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
						elseif (HelpMePlayDB.QuestMobIconPosition == 4) then
							icon:SetPoint("TOPLEFT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
						elseif (HelpMePlayDB.QuestMobIconPosition == 5) then
							icon:SetPoint("TOPRIGHT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
						elseif (HelpMePlayDB.QuestMobIconPosition == 6) then
							icon:SetPoint("BOTTOMLEFT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
						elseif (HelpMePlayDB.QuestMobIconPosition == 7) then
							icon:SetPoint("BOTTOMRIGHT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
						elseif (HelpMePlayDB.QuestMobIconPosition == 8) then
							icon:SetPoint("CENTER", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
						end
						if (HelpMePlayDB.QuestMobIconID == 0) then
							icon:SetTexture("Interface\\Minimap\\ObjectIconsAtlas")
							icon:SetTexCoord(0.272461, 0.303711, 0.834961, 0.866211)
						elseif (HelpMePlayDB.QuestMobIconID == 1) then
							icon:SetTexture(HelpMePlayDB.QuestMobIcon)
						elseif (HelpMePlayDB.QuestMobIconID == 2) then
							icon:SetTexture("Interface\\Garrison\\MobileAppIcons")
							icon:SetTexCoord(0.381836, 0.506836, 0.254883, 0.379883)
						end
						
						fontString:SetText(numCriteria)
						
						icon:Show()
					end
				end
			end
		end
	end)
end

local function UpdateTextKey(namePlate)
	--local plate = C_NamePlate.GetNamePlateForUnit(namePlate)
	if (namePlate.QuestInfo) then
		print("A")
		local numObjectives = (#namePlate.QuestInfo)
		for i = 1, numObjectives do
			local objective = namePlate.QuestInfo[i]
			local continue = true
			
			local numDone = objective.amount; numDone = tonumber(numDone)
			local numNeeded = objective.total; numNeeded = tonumber(numNeeded)
			local percentProgress = objective.questText:match("(%d+)%%")
			if (numDone) and (numNeeded) then
				if (numDone == numNeeded) then
					continue = false
				end
			end
			
			if (percentProgress) then
				percentProgress = tonumber(percentProgress)
				if (percentProgress == 100) then
					continue = false
				end
			end
			
			if (continue) then
				if (namePlate[textKey]) then
					if (numDone) and (numNeeded) then
						namePlate[textKey]:SetText(numNeeded - numDone)
					elseif (percentProgress) and (percentProgress < 100) then
						namePlate[textKey]:SetText(percentProgress .. "%")
					end
				end
			end
		end
	end
end

e:RegisterEvent("NAME_PLATE_UNIT_ADDED")
e:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
e:RegisterEvent("UI_INFO_MESSAGE")
e:RegisterEvent("QUEST_ACCEPTED")
e:RegisterEvent("QUEST_REMOVED")
e:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "NAME_PLATE_UNIT_ADDED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
		
		local unit = ...
		local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
		
		UpdateNamePlate(namePlate)
	end
	if event == "NAME_PLATE_UNIT_REMOVED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
		
		local unit = ...
		local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
		
        if (namePlate[iconKey]) then
            namePlate[iconKey]:Hide()
        end
		if (namePlate[textKey]) then
			namePlate[textKey]:Hide()
		end
	end
	if (event == "UI_INFO_MESSAGE") then
		local _, message = ...
		if (message == "Objective Complete.") then
			local namePlates = C_NamePlate.GetNamePlates()
			for i = 1, #namePlates do
				local namePlate = C_NamePlate.GetNamePlateForUnit(namePlates[i].namePlateUnitToken)
				
				if (C_QuestLog.UnitIsRelatedToActiveQuest(namePlates[i].namePlateUnitToken) == false) then
					if (namePlate[iconKey]) then
						namePlate[iconKey]:Hide()
					end
					if (namePlate[textKey]) then
						namePlate[textKey]:Hide()
					end
				end
			end
		end
	end
	if (event == "QUEST_ACCEPTED") then
		local namePlates = C_NamePlate.GetNamePlates()
		for i = 1, #namePlates do
			local namePlate = C_NamePlate.GetNamePlateForUnit(namePlates[i].namePlateUnitToken)
			UpdateNamePlate(namePlate)
		end
	end
	if (event == "QUEST_REMOVED") then
		local namePlates = C_NamePlate.GetNamePlates()
		for i = 1, #namePlates do
			local namePlate = C_NamePlate.GetNamePlateForUnit(namePlates[i].namePlateUnitToken)
			
			if (C_QuestLog.UnitIsRelatedToActiveQuest(namePlates[i].namePlateUnitToken) == false) then
				if (namePlate[iconKey]) then
					namePlate[iconKey]:Hide()
					
				end
				if (namePlate[textKey]) then
					namePlate[textKey]:Hide()
				end
			end
		end
	end
	if (event == "UNIT_QUEST_LOG_CHANGED") then
		local namePlates = C_NamePlate.GetNamePlates()
		for i = 1, #namePlates do
			UpdateTextKey(namePlates[i].namePlateUnitToken)
		end
	end
end)

