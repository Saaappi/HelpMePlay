local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")

-- Initiates a deposit action to the guild bank if the player's current money exceeds a certain threshold,
-- or withdraws from the guild bank if the player's money is below the threshold.
local function ManageGuildBankFunds(transactionType, amount)
    C_Timer.After(addon.Constants["TIMER_DELAY"] + 0.4, function()
        if transactionType == "DEPOSIT" then
            DepositGuildBankMoney(amount)
            HelpMePlay.Print(format("Deposited %s.", C_CurrencyInfo.GetCoinTextureString(amount)))
        else
            WithdrawGuildBankMoney(amount)
            HelpMePlay.Print(format("Withdrew %s.", C_CurrencyInfo.GetCoinTextureString(amount)))
        end
    end)
end

eventHandler:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
        if HelpMePlayDB["DepositKeepAmount"] > 0 then
            local type = ...
            if type == 10 then
                local transactionAmount = GetMoney() - (HelpMePlayDB["DepositKeepAmount"])
                if HelpMePlayDB["DepositKeepMeSafe"] then
                    if transactionAmount > 0 then
                        StaticPopupDialogs["HELPMEPLAY_DEPOSIT_KEEP_ME_SAFE"] = {
                            text = format("You're about to deposit %s to %s. Do you want to continue?", C_CurrencyInfo.GetCoinTextureString(transactionAmount), LHMP:ColorText("ARTIFACT", (GetGuildInfo("player")))),
                            button1 = ACCEPT,
                            button2 = CANCEL,
                            OnAccept = function()
                                ManageGuildBankFunds("DEPOSIT", transactionAmount)
                            end,
                            timeout = 0,
                            showAlert = false,
                            whileDead = false,
                            hideOnEscape = true,
                            hasEditBox = false,
                            enterClicksFirstButton = false,
                            preferredIndex = 3,
                        }
                        StaticPopup_Show("HELPMEPLAY_DEPOSIT_KEEP_ME_SAFE")
                    else
                        transactionAmount = transactionAmount * -1
                        if transactionAmount > 0 then
                            StaticPopupDialogs["HELPMEPLAY_DEPOSIT_KEEP_ME_SAFE"] = {
                                text = format("You're about to withdraw %s from %s. Do you want to continue?", C_CurrencyInfo.GetCoinTextureString(transactionAmount), LHMP:ColorText("ARTIFACT", (GetGuildInfo("player")))),
                                button1 = ACCEPT,
                                button2 = CANCEL,
                                OnAccept = function()
                                    ManageGuildBankFunds("WITHDRAW", transactionAmount)
                                end,
                                timeout = 0,
                                showAlert = false,
                                whileDead = false,
                                hideOnEscape = true,
                                hasEditBox = false,
                                enterClicksFirstButton = false,
                                preferredIndex = 3,
                            }
                            StaticPopup_Show("HELPMEPLAY_DEPOSIT_KEEP_ME_SAFE")
                        end
                    end
                else
                    if transactionAmount > 0 then
                        ManageGuildBankFunds("DEPOSIT", transactionAmount)
                    else
                        transactionAmount = transactionAmount * -1
                        ManageGuildBankFunds("WITHDRAW", transactionAmount)
                    end
                end
            end
        end
    end
end)