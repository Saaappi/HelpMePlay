local addonName, addon = ...
local e = CreateFrame("Frame")

e:RegisterEvent("CHAT_MSG_LOOT")
e:SetScript("OnEvent", function(self, event, ...)
	if (event == "CHAT_MSG_LOOT") then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.EquipLootEnabled == false or HelpMePlayDB.EquipLootEnabled == nil then return false end
		
		local text, _, _, _, _, _, _, _, _, _, _, GUID = ...
		if (GUID == UnitGUID("player")) then
			local itemLink = string.match(text,"|%x+|Hitem:.-|h.-|h|r")
			local inventoryType = C_Item.GetItemInventoryTypeByID(itemLink)
			if (addon.CONSTANTS["SLOTS"][inventoryType]) then
				addon.EquipItem(itemLink)
			end
		end
	end
end)