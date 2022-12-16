local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function Gossip(gossip)
	if tonumber(gossip) then
		gossip = tonumber(gossip)
		local gossips = C_GossipInfo.GetOptions()
		local npcID = 0
		local GUID = UnitGUID("target")
		if GUID then
			_, _, _, _, _, npcID = string.split("-", GUID); npcID = tonumber(npcID)
		end
		if not HelpMePlayPlayerDialogDB[npcID] then
			HelpMePlayPlayerDialogDB[npcID] = {}
		end
		if not HelpMePlayPlayerDialogDB[npcID]["g"] then
			HelpMePlayPlayerDialogDB[npcID]["g"] = {}
			table.insert(HelpMePlayPlayerDialogDB[npcID]["g"], gossips[gossip].gossipOptionID)
		else
			if gossip == 0 then
				HelpMePlayPlayerDialogDB[npcID] = nil
			else
				table.insert(HelpMePlayPlayerDialogDB[npcID]["g"], gossips[gossip].gossipOptionID)
			end
		end
	end
end

local function Confirm()
	local guid = UnitGUID("target")
	if guid then
		local _, _, _, _, _, npcId = string.split("-", guid); npcId = tonumber(npcId)
		if not HelpMePlayPlayerDialogDB[npcId] then
			HelpMePlayPlayerDialogDB[npcId] = {}
		end
		if not HelpMePlayPlayerDialogDB[npcId]["c"] then
			HelpMePlayPlayerDialogDB[npcId]["c"] = true
		else
			if HelpMePlayPlayerDialogDB[npcId]["c"] then
				HelpMePlayPlayerDialogDB[npcId]["c"] = nil
			end
		end
	end
end

