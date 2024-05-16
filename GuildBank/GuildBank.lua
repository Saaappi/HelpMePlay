local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

-- Initiates a deposit action to the guild bank if the player's current money exceeds a certain threshold,
-- or withdraws from the guild bank if the player's money is below the threshold.
local function ManageGuildBankFunds()
    C_Timer.After(addon.Constants["TIMER_DELAY"] + 0.4, function()
        local currentMoney = GetMoney()

        -- Determine if the player's money is above or below the threshold.
        -- If above, then deposit. If below, then withdraw.
        if currentMoney > HelpMePlayDB["DepositKeepAmount"] then
            local deposit = currentMoney - HelpMePlayDB["DepositKeepAmount"]
            DepositGuildBankMoney(deposit)
            HelpMePlay.Print("Deposited " .. C_CurrencyInfo.GetCoinTextureString(deposit))
        else
            local guildBankMoney = GetGuildBankMoney()
            if guildBankMoney > HelpMePlayDB["DepositKeepAmount"] then
                local withdrawAmount = HelpMePlayDB["DepositKeepAmount"] - currentMoney
                WithdrawGuildBankMoney(withdrawAmount)
            end
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
                    local popup
                    local transactionAmount = GetMoney() - HelpMePlayDB["DepositKeepAmount"]
                    if transactionAmount > 0 then
                        popup = {
                            name = "HELPMEPLAY_DEPOSIT_KEEP_ME_SAFE",
                            text = format("You're about to deposit %s to |cffFFD100%s|r. Do you want to continue?", C_CurrencyInfo.GetCoinTextureString(transactionAmount), (GetGuildInfo("player"))),
                            button1 = ACCEPT,
                            button2 = CANCEL,
                            onAccept = function()
                                ManageGuildBankFunds()
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
                    else
                        transactionAmount = transactionAmount * -1
                        if transactionAmount < 0 then
                            popup = {
                                name = "HELPMEPLAY_WITHDRAW_KEEP_ME_SAFE",
                                text = format("You're about to withdraw %s from |cffFFD100%s|r. Do you want to continue?", C_CurrencyInfo.GetCoinTextureString(transactionAmount), (GetGuildInfo("player"))),
                                button1 = ACCEPT,
                                button2 = CANCEL,
                                onAccept = function()
                                    ManageGuildBankFunds()
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
                    end
                else
                    ManageGuildBankFunds()
                end
            end
        end
    end
end)