local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addon)
	if event == "ADDON_LOADED" and addon == "Blizzard_ClassTalentUI" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		
		local configID = C_ClassTalents.GetActiveConfigID()
		local treeID = C_Traits.GetConfigInfo(configID).treeIDs[1]
		if configID and treeID then
			local nodes = C_Traits.GetTreeNodes(treeID)
			--[[for i=1, #nodes do
				local nodeInfo = C_Traits.GetNodeInfo(configID, nodes[i])
				if nodeInfo.ID ~= 0 then
					print(nodeInfo.ID .. ": " .. C_Traits.GetTraitDescription(nodeInfo.entryIDs[1], nodeInfo.maxRanks))
				end
				if nodeInfo.ID == 90326 then
					print(C_Traits.GetTraitDescription(nodeInfo.entryIDs[1], nodeInfo.maxRanks))
				end
			end]]
		end
	end
end)