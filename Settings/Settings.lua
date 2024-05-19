local addonName, addon = ...
local LibDD = LibStub:GetLibrary("LibUIDropDownMenu-4.0")

-- Font Strings
local addonAuthor
local addonVersion

-- Basic Buttons
local openIssueButton
local talentImporterButton
local heirloomButton
--local routeBuilderButton

-- Check Buttons
local skipCutscenesCB
local adventureMapsCB
local questsCB
local allQuestsCB
local ignoreRepeatableQuestsCB
local ignoreDailyQuestsCB
local emotesCB
local muteTalkingHeadCB
local gossipCB
local partyPlayCB
local readyChecksCB
local roleChecksCB
local repairsCB
local purchaseQuestItemsCB
local dynamicFlightCB
local worldEventQueueCB
local openHolidayItemsCB
local warModeCB
local rareScanCB
local chatIconsCB
local keepMeSafeCB

-- Dropdowns
local chromieTimeDropDown
local questRewardsDropDown

-- Edit Boxes
local trainerProtectionValueEB
local depositKeepAmountValueEB

-- Help Buttons
local outdatedVersionHB

local Panel = CreateFrame("Frame", addonName .. "SettingsPanel", SettingsPanel)
Panel:Hide()
Panel["name"] = addonName
InterfaceOptions_AddCategory(Panel)

-- This is the date of the NEXT update. If the player's
-- installed version of the addon is older than the date
-- below, then the user hasn't updated their addon.
local nextUpdate = {
    ["monthDay"] = 1,
    ["weekday"] = 1,
    ["month"] = 1,
    ["minute"] = 0,
    ["hour"] = 0,
    ["year"] = 1980
}

