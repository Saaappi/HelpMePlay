local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local merchantButton
local userMerchantButton
local expandButton
local collapseButton

eventHandler:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
        if HelpMePlayDB["PurchaseQuestItems"] == false then return end

        local type = ...
        if type == 5 then
            local GUID = UnitGUID("npc")
            if GUID then
                local id = LHMP:SplitString(GUID, "-", 6)
                if id then
                    local items = LHMP:GetItemsForMerchant(id)
                    if items then
                        for _, item in ipairs(items) do
                            local isAllowed = HelpMePlay.EvaluateConditions(item.Conditions)
                            if isAllowed then
                                BuyMerchantItem(item.Index, item.Quantity)
                            end
                        end
                    end
                    if HelpMePlayDB.PlayerQuestMerchants[id] then
                        for _, items in pairs(HelpMePlayDB.PlayerQuestMerchants[id]) do
                            for _, item in pairs(items) do
                                BuyMerchantItem(item.index, item.quantity)
                            end
                        end
                    end
                end
            end

            if MerchantFrame:IsVisible() and C_BattleNet.GetAccountInfoByGUID(HelpMePlay.playerGUID).battleTag == HelpMePlay.Constants["AUTHOR_BATTLETAG"] then
                if not merchantButton then
                    merchantButton = HelpMePlay.CreateWidget("IconButton", {
                        name = addonName .. "MerchantInfoButton",
                        width = 32,
                        height = 32,
                        parent = MerchantFrame,
                        texture = 133786,
                        useFontString = false,
                        fontStringText = ""
                    })

                    merchantButton:ClearAllPoints()
                    merchantButton:SetPoint("TOPLEFT", MerchantFrame, "TOPRIGHT", 10, 0)

                    merchantButton:SetScript("OnClick", function()
                        -- NPC ID
                        local GUID = UnitGUID("target")
                        if GUID then
                            local npcID = LHMP:SplitString(GUID, "-", 6)
                            print(npcID)
                        end

                        -- Wares
                        for i = 1, GetMerchantNumItems() do
                            local name = GetMerchantItemInfo(i)
                            if name then
                                print(string.format("%s: %s", LHMP:ColorText("UNCOMMON", i), name))
                            end
                        end
                    end)
                    merchantButton:SetScript("OnEnter", function(self)
                        HelpMePlay.Tooltip_OnEnter(self, "Merchant", "Get a list of the current merchant's wares.")
                    end)
                    merchantButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
                end
            end
        end
    end
end)

MerchantFrame:HookScript("OnShow", function(self)
	if not expandButton then
		expandButton = CreateFrame("Button", nil, self)
		expandButton:SetSize(20, 20)
		expandButton:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 50, 10)
		expandButton.texture = expandButton:CreateTexture()
		expandButton.texture:SetAtlas("common-icon-forwardarrow")
		expandButton:SetNormalTexture(expandButton.texture)
		expandButton:SetHighlightAtlas("common-icon-forwardarrow", "ADD")

		expandButton:SetScript("OnClick", function(self)
			PlaySound(SOUNDKIT.IG_QUEST_LOG_OPEN)
			collapseButton:Show()
			userMerchantButton:Show()
			self:Hide()
			isExpanded = true
		end)
		expandButton:SetScript("OnEnter", function(self) HelpMePlay.Tooltip_OnEnter(self, "Click to show the NPC utilities.", "") end)
		expandButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
	end

	if not collapseButton then
		collapseButton = CreateFrame("Button", nil, self)
		collapseButton:SetSize(20, 20)
		collapseButton:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 50, 10)
		collapseButton.texture = collapseButton:CreateTexture()
		collapseButton.texture:SetAtlas("common-icon-backarrow")
		collapseButton:SetNormalTexture(collapseButton.texture)
		collapseButton:SetHighlightAtlas("common-icon-backarrow", "ADD")

		collapseButton:SetScript("OnClick", function(self)
			PlaySound(SOUNDKIT.IG_QUEST_LOG_CLOSE)
			expandButton:Show()
			userMerchantButton:Hide()
			self:Hide()
			isExpanded = false
		end)
		collapseButton:SetScript("OnEnter", function(self) HelpMePlay.Tooltip_OnEnter(self, "Click to hide the NPC utilities.", "") end)
		collapseButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
	end

	if not userMerchantButton then
		userMerchantButton = HelpMePlay.CreateWidget("ActionButton", {
			name = string.format("%sUserMerchantButton", addonName),
			parent = collapseButton,
		})
		userMerchantButton:SetScale(0.75)

		userMerchantButton:ClearAllPoints()
		userMerchantButton:SetPoint("LEFT", collapseButton, "RIGHT", 10, 0)

		userMerchantButton.icon:SetTexture(133785)

		userMerchantButton:SetScript("OnClick", function()
			StaticPopupDialogs["HMP_CUSTOM_MERCHANT_OPTION"] = {
				text = "Please enter the index and quantity of the item (separated by a comma) you would like to add.\n\n" ..
				"If you're removing an item, you can omit the comma and the quantity.\n\n" ..
				LHMP:ColorText("RED", "Please keep in mind, the addon has priority in the Merchant subsystem."),
				button1 = YES,
				button2 = NO,
				explicitAcknowledge = true,
				hasEditBox = true,
				OnAccept = function(self)
					local input = self.editBox:GetText()
					local index, quantity = string.split(",", input)
					if tonumber(index) then
						index = tonumber(index)
						local GUID = UnitGUID("npc")
						if GUID then
							local id = LHMP:SplitString(GUID, "-", 6)
							if id then
								if not HelpMePlayDB.PlayerQuestMerchants[id] then
									HelpMePlayDB.PlayerQuestMerchants[id] = {}
								end

								local itemId = GetMerchantItemID(index)
								if itemId then
									if not HelpMePlayDB.PlayerQuestMerchants[id][itemId] then
										HelpMePlayDB.PlayerQuestMerchants[id][itemId] = {}
										table.insert(HelpMePlayDB.PlayerQuestMerchants[id][itemId], {index = index, quantity = quantity})
									else
										HelpMePlayDB.PlayerQuestMerchants[id][itemId] = nil
									end
								end
							end
						end
					end
				end,
				OnCancel = function()
				end,
				preferredIndex = 3
			}
			StaticPopup_Show("HMP_CUSTOM_MERCHANT_OPTION")
		end)
		userMerchantButton:SetScript("OnEnter", function(self)
			if UnitExists("npc") and (not UnitIsPlayer("npc")) then
				HelpMePlay.Tooltip_OnEnter(self, "Merchant", string.format("Click to add or remove a custom merchant item for %s.", LHMP:ColorText("UNCOMMON", UnitName("npc"))))
			end
		end)
		userMerchantButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
	end

	if isExpanded then
		collapseButton:Show()
		userMerchantButton:Show()
		expandButton:Hide()
	else
		expandButton:Show()
		collapseButton:Hide()
		userMerchantButton:Hide()
	end
end)