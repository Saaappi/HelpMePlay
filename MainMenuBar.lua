local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")

local atlas = "Quest-Campaign-Available"
local nextUpdate = {
    year = 2024,
    month = 8,
    monthDay = 27,
    weekday = 3,
    hour = 13,
    minute = 0
}

local isElvUILoaded = false

local function OnEvent(_, event, ...)
    if event == "PLAYER_LOGIN" then
        eventHandler:UnregisterEvent("PLAYER_LOGIN")
        local button = CreateFrame("Button", format("%sMicroButton", addonName), UIParent)
        button:RegisterForClicks("LeftButtonUp", "RightButtonUp")

        button:SetWidth(18)
        button:SetHeight(25)

        button:ClearAllPoints()
        button:SetPoint("BOTTOMRIGHT", CharacterMicroButton, "BOTTOMLEFT", 0, 0)

        button.icon = button:CreateTexture(format("%sIcon", button:GetName()), "OVERLAY")
        button.icon:SetAtlas(atlas)
        button:SetNormalTexture(button.icon)
        button:SetHighlightAtlas(atlas, "ADD")
        button:SetPushedAtlas("Quest-Campaign-Available-Trivial")

        -- Handle ElvUI mouseover setting for the Micro Bar.
        if C_AddOns.IsAddOnLoaded("ElvUI") and ElvDB.profiles.Default.actionbar.microbar.enabled and ElvDB.profiles.Default.actionbar.microbar.mouseover then
            isElvUILoaded = true
            button:SetAlpha(0)
        end

        button:SetScript("OnClick", function()
            if IsShiftKeyDown() then
                HelpMePlay.OpenTalentImporter()
            elseif IsControlKeyDown() then
                HelpMePlay.ResetCharacterConfiguration()
            else
                if SettingsPanel:IsVisible() then
                    HideUIPanel(SettingsPanel)
                    PlaySound(SOUNDKIT.IG_MAINMENU_OPEN)
                else
                    Settings.OpenToCategory(HelpMePlay.SettingsCategoryID)
                end
            end
        end)
        button:SetScript("OnEnter", function(self)
            if isElvUILoaded then
                self:SetAlpha(1)
            end
            local currentDate = C_DateAndTime.GetCurrentCalendarTime()
            if C_DateAndTime.CompareCalendarTime(currentDate, nextUpdate) == -1 then -- Addon is outdated
                HelpMePlay.Tooltip_OnEnter(self, format("|cffFFFFFF%s|r (v%s)", addonName, C_AddOns.GetAddOnMetadata(addonName, "Version")), LHMP:ColorText("RED", HelpMePlay.ErrorMessages["ADDON_VERSION_OUTDATED"]))
            else
                HelpMePlay.Tooltip_OnEnter(self, format("|cffFFFFFF%s|r (v%s)", addonName, C_AddOns.GetAddOnMetadata(addonName, "Version")), HelpMePlay.Tooltips.MicroMenuButton)
            end
        end)
        button:SetScript("OnLeave", function(self)
            if isElvUILoaded then
                self:SetAlpha(0)
            end
            HelpMePlay.Tooltip_OnLeave()
        end)
    end
end
eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:SetScript("OnEvent", OnEvent)
