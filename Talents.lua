local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local classTalents = {
	[1] = { -- Warrior
		[71] = { -- Arms
			[15] = 316733,	-- War Machine
			[25] = 103827,	-- Double Time
			[30] = 202316,	-- Fervor of Battle
			[35] = 202163,	-- Bounding Stride
			[40] = 845,		-- Cleave
			[45] = 248621,	-- In For The Kill
			[50] = 262150,	-- Dreadnaught
		},
		[72] = { -- Fury
			[15] = 215568,	-- Fresh Meat
			[25] = 103827,	-- Double Time
			[30] = 315720,	-- Onslaught
			[35] = 202163,	-- Bounding Stride
			[40] = 215571,	-- Frothing Berserker
			[45] = 118000,	-- Dragon Roar
			[50] = 152278,	-- Anger Management
		},
		[73] = { -- Protection
			[15] = 316733,	-- War Machine
			[25] = 103827,	-- Double Time
			[30] = 118000,	-- Dragon Roar
			[35] = 202163,	-- Bounding Stride
			[40] = 202095,	-- Indomitable
			[45] = 202603,	-- Into the Fray
			[50] = 152278,	-- Anger Management
		},
	},
	[2] = { -- Paladin
		[65] = { -- Holy
			[15] = 196926,	-- Crusader's Might
			[25] = 114165,	-- Holy Prism
			[30] = 234299,	-- Fist of Justice
			[35] = 230332,	-- Cavalier
			[40] = 105809,	-- Holy Avenger
			[45] = 53376,	-- Sanctified Wrath
			[50] = 325966,	-- Glimmer of Light
		},
		[66] = { -- Protection
			[15] = 204019,	-- Blessed Hammer
			[25] = 203776,	-- First Avenger
			[30] = 234299,	-- Fist of Justice
			[35] = 230332,	-- Cavalier
			[40] = 223817,	-- Divine Purpose
			[45] = 204054,	-- Consecrated Ground
			[50] = 171648,	-- Sanctified Wrath
		},
		[67] = { -- Retribution
			[15] = 343527,	-- Execution Sentence
			[25] = 231832,	-- Blade of Wrath
			[30] = 20066,	-- Repentance
			[35] = 230332,	-- Cavalier
			[40] = 223817,	-- Divine Purpose
			[45] = 326734,	-- Healing Hands
			[50] = 343721,	-- Final Reckoning
		},
	},
	[3] = { -- Hunter
		[253] = { -- Beast Mastery
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[254] = { -- Marksmanship
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[255] = { -- Survival
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
	},
	[4] = { -- Rogue
		[259] = { -- Assassination
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[260] = { -- Outlaw
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[261] = { -- Subtlety
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
	},
	[5] = { -- Priest
		[256] = { -- Discipline
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[257] = { -- Holy
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[258] = { -- Shadow
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
	},
	[6] = { -- Death Knight
		[250] = { -- Blood
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[251] = { -- Frost
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[252] = { -- Unholy
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
	},
	[7] = { -- Shaman
		[262] = { -- Elemental
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[263] = { -- Enhancement
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[264] = { -- Restoration
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
	},
	[8] = { -- Mage
		[62] = { -- Arcane
			[15] = 236628, 	-- Amplification
			[25] = 212653, 	-- Shimmer
			[30] = 1463,	-- Incanter's Flow
			[35] = 342231,	-- Arcane Echo
			[40] = 235711,	-- Chrono Shift
			[45] = 153626,	-- Arcane Orb
			[50] = 321387,	-- Enlightened
		},
		[63] = { -- Fire
			[15] = 269644,	-- Searing Touch
			[25] = 212653, 	-- Shimmer
			[30] = 1463,	-- Incanter's Flow
			[35] = 205029,	-- Flame On
			[40] = 236058,	-- Frenetic Speed
			[45] = 205023,	-- Conflagration
			[50] = 153561,	-- Meteor
		},
		[64] = { -- Frost
			[15] = 205027,	-- Bone Chilling
			[25] = 212653, 	-- Shimmer
			[30] = 1463,	-- Incanter's Flow
			[35] = 205030,	-- Frozen Touch
			[40] = 235224,	-- Frigid Winds
			[45] = 56377,	-- Splitting Ice
			[50] = 155149,	-- Thermal Void
		},
	},
	[9] = { -- Warlock
		[265] = { -- Affliction
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[266] = { -- Demonology
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[267] = { -- Destruction
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
	},
	[10] = { -- Monk
		[268] = { -- Brewmaster
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[269] = { -- Windwalker
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[270] = { -- Mistweaver
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
	},
	[11] = { -- Druid
		[102] = { -- Balance
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[103] = { -- Feral
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[104] = { -- Guardian
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
		[105] = { -- Restoration
			[15] = 0,
			[25] = 0,
			[30] = 0,
			[35] = 0,
			[40] = 0,
			[45] = 0,
			[50] = 0,
		},
	},
	[12] = { -- Demon Hunter
		[577] = { -- Havoc
			[15] = 206478,	-- Demonic Appetite
			[25] = 258876,	-- Insatiable Hunger
			[30] = 347461,	-- Unbound Chaos
			[35] = 204909,	-- Soul Rending
			[40] = 206416,	-- First Blood
			[45] = 203556,	-- Master of the Glaive
			[50] = 213410,	-- Demonic
		},
		[581] = { -- Vengeance
			[15] = 207550,	-- Abyssal Strike
			[25] = 227174,	-- Fallout
			[30] = 247454,	-- Spirit Bomb
			[35] = 263642,	-- Fracture
			[40] = 202138,	-- Sigil of Chains
			[45] = 321453,	-- Demonic
			[50] = 209258,	-- Last Resort
		},
	},
}

e:RegisterEvent("PLAYER_LEVEL_CHANGED")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_LEVEL_CHANGED" then
		if HelpMePlayOptionsDB.Talents == false then return end
		local _, newLevel = ...
		if newLevel % 5 == 0 then
			-- The player's level is evenly divisible
			-- by 5, so let's see if they have unspent
			-- talents.
			if GetNumUnspentTalents() > 0 then
				-- The player has an unspent talent,
				-- so let's get their class and spec.
				local _, _, classId = UnitClass("player")
				local specIndex = GetSpecialization()
				local specId = GetSpecializationInfo(specIndex)
				
				-- Congratulate the player for reaching a talent
				-- level, then print the suggested talent.
				print(L["Colored Addon Name"] .. ": " .. string.format(L["Level Congrats Text"], newLevel, GetSpellLink(classTalents[classId][specId][newLevel])))
			end
		end
	end
end)