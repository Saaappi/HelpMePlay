local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local newCharacterButton

local function IsNCCEnabled()
    local variables = {
        "NCC_ActionBar2",
        "NCC_ActionBar3",
        "NCC_ActionBar4",
        "NCC_ActionBar5",
        "NCC_ActionBar6",
        "NCC_ActionBar7",
        "NCC_ActionBar8",
        "ClearAllTracking",
        "AutoLoot",
        "DisableTutorials",
        "AutoPushSpells",
        "ClassColorFrames",
        "LootUnderMouse",
        "DisableDialog"
    }
    for _, variable in next, variables do
        if HelpMePlayDB[variable] then
            return true
        end
    end
    if HelpMePlayDB["NCC_EditModeLayoutID"] > 2 then
        return true
    end
    return false
end

addon.NewCharacter = function()
    if IsNCCEnabled() then
        newCharacterButton = addon.CreateWidget("BasicButton", {
            name = format("%sNewCharacterButton", addonName),
            parent = UIParent,
            width = 170,
            height = 25,
            text = "Configure New Character",
        })

        newCharacterButton:ClearAllPoints()
        newCharacterButton:SetPoint("CENTER", UIParent, "CENTER", 0, 150)

        newCharacterButton:SetScript("OnClick", function()
            -- Action Bars
            SetActionBarToggles(
                HelpMePlayDB["NCC_ActionBar2"],
                HelpMePlayDB["NCC_ActionBar3"],
                HelpMePlayDB["NCC_ActionBar4"],
                HelpMePlayDB["NCC_ActionBar5"],
                HelpMePlayDB["NCC_ActionBar6"],
                HelpMePlayDB["NCC_ActionBar7"],
                HelpMePlayDB["NCC_ActionBar8"]
            )

            -- Minimap Tracking
            if HelpMePlayDB["ClearAllTracking"] then
                C_Minimap.ClearAllTracking()
            end

            -- Auto Loot
            if HelpMePlayDB["AutoLoot"] then
                C_CVar.SetCVar("autoLootDefault", 1)
            else
                C_CVar.SetCVar("autoLootDefault", 0)
            end

            -- Disable Tutorials
            if HelpMePlayDB["DisableTutorials"] then
                C_CVar.SetCVar("showTutorials", 0)
            else
                C_CVar.SetCVar("showTutorials", 1)
            end

            -- Auto Push Spells
            if HelpMePlayDB["AutoPushSpells"] then
                C_CVar.SetCVar("AutoPushSpellToActionBar", 1)
            else
                C_CVar.SetCVar("AutoPushSpellToActionBar", 0)
            end

            -- Class Color Frames
            if HelpMePlayDB["ClassColorFrames"] then
                C_CVar.SetCVar("pvpFramesDisplayClassColor", 1)
                C_CVar.SetCVar("raidFramesDisplayClassColor", 1)
            else
                C_CVar.SetCVar("pvpFramesDisplayClassColor", 0)
                C_CVar.SetCVar("raidFramesDisplayClassColor", 0)
            end

            -- Loot Window Under Mouse
            if HelpMePlayDB["LootUnderMouse"] then
                C_CVar.SetCVar("lootUnderMouse", 1)
            else
                C_CVar.SetCVar("lootUnderMouse", 0)
            end

            -- Disable Dialog
            if HelpMePlayDB["DisableDialog"] then
                C_CVar.SetCVar("Sound_EnableDialog", 0)
            else
                C_CVar.SetCVar("Sound_EnableDialog", 1)
            end

            -- Create Whisper Window
            if HelpMePlayDB["CreateWhisperWindow"] then
                -- The new Whispers window.
                local window = FCF_OpenNewWindow("Whispers")
                ChatFrame_RemoveAllMessageGroups(window)
                ChatFrame_RemoveAllChannels(window)
                ChatFrame_AddMessageGroup(window, "BN_WHISPER")
                ChatFrame_AddMessageGroup(window, "WHISPER")

                -- The General window.
                ChatFrame_RemoveMessageGroup(ChatFrame1, "BN_WHISPER")
                ChatFrame_RemoveMessageGroup(ChatFrame1, "WHISPER")
            end

            -- Create Loot Window
            if HelpMePlayDB["CreateLootWindow"] then
                -- The new Loot window.
                local window = FCF_OpenNewWindow("Loot")
                ChatFrame_RemoveAllMessageGroups(window)
                ChatFrame_RemoveAllChannels(window)
                ChatFrame_AddMessageGroup(window, "CURRENCY")
                ChatFrame_AddMessageGroup(window, "LOOT")
                ChatFrame_AddMessageGroup(window, "MONEY")

                -- The General window.
                ChatFrame_RemoveMessageGroup(ChatFrame1, "CURRENCY")
                ChatFrame_RemoveMessageGroup(ChatFrame1, "LOOT")
                ChatFrame_RemoveMessageGroup(ChatFrame1, "MONEY")
            end

            -- Set the player's Edit Mode layout.
            C_EditMode.SetActiveLayout(HelpMePlayDB["NCC_EditModeLayoutID"])

            -- Set the button as used and hide it.
            table.insert(HelpMePlayDB["Characters"], addon.playerGUID)
            newCharacterButton:Hide()

            -- Use a popup the player can use to reload the UI and save
            -- these changes.
            StaticPopupDialogs["HMP_NEW_CHARACTER_CONFIG_RELOAD_UI"] = {
                text = "New character configuration completed. Would you like to reload now?",
                button1 = YES,
                button2 = NO,
                explicitAcknowledge = true,
                OnAccept = function()
                    C_UI.Reload()
                end,
                OnCancel = function()
                end,
                preferredIndex = 3
            }
            StaticPopup_Show("HMP_NEW_CHARACTER_CONFIG_RELOAD_UI")
        end)
        newCharacterButton:SetScript("OnEnter", function(self)
            addon.Tooltip_OnEnter(self, "Configure New Character", format("Click to configure new character settings for %s. These settings can be configured under %s in the settings.", LHMP:ColorText(select(2, UnitClass("player")), UnitName("player")), LHMP:ColorText("GOLD", "New Character Configuration")))
        end)
        newCharacterButton:SetScript("OnLeave", addon.Tooltip_OnLeave)
    end
end

eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_LOGIN" then
        C_Timer.After(1, function()
            -- Unregister the event for performance.
	        eventHandler:UnregisterEvent("PLAYER_LOGIN")

            C_Timer.After(1, function()
                if LHMP:IsNewCharacter(addon.playerLevel, addon.playerClassID, addon.playerGUID, HelpMePlayDB["Characters"]) then
                    addon.NewCharacter()
                end
            end)

            -- If the player is on Exile's Reach, then we need to use
            -- a workaround to keep the tutorials and auto push spells
            -- CVars in check if/when the UI is reloaded.
            if C_Map.GetBestMapForUnit("player") == 1409 or C_Map.GetBestMapForUnit("player") == 1726 or C_Map.GetBestMapForUnit("player") == 1727 then
                if HelpMePlayDB["DisableTutorials"] then
                    C_CVar.SetCVar("showTutorials", 0)
                else
                    C_CVar.SetCVar("showTutorials", 1)
                end
                if HelpMePlayDB["AutoPushSpells"] then
                    C_CVar.SetCVar("AutoPushSpellToActionBar", 1)
                else
                    C_CVar.SetCVar("AutoPushSpellToActionBar", 0)
                end
            end
        end)
	end
end)