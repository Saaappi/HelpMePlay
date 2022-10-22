local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("ITEM_PUSH")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "ITEM_PUSH" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.OpenablesEnabled == false or HelpMePlayDB.OpenablesEnabled == nil then return false end
		local bagId, fileIconId = ...
		if bagId and fileIconId then
			local numSlots = GetContainerNumSlots(bagId)
			for slot = 1, numSlots do
				local item = GetContainerItemInfo(bagId, slot)
				if item then
					if item.lootable then
						if item.texture == fileIconId then
							-- make the button
						end
					end
				end
			end
		end
	end
end)