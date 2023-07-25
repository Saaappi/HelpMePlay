local addonName, addon = ...
local events = CreateFrame("Frame")

events:RegisterEvent("UNIT_ENTERED_VEHICLE")
events:SetScript("OnEvent", function(self, event, ...)
	if ( event == "UNIT_ENTERED_VEHICLE" ) then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.VehiclesEnabled == false or HelpMePlayDB.VehiclesEnabled == nil then return false end

		local _, _, _, _, GUID = ...
		if ( GUID ) then
			local _, _, _, _, _, npcID = strsplit("-", guid); npcID = tonumber(npcID)
			if ( npcID ) then
				C_Timer.After(addon.CONSTANTS["HALF_SECOND"], function()
					for _, id in ipairs(addon.VEHICLES) do
						if ( id == npcID ) then
							OverrideActionBarLeaveFrameLeaveButton:Click()
							if ( events:IsEventRegistered("UNIT_ENTERED_VEHICLE") ) then
							    events:UnregisterEvent("UNIT_ENTERED_VEHICLE")
							end
							break
						end
					end
				end)
			end
		end
	end
end)