function HelpMePlay:SlashCommandHandler(cmd)
	local cmd, arg1, arg2 = string.split(" ", cmd)
	if not cmd or cmd == "" then
		Settings.OpenToCategory(addonName)
	elseif cmd == L_GLOBALSTRINGS["Command.Gossip"] and arg1 ~= nil then
		Gossip(arg1)
	elseif cmd == L_GLOBALSTRINGS["Command.Confirm"] then
		Confirm()
	elseif cmd == L_GLOBALSTRINGS["Command.Quest"] and arg1 ~= nil then
		-- A shorthand way to check if a given quest has
		-- been completed by the current player.
		--
		-- The argument must be a number, else silently
		-- fail out.
		if tonumber(arg1) then
			self:Print(tostring(C_QuestLog.IsQuestFlaggedCompleted(arg1)))
		end
	elseif cmd == L_GLOBALSTRINGS["Command.Ignore"] and arg1 ~= nil then
		if arg1 == L_GLOBALSTRINGS["Command.Subcommand.Ignore.NPC"] then
			local npcID = tonumber(arg2)
			if npcID then
				if HelpMePlayIgnoredCreaturesDB[npcID] == nil then
					HelpMePlayIgnoredCreaturesDB[npcID] = true
				else
					HelpMePlayIgnoredCreaturesDB[npcID] = nil
				end
			else
				if UnitIsPlayer("target") == false then
					local unitGUID = UnitGUID("target")
					if unitGUID then
						local _, _, _, _, _, npcID = strsplit("-", unitGUID); npcID = tonumber(npcID)
						if HelpMePlayIgnoredCreaturesDB[npcID] == nil then
							HelpMePlayIgnoredCreaturesDB[npcID] = true
						else
							HelpMePlayIgnoredCreaturesDB[npcID] = nil
						end
					end
				end
			end
		elseif arg1 == L_GLOBALSTRINGS["Command.Quest"] then
			local questId = tonumber(arg2)
			if questId then
				if HelpMePlayIgnoredQuestsDB[questId] == nil then
					HelpMePlayIgnoredQuestsDB[questId] = true
				else
					HelpMePlayIgnoredQuestsDB[questId] = nil
				end
			end
		end
	elseif cmd == L_GLOBALSTRINGS["Command.Junker"] and arg1 ~= nil and arg2 ~= nil then
		local count = 0
		arg2 = addonTable.StringToTable(arg2, " ")
		for _, item in ipairs(arg2) do
			if arg1 == L_GLOBALSTRINGS["Command.Subcommand.Junker.Add"] then
				if HelpMePlayJunkerDB[item] then
					HelpMePlayJunkerDB[item] = nil
				else
					HelpMePlayJunkerBlacklistDB[item] = nil
					HelpMePlayJunkerDB[item] = true
					count = count + 1
				end
			elseif arg1 == L_GLOBALSTRINGS["Command.Subcommand.Junker.Blacklist"] then
				if HelpMePlayJunkerBlacklistDB[item] then
					HelpMePlayJunkerBlacklistDB[item] = nil
				else
					HelpMePlayJunkerDB[item] = nil
					HelpMePlayJunkerBlacklistDB[item] = true
					count = count + 1
				end
			end
		end
		self:Print(string.format(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Imported To Junker From List Text"], count))
	elseif cmd == L_GLOBALSTRINGS["Command.Taxi"] and arg1 ~= nil then
		if HelpMePlayDB.DevModeEnabled then
			-- The flight map frame must be visible.
			if not FlightMapFrame:IsVisible() then return end
			
			for _, taxiNodeData in ipairs(C_TaxiMap.GetAllTaxiNodes(GetTaxiMapID())) do
				local dest, zone = string.split(",", taxiNodeData.name)
				if string.find(string.lower(dest), string.lower(arg1)) then
					print(dest .. "," .. zone .. ": " .. taxiNodeData.nodeID)
				end
			end
		else
			print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Text.Output.DevModeDisabled"])
		end
	elseif cmd == L_GLOBALSTRINGS["Command.Traits"] then
		if HelpMePlayDB.DevModeEnabled then
			local scrollFrame = CreateFrame("ScrollFrame", "HMPTalentScrollFrame", UIParent, "UIPanelScrollFrameTemplate")
			scrollFrame:SetSize(300,200)
			scrollFrame:SetPoint("CENTER")
			local editBox = CreateFrame("EditBox", "HMPTalentEditBox", s)
			editBox:SetMultiLine(true)
			editBox:SetAutoFocus(false)
			editBox:SetFontObject(ChatFontNormal)
			editBox:SetWidth(300)
			scrollFrame:SetScrollChild(editBox)
			tinsert(UISpecialFrames, "HMPTalentScrollFrame")
			tinsert(UISpecialFrames, "HMPTalentEditBox")
			
			local configID = C_ClassTalents.GetActiveConfigID()
			local nodes = C_Traits.GetTreeNodes(C_Traits.GetConfigInfo(configID).treeIDs[1])
			local text = "Trait Info:\n"
			for _, nodeID in ipairs(nodes) do
				local nodeInfo = C_Traits.GetNodeInfo(configID, nodeID)
				for i=1, #nodeInfo.entryIDs do
					local entryInfo = C_Traits.GetEntryInfo(configID, nodeInfo.entryIDs[i])
					local spellID = C_Traits.GetDefinitionInfo(entryInfo.definitionID).spellID
					text = text .. nodeInfo.ID .. " | " .. nodeInfo.entryIDs[i] .. " | " .. (GetSpellInfo(spellID)) .. "\n"
				end
			end
			editBox:SetText(text)
		else
			print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Text.Output.DevModeDisabled"])
		end
	elseif cmd == L_GLOBALSTRINGS["Help Command"] then
		self:Print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ":" .. "\n" .. L_GLOBALSTRINGS["Confirm Command"] .. "\n" .. L_GLOBALSTRINGS["Dialog Command"] .. "\n" .. L_GLOBALSTRINGS["Help Command"] .. "\n" .. L_GLOBALSTRINGS["Ignore Command"] .. "\n" .. L_GLOBALSTRINGS["Quest Command"])
	end
end