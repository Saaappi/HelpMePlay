local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

local function Deposit()
    C_Timer.After(addon.Constants["TIMER_DELAY"] + 0.4, function()
        local money = GetMoney()
        if money > HelpMePlayDB["DepositKeepAmount"] then
            local deposit = money - HelpMePlayDB["DepositKeepAmount"]
            DepositGuildBankMoney(deposit)
            HelpMePlay.Print("Deposited " .. C_CurrencyInfo.GetCoinTextureString(deposit))
        end
    end)
end

eventHandler:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
        if HelpMePlayDB["DepositKeepAmount"] > 0 then
            local type = ...
            if type == 10 then
                if HelpMePlayDB["DepositKeepMeSafe"] then
                    local deposit = GetMoney() - HelpMePlayDB["DepositKeepAmount"]
                    if deposit > 0 then
                        local popup = {
                            name = "HELPMEPLAY_DEPOSIT_KEEP_ME_SAFE",
                            text = format("You're about to deposit %s to |cffFFD100%s|r. Do you want to continue?", C_CurrencyInfo.GetCoinTextureString(deposit), (GetGuildInfo("player"))),
                            button1 = ACCEPT,
                            button2 = CANCEL,
                            onAccept = function()
                                Deposit()
                            end,
                            showAlert = false,
                            whileDead = false,
                            hideOnEscape = true,
                            hasEditBox = false,
                            enterClicksFirstButton = false,
                            preferredIndex = 3,
                        }
                        setmetatable(popup, { __index = HelpMePlay.Frame })
                        popup = popup:Popup()
                        StaticPopup_Show(popup.name)
                    end
                else
                    Deposit()
                end
            end
        end
    end
end)