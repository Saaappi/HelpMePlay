local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local mouseoverName = ""

GameTooltip:HookScript("OnUpdate", function(self)
	if GameTooltip:GetOwner():GetName() == "UIParent" then
		mouseoverName = _G["GameTooltipTextLeft"..1]:GetText()
		for name, note in pairs(addonTable.mouseoverDB) do
			if name == mouseoverName then
				for i = 1, self:NumLines() do
					if string.find(_G[self:GetName().."TextLeft"..i]:GetText(), addonName) then return end
				end
				GameTooltip:AddLine("|cffFFFFFF" .. addonName .. "|r: " .. note)
				GameTooltip:Show()
			end
		end
	end
end)