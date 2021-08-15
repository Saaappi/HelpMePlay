local addonName, addonTable = ...
local e = CreateFrame("Frame")

e:RegisterEvent("GOSSIP_CONFIRM")
e:RegisterEvent("GOSSIP_CONFIRM_CANCEL")
e:RegisterEvent("GOSSIP_SHOW")
e:RegisterEvent("MODIFIER_STATE_CHANGED")

local creatures = {
	[1] = { -- NPCs without Cost
		["gossips"] = {
			"Are you enjoying yourself?", -- Quest: Mix, Mingle, and Meddle
			"Begin pet battle.",
			"Let's do battle!",
			"I am ready to go.",
			"I am ready.",
			"I'm ready",
			"There is no time left. Run!",
			"I will assist you.",
			"Can you return me to the present time?",
			"Let us begin.",
			"Yes, I will help.",
			"I would like to challenge both of you to a spar.",
			"Will you spar with me?",
			"Now tell me, did you see who killed the Furlbrows?",
			"Is there any way I can help?",
			"O.K.",
			"Is there anything you need?",
			"Very well. Let us fight.",
			"Au'narim claims you owe her anima.",
			"Maldraxxus needs your service. Will you fight?",
			"The Lady of the Falls wanted to make sure you were safe.",
			"<Ask about suspicious activity>",
			"<Request tithe>",
			"<Present Lajos's invitation>",
			"We are ready",
			"Take us back to Zuldazar.",
			"Go hunt somewhere else!",
			"Let's duel.",
			"I have heard this story before.",
			"I've heard this tale before.",
			"<Show him the Word of Zul.>",
			"<Show her the Word of Zul.>",
			"Reshape me.",
		}
	},
	[2] = { -- NPCs with Cost
		["gossips"] = {
			"I'd like to heal and revive my battle pets.",
		},
		["cost"] = 10000
	},
	-- Kalimdor: Orgrimmar
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
		local index = 1
		local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
		if unitGUID then
			local _, _, _, _, _, npcID = strsplit("-", unitGUID); npcID = tonumber(npcID)
			local gossipOptions = C_GossipInfo.GetOptions()
			for index, gossipOptionsSubTable in ipairs(gossipOptions) do
				for id, _ in pairs(creatures) do
					if id == npcID then -- The target's ID is in the table, so use its configuration.
						for i = 1, #creatures[id]["gossips"] do
							if string.find(string.lower(gossipOptionsSubTable["name"]), string.lower(creatures[id]["gossips"][i])) then
								C_GossipInfo.SelectOption(index)
							end
						end
					else
						for i = 1, 2 do
							for j = 1, #creatures[i]["gossips"] do
								if string.find(string.lower(gossipOptionsSubTable["name"]), string.lower(creatures[i]["gossips"][j])) then
									C_GossipInfo.SelectOption(index)
								end
							end
						end
					end
				end
			end
		end
	end
end)