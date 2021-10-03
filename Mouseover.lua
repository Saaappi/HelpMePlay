local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local mouseoverName = ""
local startTime = 0
local timeLeft = 0
local hasBuff = false

e:RegisterEvent("UPDATE_MOUSEOVER_UNIT")

-- Add notes to the tooltip of select creatures and objects.
-- Controlled by localized values in MouseoverDB.lua.
--
-- This will need to be reconsidered for creatures since
-- an Id can be used for them opposed to a localized name.
GameTooltip:HookScript("OnUpdate", function(self)
	if GameTooltip:IsVisible() then
		if HelpMePlayOptionsDB.Notes == false then return end
		if GameTooltip:GetOwner():GetName() == "UIParent" then
			mouseoverName = _G["GameTooltipTextLeft"..1]:GetText()
			for nameOrId, data in pairs(addonTable.mouseoverDB) do
				if nameOrId == mouseoverName then
					for i = 1, self:NumLines() do
						if string.find(_G[self:GetName().."TextLeft"..i]:GetText(), addonName) then return end
					end
					if data.buffId ~= 0 or data.buffId ~= nil then
						for i = 1, 16 do
							local _, _, _, _, _, expiration, _, _, _, spellId = UnitAura("player", i)
							if spellId == data.buffId and expiration > 0 then
								startTime = GetTime()
								timeLeft = expiration - startTime
								hasBuff = true
								break
							end
						end
						if hasBuff then
							GameTooltip:AddLine("|cffFFFFFF" .. addonName .. "|r: " .. data.n .. " (|cffFFFFFF" .. string.format("%.2f", timeLeft) .. "|r)")
							GameTooltip:Show()
							hasBuff = false
						else
							GameTooltip:AddLine("|cffFFFFFF" .. addonName .. "|r: " .. data.n)
							GameTooltip:Show()
						end
					else
						GameTooltip:AddLine("|cffFFFFFF" .. addonName .. "|r: " .. data.n)
						GameTooltip:Show()
					end
				end
			end
		end
	end
end)

e:SetScript("OnEvent", function(self, event, ...)
	if event == "UPDATE_MOUSEOVER_UNIT" then
		if HelpMePlayOptionsDB.Notes == false then return end
		if UnitGUID("mouseover") then
			local guid = UnitGUID("mouseover")
			if guid then
				local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
				for nameOrId, data in pairs(addonTable.mouseoverDB) do
					if nameOrId == npcId then
						for i = 1, GameTooltip:NumLines() do
							if string.find(_G[GameTooltip:GetName().."TextLeft"..i]:GetText(), addonName) then return end
						end
						GameTooltip:AddLine("|cffFFFFFF" .. addonName .. "|r: " .. data.n)
						GameTooltip:Show()
					end
				end
			end
		end
	end
end)