C_Timer.After(5, function()
    addonAuthor = Panel:CreateFontString(addonName .. "Author", nil, "GameTooltipText")
    addonAuthor:SetPoint("TOPLEFT", 15, -10)
    addonAuthor:SetText("|cffFFD100Author:|r " .. C_AddOns.GetAddOnMetadata(addonName, "Author"))
    
    addonVersion = Panel:CreateFontString(addonName .. "Version", nil, "GameTooltipText")
    addonVersion:SetPoint("TOPLEFT", addonAuthor, "BOTTOMLEFT", 0, -5)
    addonVersion:SetText("|cffFFD100Version:|r " .. C_AddOns.GetAddOnMetadata(addonName, "Version"))

    outdatedVersionHB = {
        name = addonName .. "OutdatedVersionHB",
        parent = Panel,
        anchor = "TOPLEFT",
        relativeAnchor = "TOPLEFT",
        oX = -5,
        oY = -25,
        width = 16,
        height = 16,
        tooltipText = C_AddOns.GetAddOnMetadata(addonName, "Version") .. " is an outdated version. You should check CurseForge for an update.",
    }
    setmetatable(outdatedVersionHB, { __index = HelpMePlay.Button })
    outdatedVersionHB = outdatedVersionHB:HelpButton()
    if C_DateAndTime.CompareCalendarTime(C_DateAndTime.GetCurrentCalendarTime(), nextUpdate) == -1 then
         outdatedVersionHB:Show()
    else
         outdatedVersionHB:Hide()
    end

    skipCutscenesCB = {
        name = addonName .. "SkipCutscenesCB",
        parent = Panel,
        anchor = "TOPLEFT",
        relativeAnchor = "TOPLEFT",
        oX = 15,
        oY = -60,
        tooltipHeader = "Skip Cutscenes",
        tooltipText = "Toggle skipping cutscenes and in-game movies.",
        onClick = function()
            HelpMePlayDB["SkipCutscenes"] = skipCutscenesCB:GetChecked()
        end,
    }
    setmetatable(skipCutscenesCB, { __index = HelpMePlay.Button })
    skipCutscenesCB = skipCutscenesCB:CheckButton()
    skipCutscenesCB:SetChecked(HelpMePlayDB["SkipCutscenes"])

    adventureMapsCB = {
        name = addonName .. "AdventureMapsCB",
        parent = skipCutscenesCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Adventure Maps",
        tooltipText = "Toggle to automatically accept quests from adventure maps.\n\n" ..
        "|cffFF0000NOTE:|r The current support is only for the adventure map in The Waking Shores.",
        onClick = function()
            HelpMePlayDB["UseAdventureMaps"] = adventureMapsCB:GetChecked()
        end,
    }
    setmetatable(adventureMapsCB, { __index = HelpMePlay.Button })
    adventureMapsCB = adventureMapsCB:CheckButton()
    adventureMapsCB:SetChecked(HelpMePlayDB["UseAdventureMaps"])

    questsCB = {
        name = addonName .. "QuestsCB",
        parent = adventureMapsCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Quests",
        tooltipText = "Toggle the acceptance and completion of guide quests, as well as the selection of quest rewards.\n\n" ..
        "|cffFF0000This setting is mutually exclusive with All Quests.|r",
        onClick = function()
            HelpMePlayDB["AcceptAndCompleteQuests"] = questsCB:GetChecked()
        end,
    }
    setmetatable(questsCB, { __index = HelpMePlay.Button })
    questsCB = questsCB:CheckButton()
    questsCB:SetChecked(HelpMePlayDB["AcceptAndCompleteQuests"])

    allQuestsCB = {
        name = addonName .. "AllQuestsCB",
        parent = questsCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 15,
        oY = -5,
        tooltipHeader = "All Quests",
        tooltipText = "Toggle the acceptance and completion of all quests, as well as the selection of quest rewards.\n\n" ..
        "|cffFF0000This setting is mutually exclusive with Quests.|r",
        onClick = function()
            HelpMePlayDB["AcceptAndCompleteAllQuests"] = allQuestsCB:GetChecked()
            if allQuestsCB:GetChecked() then
                questsCB:SetEnabled(false)
                HelpMePlayDB["AcceptAndCompleteQuests"] = false
                questsCB:SetChecked(HelpMePlayDB["AcceptAndCompleteQuests"])
            else
                questsCB:SetEnabled(true)
                HelpMePlayDB["AcceptAndCompleteQuests"] = true
                questsCB:SetChecked(HelpMePlayDB["AcceptAndCompleteQuests"])
            end
        end,
    }
    setmetatable(allQuestsCB, { __index = HelpMePlay.Button })
    allQuestsCB = allQuestsCB:CheckButton()
    allQuestsCB:SetChecked(HelpMePlayDB["AcceptAndCompleteAllQuests"])

    ignoreRepeatableQuestsCB = {
        name = addonName .. "IgnoreRepeatableQuestsCB",
        parent = allQuestsCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Ignore Repeatable Quests",
        tooltipText = "Toggle to ignore repeatable quests.",
        onClick = function()
            HelpMePlayDB["IgnoreRepeatableQuests"] = ignoreRepeatableQuestsCB:GetChecked()
        end,
    }
    setmetatable(ignoreRepeatableQuestsCB, { __index = HelpMePlay.Button })
    ignoreRepeatableQuestsCB = ignoreRepeatableQuestsCB:CheckButton()
    ignoreRepeatableQuestsCB:SetChecked(HelpMePlayDB["IgnoreRepeatableQuests"])

    ignoreDailyQuestsCB = {
        name = addonName .. "IgnoreDailyQuestsCB",
        parent = ignoreRepeatableQuestsCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Ignore Daily Quests",
        tooltipText = "Toggle to ignore daily quests.",
        onClick = function()
            HelpMePlayDB["IgnoreDailyQuests"] = ignoreDailyQuestsCB:GetChecked()
        end,
    }
    setmetatable(ignoreDailyQuestsCB, { __index = HelpMePlay.Button })
    ignoreDailyQuestsCB = ignoreDailyQuestsCB:CheckButton()
    ignoreDailyQuestsCB:SetChecked(HelpMePlayDB["IgnoreDailyQuests"])

    emotesCB = {
        name = addonName .. "EmotesCB",
        parent = ignoreDailyQuestsCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = -15,
        oY = -5,
        tooltipHeader = "Emotes",
        tooltipText = "Toggle to automatically emote at appropriate NPCs.",
        onClick = function()
            HelpMePlayDB["UseEmotes"] = emotesCB:GetChecked()
        end,
    }
    setmetatable(emotesCB, { __index = HelpMePlay.Button })
    emotesCB = emotesCB:CheckButton()
    emotesCB:SetChecked(HelpMePlayDB["UseEmotes"])

    muteTalkingHeadCB = {
        name = addonName .. "MuteTalkingHeadCB",
        parent = emotesCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Mute Talking Head",
        tooltipText = "Toggle to hide and prevent the talking head popup.",
        onClick = function()
            HelpMePlayDB["MuteTalkingHead"] = muteTalkingHeadCB:GetChecked()
        end,
    }
    setmetatable(muteTalkingHeadCB, { __index = HelpMePlay.Button })
    muteTalkingHeadCB = muteTalkingHeadCB:CheckButton()
    muteTalkingHeadCB:SetChecked(HelpMePlayDB["MuteTalkingHead"])

    gossipCB = {
        name = addonName .. "GossipCB",
        parent = muteTalkingHeadCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Gossip",
        tooltipText = "Toggle the automatic selection of NPC gossips.\n\n" ..
        "|cffFF0000NOTE:|r Only gossips that are present in the addon's code are automatically selected, not all of them.",
        onClick = function()
            HelpMePlayDB["AcceptGossip"] = gossipCB:GetChecked()
        end,
    }
    setmetatable(gossipCB, { __index = HelpMePlay.Button })
    gossipCB = gossipCB:CheckButton()
    gossipCB:SetChecked(HelpMePlayDB["AcceptGossip"])

    partyPlayCB = {
        name = addonName .. "GossipCB",
        parent = gossipCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Party Play",
        tooltipText = "Toggle to make playing with friends a little easier.\n\n" ..
        "|cffFF0000NOTE:|r Party Play, by default, will only auto share quests with party members. Announcements have been removed.",
        onClick = function()
            HelpMePlayDB["UsePartyPlay"] = partyPlayCB:GetChecked()
        end,
    }
    setmetatable(partyPlayCB, { __index = HelpMePlay.Button })
    partyPlayCB = partyPlayCB:CheckButton()
    partyPlayCB:SetChecked(HelpMePlayDB["UsePartyPlay"])

    readyChecksCB = {
        name = addonName .. "ReadyChecksCB",
        parent = partyPlayCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Ready Checks",
        tooltipText = "Toggle to automatically accept ready checks.",
        onClick = function()
            HelpMePlayDB["AcceptReadyChecks"] = readyChecksCB:GetChecked()
        end,
    }
    setmetatable(readyChecksCB, { __index = HelpMePlay.Button })
    readyChecksCB = readyChecksCB:CheckButton()
    readyChecksCB:SetChecked(HelpMePlayDB["AcceptReadyChecks"])

    roleChecksCB = {
        name = addonName .. "RoleChecksCB",
        parent = readyChecksCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Role Checks",
        tooltipText = "Toggle to automatically accept role checks.",
        onClick = function()
            HelpMePlayDB["AcceptRoleChecks"] = roleChecksCB:GetChecked()
        end,
    }
    setmetatable(roleChecksCB, { __index = HelpMePlay.Button })
    roleChecksCB = roleChecksCB:CheckButton()
    roleChecksCB:SetChecked(HelpMePlayDB["AcceptRoleChecks"])

    repairsCB = {
        name = addonName .. "RepairsCB",
        parent = roleChecksCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Repairs",
        tooltipText = "Toggle to automatically repair at merchants.",
        onClick = function()
            HelpMePlayDB["ShouldRepair"] = repairsCB:GetChecked()
        end,
    }
    setmetatable(repairsCB, { __index = HelpMePlay.Button })
    repairsCB = repairsCB:CheckButton()
    repairsCB:SetChecked(HelpMePlayDB["ShouldRepair"])

    purchaseQuestItemsCB = {
        name = addonName .. "PurchaseQuestItemsCB",
        parent = skipCutscenesCB,
        anchor = "LEFT",
        relativeAnchor = "RIGHT",
        oX = 225,
        oY = 0,
        tooltipHeader = "Purchase Quest Items",
        tooltipText = "Toggle to automatically purchase quest items from merchants.",
        onClick = function()
            HelpMePlayDB["PurchaseQuestItems"] = purchaseQuestItemsCB:GetChecked()
        end,
    }
    setmetatable(purchaseQuestItemsCB, { __index = HelpMePlay.Button })
    purchaseQuestItemsCB = purchaseQuestItemsCB:CheckButton()
    purchaseQuestItemsCB:SetChecked(HelpMePlayDB["PurchaseQuestItems"])

    dynamicFlightCB = {
        name = addonName .. "DynamicFlightCB",
        parent = purchaseQuestItemsCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Dynamic Flight",
        tooltipText = "Toggle to add a button to learn Dynamic Flight (Dragonriding) talents.",
        onClick = function()
            HelpMePlayDB["UseDynamicFlightButton"] = dynamicFlightCB:GetChecked()
        end,
    }
    setmetatable(dynamicFlightCB, { __index = HelpMePlay.Button })
    dynamicFlightCB = dynamicFlightCB:CheckButton()
    dynamicFlightCB:SetChecked(HelpMePlayDB["UseDynamicFlightButton"])

    worldEventQueueCB = {
        name = addonName .. "WorldEventQueueCB",
        parent = dynamicFlightCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "World Event Queue",
        tooltipText = "Toggle to add a button to the top middle of your screen. This button can be used to queue into active world events.\n\n" ..
        "|cffFF0000NOTE:|r This button will appear conditionally.",
        onClick = function()
            HelpMePlayDB["UseWorldEventQueue"] = worldEventQueueCB:GetChecked()
        end,
    }
    setmetatable(worldEventQueueCB, { __index = HelpMePlay.Button })
    worldEventQueueCB = worldEventQueueCB:CheckButton()
    worldEventQueueCB:SetChecked(HelpMePlayDB["UseWorldEventQueue"])

    openHolidayItemsCB = {
        name = addonName .. "OpenHolidayItemsCB",
        parent = worldEventQueueCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Open Holiday Items",
        tooltipText = "Toggle to automatically open holiday items when you loot them.\n\n" ..
        "These are items like the |T133661:0|t |cffA335EE[Loot-Filled Pumpkin]|r.",
        onClick = function()
            HelpMePlayDB["OpenHolidayItems"] = openHolidayItemsCB:GetChecked()
        end,
    }
    setmetatable(openHolidayItemsCB, { __index = HelpMePlay.Button })
    openHolidayItemsCB = openHolidayItemsCB:CheckButton()
    openHolidayItemsCB:SetChecked(HelpMePlayDB["OpenHolidayItems"])

    warModeCB = {
        name = addonName .. "WarModeCB",
        parent = openHolidayItemsCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "War Mode",
        tooltipText = format("Toggle to automatically enable War Mode when entering or logging into Orgrimmar or Stormwind City.\n\n" ..
        "|cffFF0000NOTE:|r This setting doesn't apply to players at or above level %d.", addon.Constants["CHROMIE_TIME_MAX_LEVEL"]),
        onClick = function()
            HelpMePlayDB["UseWarMode"] = warModeCB:GetChecked()
        end,
    }
    setmetatable(warModeCB, { __index = HelpMePlay.Button })
    warModeCB = warModeCB:CheckButton()
    warModeCB:SetChecked(HelpMePlayDB["UseWarMode"])

    rareScanCB = {
        name = addonName .. "RareScanCB",
        parent = warModeCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Rare Scan",
        tooltipText = "Toggle if you wish to receive a popup notification and sound for nearby rares.",
        onClick = function()
            HelpMePlayDB["RareScan"] = rareScanCB:GetChecked()
        end,
    }
    setmetatable(rareScanCB, { __index = HelpMePlay.Button })
    rareScanCB = rareScanCB:CheckButton()
    rareScanCB:SetChecked(HelpMePlayDB["RareScan"])

    chatIconsCB = {
        name = addonName .. "ChatIconsCB",
        parent = rareScanCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Chat Icons",
        tooltipText = "Toggle to show item and collection status (when appropriate) icons in the chat frame.",
        onClick = function()
            HelpMePlayDB["ShowChatIcons"] = chatIconsCB:GetChecked()
        end,
    }
    setmetatable(chatIconsCB, { __index = HelpMePlay.Button })
    chatIconsCB = chatIconsCB:CheckButton()
    chatIconsCB:SetChecked(HelpMePlayDB["ShowChatIcons"])

    chromieTimeDropDown = {
        name = addonName .. "ChromieTimeDropDown",
        parent = dynamicFlightCB,
        anchor = "LEFT",
        relativeAnchor = "RIGHT",
        oX = 175,
        oY = 0,
        width = 150,
        height = 38,
        title = "Chromie Time",
        tooltipHeader = "Chromie Time",
        tooltipText = "Select the expansion to use when speaking with Chromie in Orgrimmar or Stormwind City.",
        options = {
            {
                ["text"] = "Dragonflight",
                ["expansionID"] = 16,
                ["disabled"] = true,
                ["func"] = function()
                    local value = 16
                    HelpMePlayDB["ChromieTimeExpansionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(chromieTimeDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(chromieTimeDropDown, addon.CHROMIE_TIME_IDS[value])
                end,
            },
            {
                ["text"] = EXPANSION_NAME8,
                ["disabled"] = false,
                ["func"] = function()
                    local value = 14
                    HelpMePlayDB["ChromieTimeExpansionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(chromieTimeDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(chromieTimeDropDown, addon.CHROMIE_TIME_IDS[value])
                end,
            },
            {
                ["text"] = EXPANSION_NAME7,
                ["disabled"] = false,
                ["func"] = function()
                    local value = 15
                    HelpMePlayDB["ChromieTimeExpansionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(chromieTimeDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(chromieTimeDropDown, addon.CHROMIE_TIME_IDS[value])
                end,
            },
            {
                ["text"] = EXPANSION_NAME6,
                ["disabled"] = false,
                ["func"] = function()
                    local value = 10
                    HelpMePlayDB["ChromieTimeExpansionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(chromieTimeDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(chromieTimeDropDown, addon.CHROMIE_TIME_IDS[value])
                end,
            },
            {
                ["text"] = EXPANSION_NAME5,
                ["disabled"] = false,
                ["func"] = function()
                    local value = 9
                    HelpMePlayDB["ChromieTimeExpansionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(chromieTimeDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(chromieTimeDropDown, addon.CHROMIE_TIME_IDS[value])
                end,
            },
            {
                ["text"] = EXPANSION_NAME4,
                ["disabled"] = false,
                ["func"] = function()
                    local value = 8
                    HelpMePlayDB["ChromieTimeExpansionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(chromieTimeDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(chromieTimeDropDown, addon.CHROMIE_TIME_IDS[value])
                end,
            },
            {
                ["text"] = EXPANSION_NAME3,
                ["disabled"] = false,
                ["func"] = function()
                    local value = 5
                    HelpMePlayDB["ChromieTimeExpansionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(chromieTimeDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(chromieTimeDropDown, addon.CHROMIE_TIME_IDS[value])
                end,
            },
            {
                ["text"] = EXPANSION_NAME2,
                ["disabled"] = false,
                ["func"] = function()
                    local value = 7
                    HelpMePlayDB["ChromieTimeExpansionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(chromieTimeDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(chromieTimeDropDown, addon.CHROMIE_TIME_IDS[value])
                end,
            },
            {
                ["text"] = EXPANSION_NAME1,
                ["disabled"] = false,
                ["func"] = function()
                    local value = 6
                    HelpMePlayDB["ChromieTimeExpansionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(chromieTimeDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(chromieTimeDropDown, addon.CHROMIE_TIME_IDS[value])
                end,
            },
            {
                ["text"] = NONE,
                ["disabled"] = false,
                ["func"] = function()
                    local value = 0
                    HelpMePlayDB["ChromieTimeExpansionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(chromieTimeDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(chromieTimeDropDown, addon.CHROMIE_TIME_IDS[value])
                end,
            }
        },
    }
    setmetatable(chromieTimeDropDown, { __index = HelpMePlay.DropDown })
    chromieTimeDropDown = chromieTimeDropDown:DropDown()
    LibDD:UIDropDownMenu_SetText(chromieTimeDropDown, addon.CHROMIE_TIME_IDS[HelpMePlayDB["ChromieTimeExpansionID"]])

    questRewardsDropDown = {
        name = addonName .. "QuestRewardsDropDown",
        parent = chromieTimeDropDown,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -30,
        width = 150,
        height = 38,
        title = "Quest Rewards",
        tooltipHeader = "Quest Rewards",
        tooltipText = "Select how quest rewards should be chosen.\n\n" ..
        "If Item Level is selected, then chosen quest rewards are automatically equipped by " .. addonName .. ".",
        options = {
            {
                ["text"] = "Item Level",
                ["disabled"] = false,
                ["func"] = function()
                    local value = 1
                    HelpMePlayDB["QuestRewardSelectionTypeID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(questRewardsDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(questRewardsDropDown, addon.QUEST_REWARDS_TYPES[value])
                end,
            },
            {
                ["text"] = "Sell Price",
                ["disabled"] = false,
                ["func"] = function()
                    local value = 2
                    HelpMePlayDB["QuestRewardSelectionTypeID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(questRewardsDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(questRewardsDropDown, addon.QUEST_REWARDS_TYPES[value])
                end,
            },
            {
                ["text"] = NONE,
                ["disabled"] = false,
                ["func"] = function()
                    local value = 0
                    HelpMePlayDB["QuestRewardSelectionTypeID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(questRewardsDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(questRewardsDropDown, addon.QUEST_REWARDS_TYPES[value])
                end,
            }
        },
    }
    setmetatable(questRewardsDropDown, { __index = HelpMePlay.DropDown })
    questRewardsDropDown = questRewardsDropDown:DropDown()
    LibDD:UIDropDownMenu_SetText(questRewardsDropDown, addon.QUEST_REWARDS_TYPES[HelpMePlayDB["QuestRewardSelectionTypeID"]])

    trainerProtectionValueEB = {
        name = addonName .. "TrainerProtectionValueEB",
        parent = questRewardsDropDown,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 20,
        oY = -40,
        width = 100,
        height = 10,
        title = "Trainer Protection Value",
        maxLetters = 4,
        tooltipHeader = "Trainer Protection Value",
        tooltipText = "Enter the minimum amount of gold you must have before the addon will automatically train for you.\n\n" ..
        "Enter 0 if you don't want the addon to train for you.\n\n" ..
        "|cffFF0000NOTE:|r You can enter up to 9,999.",
        onEnterPressed = function(self)
            if tonumber(self:GetText(), 10) then
                HelpMePlayDB["TrainerProtectionValue"] = tonumber(self:GetText(), 10) * 10000
            end
            self:SetText(C_CurrencyInfo.GetCoinTextureString(HelpMePlayDB["TrainerProtectionValue"]))
            self:ClearFocus()
        end,
    }
    setmetatable(trainerProtectionValueEB, { __index = HelpMePlay.Frame })
    trainerProtectionValueEB = trainerProtectionValueEB:EditBox()
    trainerProtectionValueEB:SetText(C_CurrencyInfo.GetCoinTextureString(HelpMePlayDB["TrainerProtectionValue"]))

    depositKeepAmountValueEB = {
        name = addonName .. "DepositKeepAmountValueEB",
        parent = trainerProtectionValueEB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -40,
        width = 100,
        height = 10,
        title = "Deposit Keep Amount",
        maxLetters = 7,
        tooltipHeader = "Deposit Keep Amount",
        tooltipText = "Enter the minimum amount of gold you would like to keep on your character after making a deposit.\n\n" ..
        "Visiting a guild bank while below this threshold will instead attempt a withdrawal, provided the guild bank has the funds.",
        onEnterPressed = function(self)
            if tonumber(self:GetText(), 10) then
                HelpMePlayDB["DepositKeepAmount"] = tonumber(self:GetText(), 10) * 10000
            end
            self:SetText(C_CurrencyInfo.GetCoinTextureString(HelpMePlayDB["DepositKeepAmount"]))
            self:ClearFocus()
        end,
    }
    setmetatable(depositKeepAmountValueEB, { __index = HelpMePlay.Frame })
    depositKeepAmountValueEB = depositKeepAmountValueEB:EditBox()
    depositKeepAmountValueEB:SetText(C_CurrencyInfo.GetCoinTextureString(HelpMePlayDB["DepositKeepAmount"]))

    keepMeSafeCB = {
        name = addonName .. "KeepMeSafeCB",
        parent = depositKeepAmountValueEB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = -5,
        oY = -10,
        tooltipHeader = "Keep Me Safe",
        tooltipText = "Toggle to add a popup for approval before the addon is allowed to deposit into the guild bank.",
        onClick = function()
            HelpMePlayDB["DepositKeepMeSafe"] = keepMeSafeCB:GetChecked()
        end,
    }
    setmetatable(keepMeSafeCB, { __index = HelpMePlay.Button })
    keepMeSafeCB = keepMeSafeCB:CheckButton()
    keepMeSafeCB:SetChecked(HelpMePlayDB["DepositKeepMeSafe"])

    talentImporterButton = {
        name = addonName .. "TalentImporterButton",
        parent = Panel,
        anchor = "BOTTOMLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 10,
        oY = 40,
        width = 125,
        height = 25,
        text = "Talent Importer",
        tooltipHeader = "Talent Importer",
        tooltipText = "Click to open the Talent Importer utility.",
        onClick = nil,
    }
    setmetatable(talentImporterButton, { __index = HelpMePlay.Button })
    talentImporterButton = talentImporterButton:BaseButton()
    talentImporterButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            HideUIPanel(SettingsPanel)
            addon.OpenTalentImporter()
        end
    end)

    heirloomButton = {
        name = addonName .. "HeirloomButton",
        parent = talentImporterButton,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -10,
        width = 125,
        height = 25,
        text = "Heirlooms",
        tooltipHeader = "Heirlooms",
        tooltipText = "Click to open the Heirloom selection utility.",
        onClick = nil,
    }
    setmetatable(heirloomButton, { __index = HelpMePlay.Button })
    heirloomButton = heirloomButton:BaseButton()
    heirloomButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            HideUIPanel(SettingsPanel)
            addon.OpenHeirloomSelector()
        end
    end)

    --[[routeBuilderButton = {
        name = addonName .. "RouteBuilderButton",
        parent = heirloomButton,
        anchor = "LEFT",
        relativeAnchor = "RIGHT",
        oX = 10,
        oY = 0,
        width = 125,
        height = 25,
        text = "Route Builder",
        tooltipHeader = "Route Builder",
        tooltipText = "Click to open the Route Builder utility.",
        onClick = nil,
    }
    setmetatable(routeBuilderButton, { __index = HelpMePlay.Button })
    routeBuilderButton = routeBuilderButton:BaseButton()
    routeBuilderButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            --HideUIPanel(SettingsPanel)
            --addon.OpenTalentImporter()
        end
    end)
    routeBuilderButton:SetEnabled(false)]]

    openIssueButton = {
        name = addonName .. "OpenIssueButton",
        parent = Panel,
        anchor = "BOTTOMRIGHT",
        relativeAnchor = "BOTTOMRIGHT",
        oX = -10,
        oY = 10,
        width = 125,
        height = 25,
        text = "Open Issue",
        tooltipHeader = "Open Issue",
        tooltipText = "Click to get the Github issue page.",
        onClick = function()
            local popup = {
                name = "HELPMEPLAY_OPEN_ISSUE",
                text = "Hey! Thanks for being willing to open an issue. You rock! |T648207:16|t",
                button1Text = "Close",
                onShow = function(self)
                    local function HidePopup(self) self:GetParent():Hide() end
                    self.editBox:SetScript("OnKeyUp", function(self, key)
                        if IsControlKeyDown() and key == "C" then HidePopup(self) end
                    end)
                    self.editBox:SetText("https://github.com/Saaappi/HelpMePlay/issues/new")
                    self.editBox:HighlightText()
                end,
                showAlert = false,
                whileDead = false,
                hideOnEscape = true,
                hasEditBox = true,
                enterClicksFirstButton = true,
                preferredIndex = 3,
            }
            setmetatable(popup, { __index = HelpMePlay.Frame })
            popup = popup:Popup()
            StaticPopup_Show(popup.name)
        end,
    }
    setmetatable(openIssueButton, { __index = HelpMePlay.Button })
    openIssueButton = openIssueButton:BaseButton()
end)