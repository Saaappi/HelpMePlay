local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local HMPGuildBankSortButton = _G.CreateFrame(
	"Button",
	"HMPGuildBankSortButton",
	_G.GuildBankFrame,
	"OptionsButtonTemplate"
)
local normalTexture = e:CreateTexture()
local pushedTexture = e:CreateTexture()
local highlightTexture = e:CreateTexture()

local function SortGuildBank()
	local currentTab = GetCurrentGuildBankTab()
	if IsGuildLeader() then
	end
end

e:RegisterEvent("GUILDBANKFRAME_CLOSED")
e:RegisterEvent("GUILDBANKFRAME_OPENED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GUILDBANKFRAME_OPENED" then
		-- Texture work. Let's recreate the bag sorting button.
		normalTexture:SetTexture("Interface\\ContainerFrame\\Bags")
		normalTexture:SetSize(18, 16)
		normalTexture:SetTexCoord(0.3125, 0.421875, 0.5390625, 0.640625)
		
		pushedTexture:SetTexture("Interface\\ContainerFrame\\Bags")
		pushedTexture:SetSize(18, 16)
		pushedTexture:SetTexCoord(0.1640625, 0.2734375, 0.8359375, 0.9375)
		
		highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
		highlightTexture:SetSize(14, 11)
		
		HMPGuildBankSortButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		
		HMPGuildBankSortButton:SetNormalTexture(normalTexture)
		HMPGuildBankSortButton:SetPushedTexture(pushedTexture)
		HMPGuildBankSortButton:SetHighlightTexture(highlightTexture, "ADD")
		
		-- Let's get the button on the MerchantFrame.
		HMPGuildBankSortButton:SetSize(18, 16)
		HMPGuildBankSortButton:SetFrameStrata("HIGH")
		HMPGuildBankSortButton:SetPoint("TOPRIGHT", _G.GuildBankFrame, "TOPRIGHT", -100, -18)
		HMPGuildBankSortButton:Show()
	end
	if event == "GUILDBANKFRAME_CLOSED" then
		HMPGuildBankSortButton:Hide()
	end
end)

HMPGuildBankSortButton:HookScript("OnClick", function(self)
	--SortGuildBank()
end)

HMPGuildBankSortButton:HookScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetText(L_GLOBALSTRINGS["Guild Bank Sort Button"])
	GameTooltip:Show()
end)

HMPGuildBankSortButton:HookScript("OnLeave", function(self)
	if GameTooltip:GetOwner() == self then
		GameTooltip:Hide()
	end
end)