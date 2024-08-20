--[[local addonName, HelpMePlay = ...
local LHMP = LibStub("LibHelpMePlay")
local button

CurrencyTransferMenu:HookScript("OnShow", function(self)
    -- Create the button. We unregister the event at the end, so no need
    -- to do a nil check first.
    if not button then
        button = CreateFrame("Button", addonName .. "TransferCurrencyButton", UIParent, "ActionButtonTemplate")
        button:RegisterForClicks("LeftButtonUp")

        local currencyID = self:GetCurrencyID()

        button:SetScript("OnClick", function()
            if currencyID then
                if C_CurrencyInfo.CanTransferCurrency(currencyID) then
                    local characters = C_CurrencyInfo.FetchCurrencyDataFromAccountCharacters(currencyID)
                    if characters then
                        --for _, character in next, characters do
                        self.AmountSelector.InputBox:SetText(characters[1].quantity)
                        self.AmountSelector.InputBox:ValidateAndSetValue()
                        --print(self.AmountSelector.InputBox:GetNumber())
                        --self.AmountSelector.InputBox:SetNumber(CurrencyTransferAmountInputBoxMixin:GetClampedInputAmount(characters[1].quantity))
                        --self.AmountSelector.InputBox:GetCurrencyTransferMenu():TriggerEvent(CurrencyTransferMenuMixin.Event.CurrencyTransferAmountUpdated, self.AmountSelector.InputBox:GetNumber())
                        --break
                        --end
                    end
                end
            end
        end)
        button:SetScript("OnEnter", function(self)
            if currencyID then
                local name = C_CurrencyInfo.GetCurrencyInfo(currencyID).name
                HelpMePlay.Tooltip_OnEnter(self, "Transfer Currency", string.format("Click to transfer all %s to the current character.", LHMP:ColorText("UNCOMMON", name)))
            else
                HelpMePlay.Tooltip_OnEnter(self, "Transfer Currency", "Click to transfer all of the active currency to the current character.")
            end
        end)
        button:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)

        button:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 5, -10)
    end

    button.icon:SetTexture(self.currencyInfo and self.currencyInfo.icon or 237281)
end)]]