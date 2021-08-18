local addonName, addonTable = ...
local e = CreateFrame("Frame")

e:RegisterEvent("GOSSIP_CONFIRM")
e:RegisterEvent("GOSSIP_CONFIRM_CANCEL")
e:RegisterEvent("GOSSIP_SHOW")
e:RegisterEvent("MODIFIER_STATE_CHANGED")

local creatures = {
	[1] = { -- Gossip options used on two or more NPCs.
		["gossips"] = {
			"Are you enjoying yourself?", -- Added from Quest: Mix, Mingle, and Meddle
			"Go hunt somewhere else!", -- Added from Quest: Amateur Hour (Highmountain)
			"There is no time left. Run!", -- Added from Quest: Evacuate Snowmane (Highmountain)
			"Begin pet battle.",
			"Let's do battle!",
		}
	},
	[2] = { -- NPCs with Cost
		["gossips"] = {
			"I'd like to heal and revive my battle pets.",
		},
		["cost"] = 10000
	},
	-- Kalimdor: Durotar
	[39380] = { -- Shin Stonepillar
		["gossips"] = {
			"Can you tell me your fable, Shin?",
		},
	},
	-- Kalimdor: Orgrimmar
	[167032] = { -- Chromie
		["gossips"] = {
			"Select a timeline."
		}
	},
	[171791] = { -- Nazgrim
		["gossips"] = {
			"Tell me what happened."
		}
	},
	-- Broken Isles: Highmountain
	[98825] = { -- Spiritwalker Ebonhorn
		["gossips"] = {
			"Tell me the Story of Huln.",
		},
	},
	[99745] = { -- Snazzle Shinyfinder
		["gossips"] = {
			"Go find shiny!",
		},
	},
	[99746] = { -- Trytooth Hardchisel
		["gossips"] = {
			"You kill basilisk!",
		},
	},
	[99747] = { -- Kindle Candlecrafter
		["gossips"] = {
			"Make big candle! Lots of wax!",
		},
	},
	[99748] = { -- Dug Digger
		["gossips"] = {
			"Dig rocks, find pretties!",
		},
	},
	[99781] = { -- Snazzle Shinyfinder
		["gossips"] = {
			"You keep one. I keep rest.",
		},
	},
	[99782] = { -- Trytooth Hardchisel
		["gossips"] = {
			"Best kill job me seen!",
			"Give Trytooth the boot.",
		},
	},
	[99784] = { -- Kindle Candlecrafter
		["gossips"] = {
			"Me think me have just the right touch...",
		},
	},
	[95403] = { -- Windmaster Julan
		["gossips"] = {
			"Take the Windmaster's Totem.",
		},
	},
	[96286] = { -- Navarrogg
		["gossips"] = {
			"Let's get out of here!",
		},
	},
	[98773] = { -- Lasan Skyhorn
		["gossips"] = {
			"Yes!",
		},
	},
	[98825] = { -- Spiritwalker Ebonhorn
		["gossips"] = {
			"Tell me more of Huln Highmountain."
		},
	},
	[94434] = { -- Addie Fizzlebog
		["gossips"] = {
			"Let's go hunting!",
		},
	},
	-- Shadowlands: The Maw
	[165918] = { -- Highlord Darion Mograine
		["gossips"] = {
			"Make it talk.",
		},
	},
	[166980] = { -- Lady Jaina Proudmoore
		["gossips"] = {
			"Tell me about this place.",
			"Tell me more of the Jailer.",
			"What about the others who were taken?",
			"<Lie low and observe.>",
		}
	},
}

e:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_SHOW" then
		if IsModifierKeyDown() then return end
		local numActiveQuests = C_GossipInfo.GetNumActiveQuests()
		if numActiveQuests > 0 then
			local activeQuests = C_GossipInfo.GetActiveQuests()
			for i = 1, numActiveQuests do
				if activeQuests[i].isComplete then
					C_Timer.After(0, function()
						C_Timer.After(0.1, function()
							-- Do nothing here, we just want a slight delay to let active quests be handled first.
						end)
					end)
				end
			end
			C_Timer.After(0, function()
				C_Timer.After(0.5, function()
					
				end)
			end)
		end
		local index = 1
		local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
		if unitGUID then
			local _, _, _, _, _, npcID = strsplit("-", unitGUID); npcID = tonumber(npcID)
			local gossipOptions = C_GossipInfo.GetOptions()
			for index, gossipOptionsSubTable in ipairs(gossipOptions) do
				for i = 1, 2 do
					for j = 1, #creatures[i]["gossips"] do
						if string.find(string.lower(gossipOptionsSubTable["name"]), string.lower(creatures[i]["gossips"][j])) then
							C_GossipInfo.SelectOption(index)
						end
					end
				end
				for id, _ in pairs(creatures) do
					if id == npcID then -- The target's ID is in the table, so use its configuration.
						for i = 1, #creatures[id]["gossips"] do
							if string.find(string.lower(gossipOptionsSubTable["name"]), string.lower(creatures[id]["gossips"][i])) then
								C_GossipInfo.SelectOption(index)
							end
						end
					end
				end
			end
		end
	end
end)