local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local mouseoverName = ""

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
						local _, _, _, _, duration, _, _, _, _, spellId = UnitAura("player", i)
						if spellId == data.buffId then
							GameTooltip:AddLine("|cffFFFFFF" .. addonName .. "|r: " .. data.note .. " (|cffFFFFFF" .. duration/60 .. "|r)")
							GameTooltip:Show()
						end
					end
				else
					GameTooltip:AddLine("|cffFFFFFF" .. addonName .. "|r: " .. data.note)
					GameTooltip:Show()
				end
			end
		end
	end
end)