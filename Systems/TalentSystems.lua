local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function CheckTalents(talentTree, currencyId)
	local currency = 0
	local talentInfo = ""
	for k, v in ipairs(talentTree) do
		talentInfo = C_Garrison.GetTalentInfo(v.perkId)
		if talentInfo.researched == false and talentInfo.isBeingResearched == false then
			if v.f then
				if v.f == UnitFactionGroup("player") or v.f == "" then
					-- The player doesn't have the talent
					-- researched, so let's move forward.
					currency = C_CurrencyInfo.GetCurrencyInfo(currencyId)
					-- The player has enough currency to
					-- research the talent.
					if currency.quantity >= talentInfo["researchCurrencyCosts"][1].currencyQuantity then
						-- Let's check to see if the talent
						-- has a prerequisite talent. If so,
						-- let's also check if that prerequisite
						-- has been researched.
						if talentInfo.prerequisiteTalentID ~= nil then
							local prerequisiteTalentId = C_Garrison.GetTalentInfo(talentInfo.prerequisiteTalentID)
							-- The player has researched the prerequisite
							-- talent, so let's move forward.
							if prerequisiteTalentId.researched == true then
								-- The perk has a spell ID, so let's
								-- send a spell link to the chat frame.
								-- If not, then use the perk name.
								if v.print == "spell" and talentInfo.perkSpellID ~= 0 then
									addonTable.Print(L_GLOBALSTRINGS["Talent Purchase Text"] .. "|T" .. talentInfo.icon .. ":0|t " .. GetSpellLink(talentInfo.perkSpellID))
								else
									addonTable.Print(L_GLOBALSTRINGS["Talent Purchase Text"] .. "|T" .. talentInfo.icon .. ":0|t |cffEFC503" .. talentInfo.name .. "|r")
								end
							else
								-- Let's do some quick math to determine
								-- the hours, minutes, and seconds left
								-- on the research without requiring the
								-- player to hover over the talent.
								local hours, minutes, seconds
								hours, minutes = string.split(".", tostring(prerequisiteTalentId.timeRemaining / 3600))
								minutes, seconds = string.split(".", tonumber(("0."..minutes) * 60))
								seconds = string.split(".", tonumber(("0."..seconds) * 60))
								addonTable.Print(L_GLOBALSTRINGS["Prequisite Talent Being Researched"] .. " |T" .. prerequisiteTalentId.icon .. ":0|t |cffEFC503" .. prerequisiteTalentId.name .. "|r: " .. hours .. ":" .. minutes .. ":" .. seconds)
							end
						else
							if talentInfo.talentAvailability == 0 then
								-- The talent doesn't have a prerequisite.
								--
								-- The perk has a spell ID, so let's
								-- send a spell link to the chat frame.
								-- If not, then use the perk name.
								if v.print == "spell" and talentInfo.perkSpellID ~= 0 then
									addonTable.Print(L_GLOBALSTRINGS["Talent Purchase Text"] .. "|T" .. talentInfo.icon .. ":0|t " .. GetSpellLink(talentInfo.perkSpellID))
								else
									addonTable.Print(L_GLOBALSTRINGS["Talent Purchase Text"] .. "|T" .. talentInfo.icon .. ":0|t |cffEFC503" .. talentInfo.name .. "|r")
								end
							else
								addonTable.Print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Prequisite Talent Being Researched"])
							end
						end
						
						return
					else
						-- Print to the chat frame how much
						-- currency the player
						-- will need for the next talent,
						-- then break from the loop.
						addonTable.Print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Talent Not Enough Currency Text"] .. ": " .. talentInfo["researchCurrencyCosts"][1].currencyQuantity-currency.quantity .. " |T" .. currency.iconFileID .. ":0|t " .. currency.name)
						return
					end
				end
			end
		end
	end
end

local function GetTalentTreeInfo(talentTreeId)
	if talentTreeId == 153 then
		-- War Resources (Mission Table)
		CheckTalents(addonTable.WARRESOURCES, 1560)
	elseif talentTreeId == 271 then
		-- Titan Research Archive
		CheckTalents(addonTable.TITANICRESEARCH, 1719)
	elseif talentTreeId == 461 then
		-- The Box of Many Things
		CheckTalents(addonTable.BOXOFMANYTHINGS, 1904)
	elseif talentTreeId == 474 then
		-- Cypher Research Console
		CheckTalents(addonTable.CYPHERSOFTHEFIRSTONES, 1979)
	end
end

e:RegisterEvent("GARRISON_TALENT_NPC_OPENED")
e:RegisterEvent("GARRISON_TALENT_RESEARCH_STARTED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GARRISON_TALENT_NPC_OPENED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayOptionsDB.Talents == false or HelpMePlayOptionsDB.Talents == nil then return end
		local _, talentTreeId = ...
		GetTalentTreeInfo(talentTreeId)
	end
	
	if event == "GARRISON_TALENT_RESEARCH_STARTED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayOptionsDB.Talents == false or HelpMePlayOptionsDB.Talents == nil then return end
		local _, talentTreeId = ...
		GetTalentTreeInfo(talentTreeId)
	end
end)