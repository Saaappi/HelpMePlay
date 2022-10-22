local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local bag, bagSlot = 0, 0
local HMPOpenableButton = _G.CreateFrame(
	"Button",
	"HMPOpenableButton",
	_G.CharacterMicroButton,
	"OptionsButtonTemplate"
)
local normalTexture = e:CreateTexture()
local highlightTexture = e:CreateTexture()
highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
highlightTexture:SetSize(28, 29)

e:RegisterEvent("ITEM_DATA_LOAD_RESULT")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "ITEM_DATA_LOAD_RESULT" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.OpenablesEnabled == false or HelpMePlayDB.OpenablesEnabled == nil then return false end
		local itemId = ...
		for bagId = 0, 4 do
			local numSlots = GetContainerNumSlots(bagId)
			for slot = 1, numSlots do
				local texture, _, _, _, _, lootable, _, _, _, containerItemId = GetContainerItemInfo(bagId, slot)
				if texture then
					if lootable then
						if containerItemId == itemId then
							bag = bagId
							bagSlot = slot
							
							HMPQueueButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
							
							normalTexture:SetTexture("Interface\\ICONS\\inv_misc_bag_10")
							normalTexture:SetSize(32, 32)
				
							HMPOpenableButton:SetNormalTexture(normalTexture)
							HMPOpenableButton:SetHighlightTexture(highlightTexture, "ADD")
				
							HMPOpenableButton:SetSize(32, 32)
							HMPOpenableButton:SetPoint("LEFT", -45, 0)
				
							HMPOpenableButton:Show()
							return
						end
					end
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