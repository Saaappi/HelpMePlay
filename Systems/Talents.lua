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
		[70] = { -- Retribution
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
			[15] = 273887,	-- Killer Instinct
			[25] = 193532,	-- Scent of Blood
			[30] = 199921,	-- Trailblazer
			[35] = 131894,	-- A Murder of Crows
			[40] = 109215,	-- Posthaste
			[45] = 199530,	-- Stomp
			[50] = 191384,	-- Aspect of the Beast
		},
		[254] = { -- Marksmanship
			[15] = 260309,	-- Master Marksman
			[25] = 120360,	-- Barrage
			[30] = 199921,	-- Trailblazer
			[35] = 342049,	-- Chimaera Shot
			[40] = 109215,	-- Posthaste
			[45] = 260402,	-- Double Tap
			[50] = 260243,	-- Volley
		},
		[255] = { -- Survival
			[15] = 265895,	-- Terms of Engagement
			[25] = 264332,	-- Guerrilla Tactics
			[30] = 199921,	-- Trailblazer
			[35] = 260248,	-- Bloodseeker
			[40] = 109215,	-- Posthaste
			[45] = 269751,	-- Flanking Strike
			[50] = 271014,	-- Wildfire Infusion
		},
	},
	[4] = { -- Rogue
		[259] = { -- Assassination
			[15] = 196864,	-- Master Poisoner
			[25] = 108208,	-- Subterfuge
			[30] = 137619,	-- Marked for Death
			[35] = 280716,	-- Leeching Poison
			[40] = 154904,	-- Internal Bleeding
			[45] = 193539,	-- Alacrity
			[50] = 255544,	-- Poison Bomb
		},
		[260] = { -- Outlaw
			[15] = 196938,	-- Quick Draw
			[25] = 196922,	-- Hit and Run
			[30] = 137619,	-- Marked for Death
			[35] = 193546,	-- Iron Stomach
			[40] = 131511,	-- Prey on the Weak
			[45] = 193539,	-- Alacrity
			[50] = 271877,	-- Blade Rush
		},
		[261] = { -- Subtlety
			[15] = 193537,	-- Weaponmaster
			[25] = 108208,	-- Subterfuge
			[30] = 137619,	-- Marked for Death
			[35] = 200759,	-- Soothing Darkness
			[40] = 277953,	-- Night Terrors
			[45] = 238104,	-- Enveloping Shadows
			[50] = 280719,	-- Secret Technique
		},
	},
	[5] = { -- Priest
		[256] = { -- Discipline
			[15] = 214621,	-- Schism
			[25] = 121536,	-- Angelic Feather
			[30] = 129250,	-- Power Word: Solace
			[35] = 204263,	-- Shining Force
			[40] = 280391,	-- Sins of the Many
			[45] = 204197,	-- Purge the Wicked
			[50] = 238063,	-- Lenience
		},
		[257] = { -- Holy
			[15] = 200128,	-- Trail of Light
			[25] = 121536,	-- Angelic Feather
			[30] = 200209,	-- Guardian Angel
			[35] = 200199,	-- Censure
			[40] = 109186,	-- Surge of Light
			[45] = 110744,	-- Divine Star
			[50] = 200183,	-- Apotheosis
		},
		[258] = { -- Shadow
			[15] = 321291,	-- Death and Madness
			[25] = 64129,	-- Body and Soul
			[30] = 341385,	-- Searing Nightmare
			[35] = 64044,	-- Psychic Horror
			[40] = 205385,	-- Shadow Crash
			[45] = 263165,	-- Void Torrent
			[50] = 341240,	-- Ancient Madness
		},
	},
	[6] = { -- Death Knight
		[250] = { -- Blood
			[15] = 221536,	-- Heartbreaker
			[25] = 273946,	-- Hemostasis
			[30] = 317610,	-- Relish in Blood
			[35] = 206967,	-- Will of the Necropolis
			[40] = 212552,	-- Wraith Walk
			[45] = 195679,	-- Bloodworms
			[50] = 114556,	-- Purgatory
		},
		[251] = { -- Frost
			[15] = 281208,	-- Cold Heart
			[25] = 207104,	-- Runic Attenuation
			[30] = 108194,	-- Asphyxiate
			[35] = 207142,	-- Avalanche
			[40] = 212552,	-- Wraith Walk
			[45] = 194912,	-- Gathering Storm
			[50] = 281238,	-- Obliteration
		},
		[252] = { -- Unholy
			[15] = 194916,	-- All Will Serve
			[25] = 115989,	-- Unholy Blight
			[30] = 108194,	-- Asphyxiate
			[35] = 343294,	-- Soul Reaper
			[40] = 212552,	-- Wraith Walk
			[45] = 319230,	-- Unholy Pact
			[50] = 207289,	-- Unholy Assault
		},
	},
	[7] = { -- Shaman
		[262] = { -- Elemental
			[15] = 170374,	-- Earthen Rage
			[25] = 273221,	-- Aftershock
			[30] = 974,		-- Earth Shield
			[35] = 16166,	-- Master of the Elements
			[40] = 30884,	-- Nature's Guardian
			[45] = 117013,	-- Primal Elementalist
			[50] = 191634,	-- Stormkeeper
		},
		[263] = { -- Enhancement
			[15] = 334046,	-- Lashing Flames
			[25] = 344357,	-- Stormflurry
			[30] = 260878,	-- Spirit Wolf
			[35] = 334195,	-- Hailstorm
			[40] = 30884,	-- Nature's Guardian
			[45] = 197214,	-- Sundering
			[50] = 114051,	-- Ascendance
		},
		[264] = { -- Restoration
			[15] = 200072,	-- Torrent
			[25] = 108283,	-- Echo of the Elements
			[30] = 260878,	-- Spirit Wolf
			[35] = 198838,	-- Earthen Wall Totem
			[40] = 30884,	-- Nature's Guardian
			[45] = 280614,	-- Flash Flood
			[50] = 114052,	-- Ascendance
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
			[15] = 108558,	-- Nightfall
			[25] = 196103,	-- Absolute Corruption
			[30] = 111400,	-- Burning Rush
			[35] = 205179,	-- Phantom Singularity
			[40] = 6789,	-- Mortal Coil
			[45] = 48181,	-- Haunt
			[50] = 215941,	-- Soul Conduit
		},
		[266] = { -- Demonology
			[15] = 267211,	-- Bilescourge Bombers
			[25] = 205145,	-- Demonic Calling
			[30] = 111400,	-- Burning Rush
			[35] = 264057,	-- Soul Strike
			[40] = 6789,	-- Mortal Coil
			[45] = 267216,	-- Inner Demons
			[50] = 267215,	-- Demonic Consumption
		},
		[267] = { -- Destruction
			[15] = 6353,	-- Soul Fire
			[25] = 17877,	-- Shadowburn
			[30] = 111400,	-- Burning Rush
			[35] = 196408,	-- Fire and Brimstone
			[40] = 6789,	-- Mortal Coil
			[45] = 266086,	-- Rain of Chaos
			[50] = 196447,	-- Channel Demonfire
		},
	},
	[10] = { -- Monk
		[268] = { -- Brewmaster
			[15] = 123986,	-- Chi Burst
			[25] = 115008,	-- Chi Torpedo
			[30] = 115399,	-- Black Ox Brew
			[35] = 115315,	-- Summon Black Ox Statue
			[40] = 122281,	-- Healing Elixir
			[45] = 116847,	-- Rushing Jade Wind
			[50] = 196737,	-- High Tolerance
		},
		[269] = { -- Windwalker
			[15] = 123986,	-- Chi Burst
			[25] = 115173,  -- Celerity
			[30] = 261947,  -- Fist of the White Tiger
			[35] = 280195,  -- Good Karma
			[40] = 261767,  -- Inner Strength
			[45] = 196740,  -- Hit Combo
			[50] = 152175,  -- Whirling Dragon Punch
		},
		[270] = { -- Mistweaver
			[15] = 123986,	-- Chi Burst
			[25] = 115008,	-- Chi Torpedo
			[30] = 210802,	-- Spirit of the Crane
			[35] = 116844,	-- Ring of Peace
			[40] = 122278,	-- Dampen Harm
			[45] = 325197,	-- Invoke Chi-Ji, the Red Crane
			[50] = 197895,	-- Focused Thunder
		},
	},
	[11] = { -- Druid
		[102] = { -- Balance
			[15] = 202430,	-- Nature's Balance
			[25] = 102401,	-- Wild Charge
			[30] = 197492,	-- Restoration Affinity
			[35] = 5211,	-- Mighty Bash
			[40] = 114107,	-- Soul of the Forest
			[45] = 202354,	-- Stellar Drift
			[50] = 343647,	-- Solstice
		},
		[103] = { -- Feral
			[15] = 202021,	-- Predator
			[25] = 252216,	-- Tiger Dash
			[30] = 197492,	-- Restoration Affinity
			[35] = 5211,	-- Mighty Bash
			[40] = 158476,	-- Soul of the Forest
			[45] = 285381,	-- Primal Wrath
			[50] = 274837,	-- Feral Frenzy
		},
		[104] = { -- Guardian
			[15] = 203953,	-- Brambles
			[25] = 102401,	-- Wild Charge
			[30] = 197492,	-- Restoration Affinity
			[35] = 319454,	-- Heart of the Wild
			[40] = 203964,	-- Galactic Guardian
			[45] = 203965,	-- Survival of the Fittest
			[50] = 135288,	-- Tooth and Claw
		},
		[105] = { -- Restoration
			[15] = 102351,	-- Cenarion Ward
			[25] = 102401,	-- Wild Charge
			[30] = 197490,	-- Feral Affinity
			[35] = 319454,	-- Heart of the Wild
			[40] = 158478,	-- Soul of the Forest
			[45] = 203651,	-- Overgrowth
			[50] = 274902,	-- Photosynthesis
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
			[50] = 320341,	-- Bulk Extraction
		},
	},
}

e:RegisterEvent("PLAYER_LEVEL_CHANGED")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_LEVEL_CHANGED" then
		if HelpMePlayOptionsDB.Talents == false or HelpMePlayOptionsDB.Talents == nil then return end
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