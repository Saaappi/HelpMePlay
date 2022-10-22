local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local bag, bagSlot = 0, 0
local HMPOpenableButton = _G.CreateFrame(
	"Button",
	"HMPOpenableButton",
	nil,
	"OptionsButtonTemplate"
)
local normalTexture = e:CreateTexture()
local highlightTexture = e:CreateTexture()
highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
highlightTexture:SetSize(24, 23)

local containerItems = {
	[117392] = true, 	-- Loot-Filled Pumpkin
}

e:RegisterEvent("ITEM_DATA_LOAD_RESULT")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "ITEM_DATA_LOAD_RESULT" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.OpenablesEnabled == false or HelpMePlayDB.OpenablesEnabled == nil then return false end
		for bagId = 0, 4 do
			local numSlots = GetContainerNumSlots(bagId)
			for slot = 1, numSlots do
				local containerItemId = select(10, GetContainerItemInfo(bagId, slot))
				if containerItems[containerItemId] then
					bag = bagId
					bagSlot = slot
					
					HMPQueueButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
					
					normalTexture:SetTexture("Interface\\ICONS\\inv_misc_bag_10")
					normalTexture:SetSize(28, 26)
		
					HMPOpenableButton:SetNormalTexture(normalTexture)
					HMPOpenableButton:SetHighlightTexture(highlightTexture, "ADD")
		
					HMPOpenableButton:SetSize(28, 26)
					HMPOpenableButton:SetPoint("CENTER", "UIParent")
		
					HMPOpenableButton:Show()
					return
				end
			end
		end
	end
end)

HMPOpenableButton:HookScript("OnClick", function(self)
	UseContainerItem(bag, bagSlot)
	self:Hide()
end)

HMPOpenableButton:HookScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetBagItem(bag, bagSlot)
	GameTooltip:SetClampedToScreen(true)
	GameTooltip:Show()
end)

HMPOpenableButton:HookScript("OnLeave", function(self)
	if GameTooltip:GetOwner() == self then
		GameTooltip:Hide()
	end
end)