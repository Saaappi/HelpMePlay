local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local classes = {
	["WARRIOR"] = addonTable.WARRIOR_TALENTS
}

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addon)
	if event == "ADDON_LOADED" and addon == "Blizzard_ClassTalentUI" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		
		local configID = C_ClassTalents.GetActiveConfigID()
		if configID then
			local specIndex = GetSpecialization()
			local specID = GetSpecializationInfo(specIndex)
			local _, class = UnitClass("player")
			for k, v in pairs(classes[class]) do
				if k == specID then
					for _, traits in ipairs(v) do
						if C_Traits.CanPurchaseRank(configID, traits.n, traits.e) 
							if traits.r ~= C_Traits.GetNodeInfo(configID, traits.n).ranksPurchased then
								C_Traits.PurchaseRank(configID, traits.n)
								C_Traits.StageConfig(configID)
								C_Traits.CommitConfig(configID)
							end
						else
							return
						end
					end
				end
			end
		end
	end
end)