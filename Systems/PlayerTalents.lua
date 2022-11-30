local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local classes = {
	["WARRIOR"] = addonTable.WARRIOR_TALENTS
}

--[[
	if #node.entryIDs>1 then
		C_Traits.SetSelection(configID,node.ID,entryID)
	else
		C_Traits.PurchaseRank(configID,node.ID)
	end
]]

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addon)
	if event == "ADDON_LOADED" and addon == "Blizzard_ClassTalentUI" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		
		local configID = C_ClassTalents.GetActiveConfigID()
		local treeID = C_Traits.GetConfigInfo(configID).treeIDs[1]
		if configID and treeID then
			local specIndex = GetSpecialization()
			local specID = GetSpecializationInfo(specIndex)
			local nodes = C_Traits.GetTreeNodes(treeID)
			local _, class = UnitClass("player")
			for k, v in pairs(classes[class]) do
				if k == specID then
					for _, traits in ipairs(v) do
						-- TODO
						-- Spend talent points?
					end
				end
			end
		end
	end
end)