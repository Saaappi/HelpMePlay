local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local slots = { 1, 3, 4, 5, 6, 7, 8, 9, 10, 15, 16, 17, 18, 19 }
local HMPTransmogButton = _G.CreateFrame(
	"Button",
	"HMPTransmogButton",
	_G.ContainerFrame1,
	"OptionsButtonTemplate"
)
local normalTexture = e:CreateTexture()
local highlightTexture = e:CreateTexture()

local function RequipOriginalItems(equippedItems)
	local currentlyEquippedItemLink
	
	-- Open the character frame, then close it
	-- 1 second later and run the remaining code.
	if not UnitAffectingCombat("player") then
		ToggleCharacter("PaperDollFrame")
		C_Timer.After(1, function()
			CharacterFrameCloseButton:Click()
			-- We need to rescan the equipped items
			-- so we can run comparisons to the original items.
			for _, item in ipairs(equippedItems) do
				currentlyEquippedItemLink = GetInventoryItemLink("player", item.id)
				if currentlyEquippedItemLink ~= item.link then -- The original item isn't equipped.
					EquipItemByName(item.link)
				end
			end
		end)
	end
end

local function LearnAllUnknownTransmog(equippedItems)
	local itemLink
	local sourceId
	local canCollectSource
	local appearanceInfo = {}
	
	-- Open the player bags, then close them
	-- 1 second later and run the remaining code.
	if not UnitAffectingCombat("player") then
		OpenAllBags()
		C_Timer.After(1, function()
			CloseAllBags()
			for i=0, NUM_BAG_SLOTS do -- We iterate through the inventory, bags 0 to 4.
				for j=1, GetContainerNumSlots(i) do -- We iterate through the bag slots for each bag.
					_, _, _, _, _, _, itemLink = GetContainerItemInfo(i, j)
					if itemLink then -- If we return a valid item link, then continue.
						_, sourceId = C_TransmogCollection.GetItemInfo(itemLink)
						if sourceId then -- If we return a valid source ID, then continue.
							_, canCollectSource = C_TransmogCollection.PlayerCanCollectSource(sourceId)
							if canCollectSource then -- The player can learn the source on the current character.
								appearanceInfo = C_TransmogCollection.GetAppearanceInfoBySource(sourceId)
								if appearanceInfo then
									if appearanceInfo.sourceIsCollected == false then -- If the player hasn't already learned the source, then continue.
										EquipItemByName(itemLink)
										if StaticPopup1:IsVisible() then -- The "soulbind" popup is visible. Click the okay button.
											StaticPopup1Button1:Click("LeftButton")
										end
									end
								end
							else
								local _, _, itemQuality, _, _, _, _, _, _, _, _, _, _, bindType = GetItemInfo(itemLink)
								
								if bindType ~= 1 and itemQuality >= 2 then -- The item isn't soulbound, so it can be mailed. The quality is at least green.
									-- The player can't use the transmog, so let's
									-- check if it's unknown so we can inform them.
									appearanceInfo = C_TransmogCollection.GetAppearanceInfoBySource(sourceId)
									if appearanceInfo then
										if appearanceInfo.sourceIsCollected == false then
											local _, _, _, _, _, _, itemSubType = GetItemInfo(itemLink)
											if itemSubType then
												if HelpMePlayOptionsDB.Logging then
													print(L_GLOBALSTRINGS["Unlearnable Appearance"] .. ": " .. itemLink .. " (" .. itemSubType .. ")")
												end
											else
												if HelpMePlayOptionsDB.Logging then
													print(L_GLOBALSTRINGS["Unlearnable Appearance"] .. ": " .. itemLink)
												end
											end
										end
									else
										print(string.format(L_GLOBALSTRINGS["Unknown Source ID"], itemLink, i, j))
									end
								end
							end
						end
					end
				end
			end

			RequipOriginalItems(equippedItems)
		end)
	end
end

function HelpMePlay_GetEquippedItems()
	local equippedItems = {}
	local itemLink
	
	-- Open the character frame, then close it
	-- 1 second later and run the remaining code.
	if not UnitAffectingCombat("player") then
		ToggleCharacter("PaperDollFrame")
		C_Timer.After(1, function()
			CharacterFrameCloseButton:Click()
			-- Get the players currently equipped items
			-- in transmog-capable slots and store them
			-- in a separate table.
			--
			-- We'll use this separate table to re-equip
			-- items once we're done.
			for _, v in ipairs(slots) do
				itemLink = GetInventoryItemLink("player", v)
				if itemLink then
					table.insert(equippedItems, { id = v, link = itemLink})
				end
			end
			
			LearnAllUnknownTransmog(equippedItems)
		end)
	end
	
	return
end

hooksecurefunc("ContainerFrame_OnShow", function(self)
	-- Texture work. Let's recreate the bag sorting button.
		normalTexture:SetTexture("Interface\\Transmogrify\\Transmogrify")
		normalTexture:SetSize(18, 18)
		normalTexture:SetTexCoord(0.8125, 0.880859, 0.09375, 0.166016)
		
		highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
		highlightTexture:SetSize(18, 17)
		
		HMPTransmogButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		
		HMPTransmogButton:SetNormalTexture(normalTexture)
		HMPTransmogButton:SetHighlightTexture(highlightTexture, "ADD")
		
		-- Let's get the button on the base container frame.
		HMPTransmogButton:SetSize(18, 18)
		HMPTransmogButton:SetPoint("TOPLEFT", 26, -46)
end)

HMPTransmogButton:HookScript("OnClick", function(self)
	HelpMePlay_GetEquippedItems()
end)

HMPTransmogButton:HookScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetText(L_GLOBALSTRINGS["Transmog Button"])
	GameTooltip:Show()
end)

HMPTransmogButton:HookScript("OnLeave", function(self)
	if GameTooltip:GetOwner() == self then
		GameTooltip:Hide()
	end
end)