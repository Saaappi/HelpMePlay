local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local newCharacterButton

local function IsNewCharacter()
    if addon.playerLevel <= 10 then
        for _, GUID in next, HelpMePlayDB["Characters"] do
            if GUID == addon.playerGUID then
                return false
            end
        end
        return true
    end
end

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
    if UnitLevel("player") <= 10 and IsNCCEnabled() then
        newCharacterButton = {
            name = addonName .. "NewCharacterButton",
            parent = UIParent,
            anchor = "CENTER",
            relativeAnchor = "CENTER",
            oX = 0,
            oY = 150,
            width = 170,
            height = 25,
            text = "Configure New Character",
            tooltipHeader = "Configure New Character",
            tooltipText = format("Click to configure new character settings for %s. These settings can be configured under %s in the settings.", UnitName("player"), LHMP:ColorText("GOLD", "New Character Configuration")),
            onClick = function()
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

                if HelpMePlayDB["DisableDialog"] then
                    C_CVar.SetCVar("Sound_EnableDialog", 0)
                else
                    C_CVar.SetCVar("Sound_EnableDialog", 1)
                end

                -- Set the player's Edit Mode layout.
                C_EditMode.SetActiveLayout(HelpMePlayDB["NCC_EditModeLayoutID"])

                -- Set the button as used and hide it.
                table.insert(HelpMePlayDB["Characters"], addon.playerGUID)
                newCharacterButton:Hide()

                -- Use a popup the player can use to reload the UI and save
                -- these changes.
                local popup = {
                    name = "HELPMEPLAY_NCC_RELOAD_UI",
                    text = "New character configuration completed. Would you like to reload now?",
                    button1 = ACCEPT,
                    button2 = CANCEL,
                    onAccept = function(self, data)
                        C_UI.Reload()
                    end,
                    showAlert = false,
                    whileDead = false,
                    hideOnEscape = true,
                    enterClicksFirstButton = false,
                    preferredIndex = 3,
                }
                setmetatable(popup, { __index = HelpMePlay.Frame })
                popup = popup:Popup()
                StaticPopup_Show(popup.name)
            end,
        }
        setmetatable(newCharacterButton, { __index = HelpMePlay.Button })
        newCharacterButton = newCharacterButton:BaseButton()
    end
end

eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_LOGIN" then
        C_Timer.After(1, function()
            if IsNewCharacter() then
                addon.NewCharacter()
            end
        end)
	end

    -- If the player is on Exile's Reach, then we need to use
    -- a workaround to keep the tutorials and auto push spells
    -- CVars in check if/when the UI is reloaded.
    if C_Map.GetBestMapForUnit("player") == 1409 then
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

    -- Unregister the event for performance.
	eventHandler:UnregisterEvent("PLAYER_LOGIN")
end)