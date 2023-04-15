local addonName, addonTable = ...
local e = CreateFrame("Frame")
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
				for rank = (talentInfo.talentRank + 1), talentInfo.talentMaxRank do
					C_Garrison.ResearchTalent(talent.perkID, rank)
				end
			else
				print(addonTable.COLORED_ADDON_NAME .. ": " .. "You need more currency! Amount Needed: " .. talentInfo["researchCurrencyCosts"][1].currencyQuantity-currency.quantity .. " |T" .. currency.iconFileID .. ":0|t " .. currency.name)
				return
			end
		end
	end
end

local function GetTalentTreeInfo(talentTreeID)
	if talentTreeID == 271 then -- Titanic Research Archive
		if HelpMePlayDB.TitanResearchEnabled then
			HMPTalentSystemButton:SetSize(50, 20)
			HMPTalentSystemButton:SetText("Learn")
			
			HMPTalentSystemButton:HookScript("OnClick", function(self)
			StaticPopupDialogs["HELPMEPLAY_TALENTSYSTEM"] = {
				text = "Are you sure you want HelpMePlay to learn your talents for this system?\n\n" ..
				"All options can eventually be learned with enough currency.\n\n" ..
				"Select YES if you don't want to think about the order, or CANCEL if you want to control the purchase order.",
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
				GameTooltip:SetText("Automatically learns all possible talents in the given system.\n\n" ..
				"|cffADD8E6Added by HelpMePlay|r")
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
			HMPTalentSystemButton:SetText("Learn")
			
			HMPTalentSystemButton:HookScript("OnClick", function(self)
			StaticPopupDialogs["HELPMEPLAY_TALENTSYSTEM"] = {
				text = "Are you sure you want HelpMePlay to learn your talents for this system?\n\n" ..
				"All options can eventually be learned with enough currency.\n\n" ..
				"Select YES if you don't want to think about the order, or CANCEL if you want to control the purchase order.",
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
				GameTooltip:SetText("Automatically learns all possible talents in the given system.\n\n" ..
				"|cffADD8E6Added by HelpMePlay|r")
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