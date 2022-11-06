local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function Dialog(gossip)
	if tonumber(gossip) then
		local guid = UnitGUID("target")
		if guid then
			local _, _, _, _, _, npcId = string.split("-", guid); npcId = tonumber(npcId)
			if not HelpMePlayPlayerDialogDB[npcId] then
				HelpMePlayPlayerDialogDB[npcId] = {}
			end
			if not HelpMePlayPlayerDialogDB[npcId]["g"] then
				HelpMePlayPlayerDialogDB[npcId]["g"] = {}
				table.insert(HelpMePlayPlayerDialogDB[npcId]["g"], tonumber(gossip))
			else
				if tonumber(gossip) == 0 then
					HelpMePlayPlayerDialogDB[npcId] = nil
				else
					table.insert(HelpMePlayPlayerDialogDB[npcId]["g"], tonumber(gossip))
				end
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
	elseif cmd == L_GLOBALSTRINGS["Command.Dialog"] and arg1 ~= nil then
		Dialog(arg1)
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
	elseif cmd == L_GLOBALSTRINGS["Command.Ignore"] and arg1 ~= nil and arg2 ~= nil then
		if arg1 == L_GLOBALSTRINGS["Command.Subcommand.Ignore.NPC"] then
			local npcId = tonumber(arg2)
			if npcId then
				if HelpMePlayIgnoredCreaturesDB[npcId] == nil then
					HelpMePlayIgnoredCreaturesDB[npcId] = true
				else
					HelpMePlayIgnoredCreaturesDB[npcId] = nil
				end
			else
				if UnitIsPlayer("target") == false then
					local unitGUID = UnitGUID("target")
					if unitGUID then
						local _, _, _, _, _, npcId = strsplit("-", unitGUID); npcId = tonumber(npcId)
						if HelpMePlayIgnoredCreaturesDB[npcId] == nil then
							HelpMePlayIgnoredCreaturesDB[npcId] = true
						else
							HelpMePlayIgnoredCreaturesDB[npcId] = nil
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
	elseif cmd == L_GLOBALSTRINGS["Command.Soulbind"] and arg1 ~= nil then
		if HelpMePlayDB.DevModeEnabled then
			-- Create an empty table we'll use for sorting the data
			-- later.
			--
			-- Get the node data for the provided soulbind (via ID).
			-- Soulbinds can be found @ https://wow.tools/dbc/?dbc=soulbind
			local sortingTbl = {}
			local nodes = C_Soulbinds.GetTree(arg1).nodes
			
			-- Add the node data, the ID and the corresponding row,
			-- to the sorting table in a contiguous format.
			for _, node in ipairs(nodes) do
				table.insert(sortingTbl, { node.ID, node.row })
			end
			
			-- Sort the sorting table in a descending order (high to low).
			-- The sort is based on the row number.
			table.sort(sortingTbl, function(a, b) return a[2] < b[2] end)
			
			-- Print the sorting table.
			for _, node in ipairs(sortingTbl) do
				print(node[1] .. ": " .. node[2])
			end
		end
	elseif cmd == L_GLOBALSTRINGS["Command.Conduit"] and arg1 ~= nil then
		--[[
			0: Finesse
			1: Potency
			2: Endurance
		]]--
		if HelpMePlayDB.DevModeEnabled then
			-- Create an empty table we'll use for sorting the data
			-- later.
			--
			-- Get the conduit data for the provided conduit type (via ID).
			--
			-- Add the node data, the ID and the corresponding row,
			-- to the sorting table in a contiguous format.
			local sortingTbl = {}
			local conduits = C_Soulbinds.GetConduitCollection(arg1)
			for _, conduit in ipairs(conduits) do
				table.insert(sortingTbl, { conduit.conduitID, conduit.conduitItemID })
			end
			
			-- Sort the sorting table in a descending order (high to low).
			-- The sort is based on the conduit item ID.
			table.sort(sortingTbl, function(a, b) return a[2] < b[2] end)
			
			-- Print the sorting table.
			for _, conduit in ipairs(sortingTbl) do
				print(conduit[2] .. ": " .. conduit[1])
			end
		end
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
		end
	elseif cmd == L_GLOBALSTRINGS["Help Command"] then
		self:Print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ":" .. "\n" .. L_GLOBALSTRINGS["Confirm Command"] .. "\n" .. L_GLOBALSTRINGS["Dialog Command"] .. "\n" .. L_GLOBALSTRINGS["Help Command"] .. "\n" .. L_GLOBALSTRINGS["Ignore Command"] .. "\n" .. L_GLOBALSTRINGS["Quest Command"])
	end
end