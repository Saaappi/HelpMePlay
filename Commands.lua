local addonName, addon = ...
local e = CreateFrame("Frame")

local function Gossip(gossip)
	if tonumber(gossip) then
		gossip = tonumber(gossip)
	elseif gossip == nil then
		gossip = 0
	else
		return
	end

	local GUID = UnitGUID("target")
	local npcID = 0
	if GUID then
		_, _, _, _, _, npcID = string.split("-", GUID); npcID = tonumber(npcID)
		
		if gossip == 0 then
			if HelpMePlayDB.PlayerDB.Gossips[npcID] then
				HelpMePlayDB.PlayerDB.Gossips[npcID] = nil
			end
			return
		end
	end
	
	local gossips = C_GossipInfo.GetOptions()
	if (#gossips > 0) then
		if not HelpMePlayDB.PlayerDB.Gossips[npcID] then
			HelpMePlayDB.PlayerDB.Gossips[npcID] = {}
		end
		
		if not HelpMePlayDB.PlayerDB.Gossips[npcID]["g"] then
			HelpMePlayDB.PlayerDB.Gossips[npcID]["g"] = {}
		end
		
		local numGossips = #HelpMePlayDB.PlayerDB.Gossips[npcID]["g"]
		if numGossips > 0 then
			for index, optionID in ipairs(HelpMePlayDB.PlayerDB.Gossips[npcID]["g"]) do
				if optionID == gossips[gossip].gossipOptionID then
					HelpMePlayDB.PlayerDB.Gossips[npcID]["g"][index] = nil
				end
			end
		else
			table.insert(HelpMePlayDB.PlayerDB.Gossips[npcID]["g"], gossips[gossip].gossipOptionID)
		end
	end
end

local function Confirm()
	local GUID = UnitGUID("target")
	if GUID then
		local _, _, _, _, _, npcID = string.split("-", GUID); npcID = tonumber(npcID)

		if not HelpMePlayDB.PlayerDB.Gossips[npcID] then
			HelpMePlayDB.PlayerDB.Gossips[npcID] = {}
		end

		if not HelpMePlayDB.PlayerDB.Gossips[npcID]["g"] then
			print(addon.CONSTANTS.COLORED_ADDON_NAME .. ": |cffFFD100" .. UnitName("target") .. "|r doesn't have a gossip entry. Please add a gossip entry (|cffFFD100/hmp gossip X|r) before attempting to automate confirmation.")
			return
		end

		if not HelpMePlayDB.PlayerDB.Gossips[npcID]["c"] then
			HelpMePlayDB.PlayerDB.Gossips[npcID]["c"] = true
		else
			if HelpMePlayDB.PlayerDB.Gossips[npcID]["c"] then
				HelpMePlayDB.PlayerDB.Gossips[npcID]["c"] = nil
			end
		end
	end
end

function HelpMePlay:SlashCommandHandler(cmd)
	local cmd, arg1, arg2 = string.split(" ", cmd)
	if not cmd or cmd == "" then
		Settings.OpenToCategory(addonName)
	elseif cmd == "gossip" and arg1 ~= nil then
		Gossip(arg1)
	elseif cmd == "confirm" then
		Confirm()
	elseif (cmd == "quest" or cmd == "q") and arg1 ~= nil then
		if tonumber(arg1) then
			self:Print(tostring(C_QuestLog.IsQuestFlaggedCompleted(arg1)))
		end
	elseif cmd == "ignore" and arg1 ~= nil then
		if arg1 == "npc" then
			local npcID = tonumber(arg2)
			if npcID then
				if HelpMePlayDB.IgnoredCreatures[npcID] == nil then
					HelpMePlayDB.IgnoredCreatures[npcID] = true
				else
					HelpMePlayDB.IgnoredCreatures[npcID] = nil
				end
			else
				if UnitIsPlayer("target") == false then
					local unitGUID = UnitGUID("target")
					if unitGUID then
						local _, _, _, _, _, npcID = strsplit("-", unitGUID); npcID = tonumber(npcID)
						if HelpMePlayDB.IgnoredCreatures[npcID] == nil then
							HelpMePlayDB.IgnoredCreatures[npcID] = true
						else
							HelpMePlayDB.IgnoredCreatures[npcID] = nil
						end
					end
				end
			end
		elseif arg1 == "quest" then
			local questId = tonumber(arg2)
			if questId then
				if HelpMePlayDB.IgnoredQuests[questId] == nil then
					HelpMePlayDB.IgnoredQuests[questId] = true
				else
					HelpMePlayDB.IgnoredQuests[questId] = nil
				end
			end
		end
	elseif cmd == "taxi" and arg1 ~= nil then
		if HelpMePlayDB.DevModeEnabled then
			if not FlightMapFrame:IsVisible() then return end
			
			for _, taxiNodeData in ipairs(C_TaxiMap.GetAllTaxiNodes(GetTaxiMapID())) do
				local dest, zone = string.split(",", taxiNodeData.name)
				if string.find(string.lower(dest), string.lower(arg1)) then
					print(dest .. "," .. zone .. ": " .. taxiNodeData.nodeID)
				end
			end
		end
	elseif cmd == "talents" then
		if HelpMePlayDB.DevModeEnabled then
			local scrollFrame
			local editBox
			
			if HMPTalentScrollFrame then
				scrollFrame = HMPTalentScrollFrame
				editBox = HMPTalentEditBox
				HMPTalentScrollFrame:Show()
				HMPTalentEditBox:Show()
				HMPTalentCloseButton:Show()
			else
				local button = CreateFrame("Button", "HMPTalentCloseButton", HMPTalentScrollFrame, "UIPanelButtonTemplate")
				local scrollFrame = CreateFrame("ScrollFrame", "HMPTalentScrollFrame", UIParent, "UIPanelScrollFrameTemplate")
				scrollFrame:SetSize(300,200)
				scrollFrame:SetPoint("CENTER")
				editBox = CreateFrame("EditBox", "HMPTalentEditBox", scrollFrame)
				editBox:SetMultiLine(true)
				editBox:SetAutoFocus(false)
				editBox:SetFontObject(ChatFontNormal)
				editBox:SetWidth(300)
				scrollFrame:SetScrollChild(editBox)
				button:SetSize(20, 12)
				button:SetText("X")
				button:SetPoint("BOTTOMLEFT", HMPTalentScrollFrame, "TOPRIGHT")
				button:SetScript("OnClick", function()
					HMPTalentScrollFrame:Hide()
					HMPTalentEditBox:Hide()
					HMPTalentCloseButton:Hide()
				end)
			end
			
			local configID = C_ClassTalents.GetActiveConfigID()
			local nodes = C_Traits.GetTreeNodes(C_Traits.GetConfigInfo(configID).treeIDs[1])
			local text = ""
			local traits = {}
			for _, nodeID in ipairs(nodes) do
				local nodeInfo = C_Traits.GetNodeInfo(configID, nodeID)
				for i=1, #nodeInfo.entryIDs do
					local entryInfo = C_Traits.GetEntryInfo(configID, nodeInfo.entryIDs[i])
					local spellID = C_Traits.GetDefinitionInfo(entryInfo.definitionID).spellID
					
					if spellID then
						table.insert(traits, { ["name"] = (GetSpellInfo(spellID)), ["nodeID"] = nodeInfo.ID, ["entryID"] = nodeInfo.entryIDs[i] })
					end
				end
			end

			table.sort(traits, function(a, b) return string.lower(a.name) < string.lower(b.name) end)

			for _, v in ipairs(traits) do
				text = text .. "\t\t{ -- " .. v.name .. "\n\t\t\t[\"n\"] = " .. v.nodeID .. ",\n\t\t\t[\"e\"] = " .. v.entryID .. ",\n\t\t},\n"
			end

			editBox:SetText(text)
		end
	elseif cmd == "atlas" and arg1 ~= nil then
		if HelpMePlayDB.DevModeEnabled then
			print(CreateAtlasMarkup(arg1, 32, 32))
		end
	elseif (cmd == "equip" and arg1 ~= nil) then
		if HelpMePlayDB.DevModeEnabled then
			addon.EquipItem(arg1)
		end
	end
end