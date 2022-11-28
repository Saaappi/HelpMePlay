local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

--[[
	Description:
		If the vehicle the player enters is a registered
		vehicle, then the addon will automatically exit
		the vehicle.
]]--
e:RegisterEvent("UNIT_ENTERED_VEHICLE")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "UNIT_ENTERED_VEHICLE" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.VehiclesEnabled == false or HelpMePlayDB.VehiclesEnabled == nil then return false end
		local _, _, _, _, guid = ...
		if guid then
			local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
			if npcId then
				C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
					for _, id in ipairs(addonTable.VEHICLES) do
						if id == npcId then
							OverrideActionBarLeaveFrameLeaveButton:Click()
							break
						end
					end
				end)
			end
		end
	end
end)