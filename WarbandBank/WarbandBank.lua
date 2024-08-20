local _, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local isTransactionInProgress = false

local function ManageGuildBankFunds(transactionType, transactionAmount)
    C_Timer.After(HelpMePlay.Constants["TIMER_DELAY"] + 0.4, function()
        if transactionType == "DEPOSIT" then
            C_Bank.DepositMoney(2, transactionAmount)
            HelpMePlay.Print(string.format("Deposited %s.", C_CurrencyInfo.GetCoinTextureString(transactionAmount)))
        else
            C_Bank.WithdrawMoney(2, transactionAmount)
            HelpMePlay.Print(string.format("Withdrew %s.", C_CurrencyInfo.GetCoinTextureString(transactionAmount)))
        end
        isTransactionInProgress = false
    end)
end

local function ShowConfirmDialog(transactionAmount, transactionType)
    StaticPopupDialogs["HELPMEPLAY_DEPOSIT_KEEP_ME_SAFE"] = {
        text = string.format("You're about to %s %s to/from your Warband bank. Do you wish to continue?", string.lower(transactionType), C_CurrencyInfo.GetCoinTextureString(transactionAmount)),
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

local function OnEvent(_, event, ...)
    if event == "BANKFRAME_OPENED" or (event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" and ... == 8) then
        if HelpMePlayDB["DepositKeepAmount"] > 0 then
            if C_Bank.CanDepositMoney(2) and (not isTransactionInProgress) then
                local transactionAmount = GetMoney() - (HelpMePlayDB["DepositKeepAmount"] * 10000)
                if transactionAmount == 0 then return end

                isTransactionInProgress = true

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

eventHandler:RegisterEvent("BANKFRAME_OPENED")
eventHandler:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
eventHandler:SetScript("OnEvent", OnEvent)