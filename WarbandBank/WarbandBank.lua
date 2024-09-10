local _, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local isTransactionInProgress = false

local function ManageGuildBankFunds(transactionType, transactionAmount)
    C_Timer.After(0.5, function()
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

local function OnEvent(_, event, ...)
    if event == "BANKFRAME_OPENED" or (event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" and ... == 8) then
        if HelpMePlayDB["AutoWarbankTransactions"] then
            if C_Bank.CanDepositMoney(2) and (not isTransactionInProgress) then
                local transactionAmount = GetMoney() - (HelpMePlayDB["DepositKeepAmount"] * 10000)
                if transactionAmount == 0 then return false end

                isTransactionInProgress = true

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

eventHandler:RegisterEvent("BANKFRAME_OPENED")
eventHandler:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
eventHandler:SetScript("OnEvent", OnEvent)