local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")

local atlas = "Quest-Campaign-Available"

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

        button:SetScript("OnClick", function()
            if SettingsPanel:IsVisible() then
                HideUIPanel(SettingsPanel)
                PlaySound(SOUNDKIT.IG_MAINMENU_OPEN)
            else
                Settings.OpenToCategory(HelpMePlay.SettingsCategoryID)
            end
        end)
        button:SetScript("OnEnter", function(self)
            HelpMePlay.Tooltip_OnEnter(self, format("|cffFFFFFF%s|r (v%s)", addonName, C_AddOns.GetAddOnMetadata(addonName, "Version")), "")
        end)
        button:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
    end
end
eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:SetScript("OnEvent", OnEvent)
