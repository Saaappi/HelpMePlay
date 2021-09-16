local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local mouseoverName = ""
local startTime = 0
local timeLeft = 0
local hasBuff = false

GameTooltip:HookScript("OnUpdate", function(self)
	if GameTooltip:GetOwner():GetName() == "UIParent" then
		mouseoverName = _G["GameTooltipTextLeft"..1]:GetText()
		for name, data in pairs(addonTable.mouseoverDB) do
			if name == mouseoverName then
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
						GameTooltip:AddLine("|cffFFFFFF" .. addonName .. "|r: " .. data.note .. " (|cffFFFFFF" .. timeLeft .. "|r)")
						GameTooltip:Show()
						hasBuff = false
					else
						GameTooltip:AddLine("|cffFFFFFF" .. addonName .. "|r: " .. data.note)
						GameTooltip:Show()
					end
				else
					GameTooltip:AddLine("|cffFFFFFF" .. addonName .. "|r: " .. data.note)
					GameTooltip:Show()
				end
			end
		end
	end
end)