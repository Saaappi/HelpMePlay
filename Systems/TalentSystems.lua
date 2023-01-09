local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local talentSystemButton = _G.CreateFrame(
	"Button",
	"HMPTalentSystemButton",
	nil,
	"UIPanelButtonTemplate"
)

local function CheckTalents(talentTree, currencyID)
	local currency = 0
	local talentInfo = ""
	for _, talent in ipairs(talentTree) do
		talentInfo = C_Garrison.GetTalentInfo(talent.perkID)
		if talentInfo.researched == false and talentInfo.isBeingResearched == false then
			currency = C_CurrencyInfo.GetCurrencyInfo(currencyID)
			if currency.quantity >= talentInfo["researchCurrencyCosts"][1].currencyQuantity then
				if talentInfo.prerequisiteTalentID ~= nil then
					local prerequisiteTalentID = C_Garrison.GetTalentInfo(talentInfo.prerequisiteTalentID)
					if prerequisiteTalentID.researched == true then
						if talent.print == "spell" and talentInfo.perkSpellID ~= 0 then
							--addonTable.Print(L_GLOBALSTRINGS["Text.Output.PurchaseTalentText"] .. "|T" .. talentInfo.icon .. ":0|t " .. GetSpellLink(talentInfo.perkSpellID))
							hooksecurefunc(OrderHallTalentFrame, "OnShow", function(self)
								print("A")
							end)
							OrderHallTalentFrame:HookScript
						else
							addonTable.Print(L_GLOBALSTRINGS["Text.Output.PurchaseTalentText"] .. "|T" .. talentInfo.icon .. ":0|t |cffEFC503" .. talentInfo.name .. "|r")
						end
					end
				else
					if talentInfo.talentAvailability == 0 then
						if talent.print == "spell" and talentInfo.perkSpellID ~= 0 then
							addonTable.Print(L_GLOBALSTRINGS["Text.Output.PurchaseTalentText"] .. "|T" .. talentInfo.icon .. ":0|t " .. GetSpellLink(talentInfo.perkSpellID))
						else
							addonTable.Print(L_GLOBALSTRINGS["Text.Output.PurchaseTalentText"] .. "|T" .. talentInfo.icon .. ":0|t |cffEFC503" .. talentInfo.name .. "|r")
						end
					else
						addonTable.Print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Text.Output.PrerequisiteTalentBeingResearched"])
					end
				end
				
				return
			else
				addonTable.Print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Text.Output.NotEnoughCurrency"] .. ": " .. talentInfo["researchCurrencyCosts"][1].currencyQuantity-currency.quantity .. " |T" .. currency.iconFileID .. ":0|t " .. currency.name)
				return
			end
		end
	end
end

local function GetTalentTreeInfo(talentTreeID)
	if talentTreeID == 271 then -- Titanic Research Archive
		if HelpMePlayDB.TitanResearchEnabled then
			HMPTalentSystemButton:SetSize(50, 20)
			HMPTalentSystemButton:SetText(L_GLOBALSTRINGS["UI.Button.Learn"])
			
			HMPTalentSystemButton:HookScript("OnClick", function(self)
			StaticPopupDialogs["HELPMEPLAY_TALENTSYSTEM"] = {
				text = L_GLOBALSTRINGS["UI.Button.TalentSystem.Popup.Desc"],
				button1 = YES,
				button2 = CANCEL,
				OnAccept = function(self, data)
					CheckTalents(addonTable.TITANICRESEARCH, 1719)
				end,
				timeout = 30,
				showAlert = true,
				whileDead = false,
				hideOnEscape = true,
				enterClicksFirstButton = false,
				preferredIndex = 3,
				}
				StaticPopup_Show("HELPMEPLAY_TALENTSYSTEM")
			end)

			HMPTalentSystemButton:HookScript("OnEnter", function(self)
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:SetText(L_GLOBALSTRINGS["UI.Button.TalentSystem.Desc"])
				GameTooltip:Show()
			end)

			HMPTalentSystemButton:HookScript("OnLeave", function(self)
				if GameTooltip:GetOwner() == self then
					GameTooltip:Hide()
				end
			end)
			
			HMPTalentSystemButton:SetPoint("LEFT", OrderHallTalentFrame.Currency.Icon, "RIGHT", 20, 0)
			HMPTalentSystemButton:Show()
		else
			return
		end
	elseif talentTreeID == 461 then -- The Box of Many Things
		if HelpMePlayDB.BoxOfManyThingsEnabled then
			HMPTalentSystemButton:SetSize(50, 20)
			HMPTalentSystemButton:SetText(L_GLOBALSTRINGS["UI.Button.Learn"])
			
			HMPTalentSystemButton:HookScript("OnClick", function(self)
			StaticPopupDialogs["HELPMEPLAY_TALENTSYSTEM"] = {
				text = L_GLOBALSTRINGS["UI.Button.TalentSystem.Popup.Desc"],
				button1 = YES,
				button2 = CANCEL,
				OnAccept = function(self, data)
					CheckTalents(addonTable.BOXOFMANYTHINGS, 1904)
				end,
				timeout = 30,
				showAlert = true,
				whileDead = false,
				hideOnEscape = true,
				enterClicksFirstButton = false,
				preferredIndex = 3,
				}
				StaticPopup_Show("HELPMEPLAY_TALENTSYSTEM")
			end)

			HMPTalentSystemButton:HookScript("OnEnter", function(self)
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip:SetText(L_GLOBALSTRINGS["UI.Button.TalentSystem.Desc"])
				GameTooltip:Show()
			end)

			HMPTalentSystemButton:HookScript("OnLeave", function(self)
				if GameTooltip:GetOwner() == self then
					GameTooltip:Hide()
				end
			end)
			
			HMPTalentSystemButton:SetPoint("LEFT", OrderHallTalentFrame.Currency.Icon, "RIGHT", 20, 0)
			HMPTalentSystemButton:Show()
		else
			return
		end
	end
end

e:RegisterEvent("GARRISON_TALENT_NPC_CLOSED")
e:RegisterEvent("GARRISON_TALENT_NPC_OPENED")
e:RegisterEvent("GARRISON_TALENT_RESEARCH_STARTED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GARRISON_TALENT_NPC_OPENED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		local _, talentTreeID = ...
		GetTalentTreeInfo(talentTreeID)
	end
	
	if event == "GARRISON_TALENT_RESEARCH_STARTED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		local _, talentTreeID = ...
		GetTalentTreeInfo(talentTreeID)
	end
	
	if event == "GARRISON_TALENT_NPC_CLOSED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HMPTalentSystemButton:IsVisible() then
			HMPTalentSystemButton:Hide()
		end
	end
end)