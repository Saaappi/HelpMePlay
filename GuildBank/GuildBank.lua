local _, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")

local function ManageGuildBankFunds(transactionType, transactionAmount)
    C_Timer.After(HelpMePlay.Constants["TIMER_DELAY"] + 0.4, function()
        if transactionType == "DEPOSIT" then
            C_Bank.DepositMoney(2, transactionAmount)
            HelpMePlay.Print(format("Deposited %s.", C_CurrencyInfo.GetCoinTextureString(transactionAmount)))
        else
            C_Bank.WithdrawMoney(2, transactionAmount)
            HelpMePlay.Print(format("Withdrew %s.", C_CurrencyInfo.GetCoinTextureString(transactionAmount)))
        end
    end)
end

local function ShowConfirmDialog(transactionAmount, transactionType)
    StaticPopupDialogs["HELPMEPLAY_DEPOSIT_KEEP_ME_SAFE"] = {
        text = format("You're about to %s %s to your Warband bank. Do you wish to continue?", string.lower(transactionType), C_CurrencyInfo.GetCoinTextureString(transactionAmount)),
        button1 = YES,
        button2 = NO,
        OnAccept = function()
            ManageGuildBankFunds(transactionType, transactionAmount)
        end,
        OnCancel = function() end,
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

local function HandleTransaction(transactionAmount)
    if transactionAmount > 0 then
        ShowConfirmDialog(transactionAmount, "DEPOSIT")
    else
        transactionAmount = -transactionAmount
        ShowConfirmDialog(transactionAmount, "WITHDRAW")
    end
end

eventHandler:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
        if HelpMePlayDB["DepositKeepAmount"] > 0 then
            local type = ...
            if type == 8 then
                if C_Bank.CanDepositMoney(2) then
                    local transactionAmount = GetMoney() - (HelpMePlayDB["DepositKeepAmount"])
                    if transactionAmount == 0 then return end

                    if HelpMePlayDB["DepositKeepMeSafe"] then
                        HandleTransaction(transactionAmount)
                    else
                        if transactionAmount > 0 then
                            ManageGuildBankFunds("DEPOSIT", transactionAmount)
                        else
                            transactionAmount = -transactionAmount
                            ManageGuildBankFunds("WITHDRAW", transactionAmount)
                        end
                    end
                end
            end
        end
    end
end)