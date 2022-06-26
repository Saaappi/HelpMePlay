local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function PrintLine(text)
	if HelpMePlayOptionsDB.Logging then
		print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. text)
	end
end

local function CheckTalents(talentTree, currencyId)
	local currency = 0
	local talentInfo = ""
	for k, v in ipairs(talentTree) do
		talentInfo = C_Garrison.GetTalentInfo(v.perkId)
		if talentInfo.researched == false and talentInfo.isBeingResearched == false then
			-- The player doesn't have the talent
			-- researched, so let's move forward.
			currency = C_CurrencyInfo.GetCurrencyInfo(currencyId).quantity
			-- The player has enough currency to
			-- research the talent.
			if currency >= talentInfo["researchCurrencyCosts"][1].currencyQuantity then
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
							PrintLine(L_GLOBALSTRINGS["Talent Purchase Text"] .. "|T" .. talentInfo.icon .. ":0|t " .. GetSpellLink(talentInfo.perkSpellID))
						else
							PrintLine(L_GLOBALSTRINGS["Talent Purchase Text"] .. "|T" .. talentInfo.icon .. ":0|t |cffEFC503" .. talentInfo.name .. "|r")
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
						PrintLine(L_GLOBALSTRINGS["Prequisite Talent Being Researched"] .. " |T" .. prerequisiteTalentId.icon .. ":0|t |cffEFC503" .. prerequisiteTalentId.name .. "|r: " .. hours .. ":" .. minutes .. ":" .. seconds)
					end
				else
					-- The talent doesn't have a prerequisite.
					--
					-- The perk has a spell ID, so let's
					-- send a spell link to the chat frame.
					-- If not, then use the perk name.
					if v.print == "spell" and talentInfo.perkSpellID ~= 0 then
						PrintLine(L_GLOBALSTRINGS["Talent Purchase Text"] .. "|T" .. talentInfo.icon .. ":0|t " .. GetSpellLink(talentInfo.perkSpellID))
					else
						PrintLine(L_GLOBALSTRINGS["Talent Purchase Text"] .. "|T" .. talentInfo.icon .. ":0|t |cffEFC503" .. talentInfo.name .. "|r")
					end
				end
				
				return
			else
				-- Print to the chat frame how much
				-- currency the player
				-- will need for the next talent,
				-- then break from the loop.
				PrintLine(L_GLOBALSTRINGS["Talent Not Enough Currency Text"] .. talentInfo["researchCurrencyCosts"][1].currencyQuantity-currency .. " " .. "(|T" .. talentInfo.icon .. ":0|t " .. talentInfo.name .. ")")
				return
			end
		end
	end
end

local function GetTalentTreeInfo(talentTreeId)
	if talentTreeId == 271 then
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
		if HelpMePlayOptionsDB.Talents == false or HelpMePlayOptionsDB.Talents == nil then return end
		local _, talentTreeId = ...
		GetTalentTreeInfo(talentTreeId)
	end
	
	if event == "GARRISON_TALENT_RESEARCH_STARTED" then
		if HelpMePlayOptionsDB.Talents == false or HelpMePlayOptionsDB.Talents == nil then return end
		local _, talentTreeId = ...
		GetTalentTreeInfo(talentTreeId)
	end
end)