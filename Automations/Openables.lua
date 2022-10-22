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

e:RegisterEvent("ITEM_PUSH")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "ITEM_PUSH" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.OpenablesEnabled == false or HelpMePlayDB.OpenablesEnabled == nil then return false end
		local bagId, fileIconId = ...
		if bagId and fileIconId then
			local numSlots = GetContainerNumSlots(bagId)
			for slot = 1, numSlots do
				local texture, _, _, _, _, lootable = GetContainerItemInfo(bagId, slot)
				if texture then
					if lootable then
						if texture == fileIconId then
							bag = bagId
							bagSlot = slot
							
							HMPQueueButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
							
							normalTexture:SetTexture(item.texture)
							normalTexture:SetSize(32, 32)
				
							HMPOpenableButton:SetNormalTexture(normalTexture)
							HMPOpenableButton:SetHighlightTexture(highlightTexture, "ADD")
				
							HMPOpenableButton:SetSize(32, 32)
							HMPOpenableButton:SetPoint("LEFT", -45, 0)
				
							HMPOpenableButton:Show()
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