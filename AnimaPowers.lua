local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local animaPowers = {
	[1] = { -- Warrior
		[71] = { -- Arms
			-- S Tier Powers
			[322039] = 1, -- Scratched Knife
			[322051] = 1, -- Warlord's Resolve
			[329207] = 1, -- Unbound Fortitude
			[329213] = 1, -- Voracious Culling Blade
			[333598] = 1, -- Pridebreaker's Anvil
			[322047] = 1, -- Brawler's Brass Knuckles
			[322032] = 1, -- Smoldering Inertia
			-- A Tier Powers
			[322043] = 2, -- Resonant Throatbands
			[322029] = 2, -- Fan of Longswords
			[322036] = 2, -- Bloodstained Whetstone
			[322027] = 2, -- Zovaal's Warbanner
			[314295] = 2, -- Spearheads of Eternity (Kyrian)
			[322031] = 2, -- Spattered Soles
			-- B Tier Powers
			[313853] = 3, -- Battlord's Cypher
			[313859] = 3, -- Battlelord's Ultimatum
			[333585] = 3, -- Writhing Noose (Venthyr)
			[322025] = 3, -- Edge of Hatred
			[322024] = 3, -- Shadehound Tooth
			[333937] = 3, -- Livingwood Pommel (Night Fae)
			[350007] = 3, -- Gargolmar's Shattered Hand
			-- C Tier Powers
			[350060] = 4, -- Ancient Rubble
			[322026] = 4, -- Bladed Bulwark
			[322023] = 4, -- Champion's Decree
			[329335] = 4, -- Gibbering Skull
			[329452] = 4, -- Ogundimu's Fist (Kyrian)
			[322049] = 4, -- Periapt of Furor
			[322035] = 4, -- Pleonexian Command
			[322046] = 4, -- Ragemote
			[329275] = 4, -- Shrieking Flagon
			[329489] = 4, -- Singing Stones
			[329146] = 4, -- Soulwrought Studs
			[322038] = 4, -- Succulent Carpaccio
			[322093] = 4, -- Thundering Roar
			[329283] = 4, -- Umbral Ear Trumpet
			[313856] = 4, -- Battlord's Invocation
			[313857] = 4, -- Battlord's Legacy
			[313853] = 4, -- Battlord's Cypher
			[313858] = 4, -- Battlord's Mythos
			[314293] = 4, -- Ancient Prolegomenon (Kyrian)
			[314291] = 4, -- Elysian Shoulderwrap (Kyrian)
			[314290] = 3, -- Kyrian Warhelm (Kyrian)
			[314292] = 4, -- Stonepiercer Signet
			[333620] = 4, -- Distillation of Sin (Venthyr)
			[333891] = 4, -- Hateful Fetish
			[333858] = 4, -- Repulsive Pennant (Necrolord)
			[333786] = 4, -- Sinew-Sewn Tassels
			[333927] = 4, -- Overgrowth Catalyst (Night Fae)
			[333949] = 4, -- Petrified Wildseed (Night Fae)
			[349916] = 4, -- Weathered Runestone
		},
		[72] = { -- Fury
			-- S Tier Powers
			[322039] = 1, -- Scratched Knife
			[322051] = 1, -- Warlord's Resolve
			[329207] = 1, -- Unbound Fortitude
			[329213] = 1, -- Voracious Culling Blade
			[322047] = 1, -- Brawler's Brass Knuckles
			[322032] = 1, -- Smoldering Inertia
			-- A Tier Powers
			[322043] = 2, -- Resonant Throatbands
			[322029] = 2, -- Fan of Longswords
			[322036] = 2, -- Bloodstained Whetstone
			[322025] = 2, -- Edge of Hatred
			[314295] = 2, -- Spearheads of Eternity (Kyrian)
			[322031] = 2, -- Spattered Soles
			-- B Tier Powers
			[313855] = 3, -- Battlelord's Lesson
			[313859] = 3, -- Battlelord's Ultimatum
			[322027] = 3, -- Zovaal's Warbanner
			[350007] = 3, -- Gargolmar's Shattered Hand
			[333585] = 3, -- Writhing Noose (Venthyr)
			[333937] = 3, -- Livingwood Pommel (Night Fae)
			-- C Tier Powers
			[322026] = 4, -- Bladed Bulwark
			[322023] = 4, -- Champion's Decree
			[322024] = 4, -- Shadehound Tooth
			[329335] = 4, -- Gibbering Skull
			[329452] = 4, -- Ogundimu's Fist (Kyrian)
			[322049] = 4, -- Periapt of Furor
			[322035] = 4, -- Pleonexian Command
			[322046] = 4, -- Ragemote
			[322043] = 4, -- Resonant Throatbands
			[329275] = 4, -- Shrieking Flagon
			[329489] = 4, -- Singing Stones
			[329146] = 4, -- Soulwrought Studs
			[322038] = 4, -- Succulent Carpaccio
			[322093] = 4, -- Thundering Roar
			[329283] = 4, -- Umbral Ear Trumpet
			[313856] = 4, -- Battlord's Invocation
			[313857] = 4, -- Battlord's Legacy
			[313853] = 4, -- Battlord's Cypher
			[313858] = 4, -- Battlord's Mythos
			[314293] = 4, -- Ancient Prolegomenon (Kyrian)
			[314291] = 4, -- Elysian Shoulderwrap (Kyrian)
			[314290] = 3, -- Kyrian Warhelm (Kyrian)
			[314292] = 4, -- Stonepiercer Signet
			[333620] = 4, -- Distillation of Sin (Venthyr)
			[333598] = 4, -- Pridebreaker's Anvil
			[333891] = 4, -- Hateful Fetish
			[333858] = 4, -- Repulsive Pennant (Necrolord)
			[333786] = 4, -- Sinew-Sewn Tassels
			[333927] = 4, -- Overgrowth Catalyst (Night Fae)
			[333949] = 4, -- Petrified Wildseed (Night Fae)
			[349916] = 4, -- Weathered Runestone
		},
		[73] = { -- Protection
			-- S Tier Powers
			[322032] = 1, -- Smoldering Inertia
			[322039] = 1, -- Scratched Knife
			[329213] = 1, -- Voracious Culling Blade
			[329275] = 1, -- Shrieking Flagon
			[314295] = 1, -- Spearheads of Eternity (Kyrian)
			[333927] = 1, -- Overgrowth Catalyst (Night Fae)
			[333598] = 1, -- Pridebreaker's Anvil
			-- A Tier Powers
			[322024] = 2, -- Shadehound Tooth
			[322025] = 2, -- Edge of Hatred
			[333937] = 2, -- Livingwood Pommel (Night Fae)
			[314291] = 2, -- Elysian Shoulderwrap (Kyrian)
			[322047] = 2, -- Brawler's Brass Knuckles
			[322027] = 2, -- Zovaal's Warbanner
			[322043] = 2, -- Resonant Throatbands
			[322051] = 2, -- Warlord's Resolve
			[322035] = 2, -- Pleonexian Command
			[314292] = 2, -- Stonepiercer Signet
			[322031] = 2, -- Spattered Soles
			-- B Tier Powers
			[333949] = 3, -- Petrified Wildseed (Night Fae)
			[322036] = 3, -- Bloodstained Whetstone
			[333585] = 3, -- Writhing Noose (Venthyr)
			[314293] = 3, -- Ancient Prolegomenon (Kyrian)
			[322029] = 3, -- Fan of Longswords
			[314290] = 3, -- Kyrian Warhelm (Kyrian)
			[329345] = 3, -- Signet of Tormented Kings
			[329146] = 3, -- Soulwrought Studs
			-- C Tier Powers
			[333858] = 4, -- Repulsive Pennant (Necrolord)
			[333620] = 4, -- Distillation of Sin (Venthyr)
			[333891] = 4, -- Hateful Fetish
			[333786] = 4, -- Sinew-Sewn Tassels
			[329283] = 4, -- Umbral Ear Trumpet
			-- D Tier Powers
			[322030] = 5, -- Hurricane Heart
			[322046] = 5, -- Ragemote
			[322023] = 5, -- Champion's Decree
		},
	},
	[2] = { -- Paladin
		[65] = { -- Holy
			-- S Tier Powers
			[314262] = 1, -- Belt of the Mawsworn Avenger (Kyrian)
			[314260] = 1, -- Ember of the Carillon (Kyrian)
			[314264] = 1, -- Big Clapper (Kyrian)
			[336489] = 1, -- Hallowed Candle (Venthyr)
			[336485] = 1, -- Undead Bone Ash (Venthyr)
			[336549] = 1, -- Hallowed Silverglass (Venthyr)
			[336615] = 1, -- Darkened Ember (Necrolord)
			[336612] = 1, -- Worn Leather Strap (Necrolord)
			[336625] = 1, -- Tome of the Vanquished (Necrolord)
			[336493] = 1, -- Pristine Fallen Leaf (Night Fae)
			[336492] = 1, -- Dried Fire Flower (Night Fae)
			[336643] = 1, -- Calibrated Sextant (Night Fae)
			-- A Tier Powers
			[332540] = 2, -- Ancient Writ of Order
			[332806] = 2, -- Badge of the Mad Paragon
			[332799] = 2, -- Blood Beacon 
			[335054] = 2, -- Faintly Glowing Ember
			[332803] = 2, -- Gavel of True Judgment
			[335441] = 2, -- Golden Plume
			[332800] = 2, -- Pendrake's Visor
			[332545] = 2, -- Ring of Unburdening
			[332398] = 2, -- Shattered Gauntlet
			[335095] = 2, -- Shard of Milkglass
			[335088] = 2, -- Small Smooth Spike
			[332534] = 2, -- Soulforged Censer
			[305004] = 2, -- Words of Incomprehensible Glory
			[313839] = 2, -- Highlord's Cypher
			[313845] = 2, -- Highlord's Ultimatum
			-- B Tier Powers
			[332807] = 3, -- Coldheart Plume
			[332939] = 3, -- Mark of Conk-quest
			[333121] = 3, -- Of Dusk and Dawn
			[332842] = 3, -- Soulsteel Hasp
			[335424] = 3, -- Soul-Touched Spurs
			[332539] = 3, -- Soul-Touched Reins
			[332592] = 3, -- Theory of Justice
			[332401] = 3, -- Vestige of Hope
			[332409] = 3, -- Winged Medallion
			[313841] = 3, -- Highlord's Lesson
			-- C Tier Powers
			[332407] = 3, -- Defiled Prayer Beads (better for Night Fae)
			[334730] = 3, -- Pendrake's Locket (better in a group)
			[332808] = 3, -- Pendrake's Shattered Aegis (better in a group)
			[332947] = 3, -- Pendrake's Brooch (better in a group)
			[332541] = 3, -- Radiant Essence
			[334992] = 3, -- Thread of Beads
			[313840] = 3, -- Highlord's Gift
			[313843] = 3, -- Highlord's Legacy
			[313844] = 3, -- Highlord's Mythos
		},
		[66] = { -- Protection
		
		},
		[67] = { -- Retribution
		
		},
	},
	[3] = { -- Hunter
		[253] = { -- Beast Mastery
			-- S Tier Powers
			[331367] = 1, -- Sigil of Skoldus
			[331197] = 1, -- Soulforge Embers
			[335541] = 1, -- Sling of the Unseen
			[319280] = 1, -- Elethium Beacon
			[331370] = 1, -- Soulsteel Pinion
			[305052] = 1, -- Lens of Elchaver
			-- A Tier Powers
			[331369] = 2, -- Acrobat's Razor
			[331455] = 2, -- Amplifying Mirror
			[331187] = 2, -- Cadaverous Cleats
			[331300] = 2, -- Chelonian Crest
			[331192] = 2, -- Necrotic Venom
			[314243] = 2, -- Deadsoul Aspect (Kyrian)
			[314247] = 2, -- Pact of the Soulstalkers (Kyrian, Group)
			[314245] = 2, -- Super Soul Scope (Kyrian)
			[314242] = 2, -- Deathwire (Kyrian)
			[335566] = 2, -- Bag of Munitions (Necrolord)
			[342818] = 2, -- Mask of Withering (Venthyr)
			[342779] = 2, -- Crystallized Dreams (Night Fae)
			[308194] = 2, -- Finger of Frozen Fury
			[319287] = 2, -- Elethium Lantern
			[319041] = 2, -- Elethium Weights
			[285479] = 2, -- Flame Jet
			-- B Tier Powers
			[331179] = 3, -- Acrobat's Rations
			[331338] = 3, -- Petrified Pet Food
			[331355] = 3, -- Craven Strategem
			[331365] = 3, -- Deadeye Satchel
			[331283] = 3, -- Peltsman's Grit
			[331183] = 3, -- Piercing Scope
			[313882] = 3, -- Huntmaster's Gift
			[313886] = 3, -- Huntmaster's Mythos
			[313887] = 3, -- Huntmaster's Ultimatum
			[335611] = 3, -- Capsule of Pure Moonlight (Night Fae)
			[335608] = 3, -- Majestic Antler Fragment (Night Fae)
			[325867] = 3, -- Parliament Stone (Kyrian)
			[342799] = 3, -- Gnarled Key (Venthyr)
			[342789] = 3, -- Smuggled Wildseed (Night Fae)
			[337613] = 3, -- Erratic Howler
			[319288] = 3, -- Elethium Censer
			[319056] = 3, -- Elethium Veil
			-- C Tier Powers
			[331186] = 4, -- Beaststalker's Signet
			[331476] = 4, -- Bag of Mawrat Eyes
			[331287] = 4, -- Bursting Tar
			[331190] = 4, -- Euphoria Emblem
			[331463] = 4, -- Fogged Crystal
			[331296] = 4, -- Forsworn Feather
			[335632] = 4, -- Deathdealer's Scope (Venthyr)
			[335620] = 4, -- Serrated Arrowhead (Venthyr)
			[335557] = 4, -- Pendulum of Impending Doom (Necrolord)
			[342632] = 4, -- Malevolent Stitching (Necrolord)
			[342664] = 4, -- Musophobic Femur (Necrolord)
			[342710] = 4, -- Volatile Flesh (Necrolord)
			[319279] = 4, -- Elethium Alembic
			[315288] = 4, -- Frostbite Wand
			-- D Tier Powers
			[331357] = 5, -- Hateful Shard-Ring 
			[322852] = 5, -- Hunter's Spoils
			[331181] = 5, -- Sticky Tar
			[342556] = 5, -- Stuffed on Mawrats
			[313881] = 5, -- Huntmaster's Cypher
			[313885] = 5, -- Huntmaster's Legacy
			[335562] = 5, -- Chakram Throwers (Necrolord)
			[335600] = 5, -- Glowing Pollen Satchel (Night Fae)
			[325890] = 5, -- Darksight Orbs (Kyrian)
			[325830] = 5, -- Bottomless Chalice (Kyrian)
			[325800] = 5, -- Phial of Light (Kyrian)
			[325801] = 5, -- Phial of Pain (Kyrian)
			[325887] = 5, -- Strigidium (Kyrian)
			[342793] = 5, -- Murmuring Shawl (Venthyr)
			[300793] = 5, -- Open Doors (Venthyr)
			[342757] = 5, -- Clinging Fog (Night Fae)
			[338512] = 5, -- Gaze of Death
			[304996] = 5, -- Frostchipper
			-- E Tier Powers
			[331185] = 6, -- Bone Barbs
			[331193] = 6, -- Feline Femur
			[313884] = 6, -- Huntmaster's Invocation
			[313883] = 6, -- Huntmaster's Lesson
			[335630] = 6, -- Blood-soaked Bow String (Venthyr)
			-- F Tier Powers
			[342540] = 7, -- Neural Pet Enhancer
			[331194] = 7, -- Scaredy Rat
			[314247] = 7, -- Pact of the Soulstalkers (Kyrian, Solo)
			[306609] = 7, -- Disemboweler's Hook
			[319276] = 7, -- Elethium Muzzle
		},
		[254] = { -- Marksmanship
			-- S Tier Powers
			[331367] = 1, -- Sigil of Skoldus
			[331197] = 1, -- Soulforge Embers
			[335541] = 1, -- Sling of the Unseen
			[319280] = 1, -- Elethium Beacon
			[331370] = 1, -- Soulsteel Pinion
			[305052] = 1, -- Lens of Elchaver
			-- A Tier Powers
			[331369] = 2, -- Acrobat's Razor
			[331476] = 2, -- Bag of Mawrat Eyes
			[331187] = 2, -- Cadaverous Cleats
			[331300] = 2, -- Chelonian Crest
			[331192] = 2, -- Necrotic Venom
			[314243] = 2, -- Deadsoul Aspect (Kyrian)
			[314247] = 2, -- Pact of the Soulstalkers (Kyrian, Group)
			[314245] = 2, -- Super Soul Scope (Kyrian)
			[314242] = 2, -- Deathwire (Kyrian)
			[335566] = 2, -- Bag of Munitions (Necrolord)
			[342818] = 2, -- Mask of Withering (Venthyr)
			[342779] = 2, -- Crystallized Dreams (Night Fae)
			[308194] = 2, -- Finger of Frozen Fury
			[319287] = 2, -- Elethium Lantern
			[319041] = 2, -- Elethium Weights
			[285479] = 2, -- Flame Jet
			-- B Tier Powers
			[331179] = 3, -- Acrobat's Rations
			[331355] = 3, -- Craven Strategem
			[331365] = 3, -- Deadeye Satchel
			[331283] = 3, -- Peltsman's Grit
			[331183] = 3, -- Piercing Scope
			[313882] = 3, -- Huntmaster's Gift
			[313886] = 3, -- Huntmaster's Mythos
			[313887] = 3, -- Huntmaster's Ultimatum
			[335611] = 3, -- Capsule of Pure Moonlight (Night Fae)
			[335608] = 3, -- Majestic Antler Fragment (Night Fae)
			[325867] = 3, -- Parliament Stone (Kyrian)
			[342799] = 3, -- Gnarled Key (Venthyr)
			[342789] = 3, -- Smuggled Wildseed (Night Fae)
			[337613] = 3, -- Erratic Howler
			[319288] = 3, -- Elethium Censer
			[319056] = 3, -- Elethium Veil
			-- C Tier Powers
			[331186] = 4, -- Beaststalker's Signet
			[331287] = 4, -- Bursting Tar
			[331190] = 4, -- Euphoria Emblem
			[331463] = 4, -- Fogged Crystal
			[331296] = 4, -- Forsworn Feather
			[335632] = 4, -- Deathdealer's Scope (Venthyr)
			[335620] = 4, -- Serrated Arrowhead (Venthyr)
			[335557] = 4, -- Pendulum of Impending Doom (Necrolord)
			[342632] = 4, -- Malevolent Stitching (Necrolord)
			[342664] = 4, -- Musophobic Femur (Necrolord)
			[342710] = 4, -- Volatile Flesh (Necrolord)
			[319279] = 4, -- Elethium Alembic
			[315288] = 4, -- Frostbite Wand
			-- D Tier Powers
			[331357] = 5, -- Hateful Shard-Ring 
			[322852] = 5, -- Hunter's Spoils
			[331181] = 5, -- Sticky Tar
			[342556] = 5, -- Stuffed on Mawrats
			[313881] = 5, -- Huntmaster's Cypher
			[313885] = 5, -- Huntmaster's Legacy
			[335562] = 5, -- Chakram Throwers (Necrolord)
			[335600] = 5, -- Glowing Pollen Satchel (Night Fae)
			[325890] = 5, -- Darksight Orbs (Kyrian)
			[325830] = 5, -- Bottomless Chalice (Kyrian)
			[325800] = 5, -- Phial of Light (Kyrian)
			[325801] = 5, -- Phial of Pain (Kyrian)
			[325887] = 5, -- Strigidium (Kyrian)
			[342793] = 5, -- Murmuring Shawl (Venthyr)
			[300793] = 5, -- Open Doors (Venthyr)
			[342757] = 5, -- Clinging Fog (Night Fae)
			[338512] = 5, -- Gaze of Death
			[304996] = 5, -- Frostchipper
			-- E Tier Powers
			[331185] = 6, -- Bone Barbs
			[331338] = 6, -- Petrified Pet Food
			[331193] = 6, -- Feline Femur
			[313884] = 6, -- Huntmaster's Invocation
			[313883] = 6, -- Huntmaster's Lesson
			[335630] = 6, -- Blood-soaked Bow String (Venthyr)
			-- F Tier Powers
			[331455] = 7, -- Amplifying Mirror
			[342540] = 7, -- Neural Pet Enhancer
			[331194] = 7, -- Scaredy Rat
			[314247] = 7, -- Pact of the Soulstalkers (Kyrian, Solo)
			[306609] = 7, -- Disemboweler's Hook
			[319276] = 7, -- Elethium Muzzle
		},
		[255] = { -- Survival
			-- S Tier Powers
			[331367] = 1, -- Sigil of Skoldus
			[331197] = 1, -- Soulforge Embers
			[335541] = 1, -- Sling of the Unseen
			[319280] = 1, -- Elethium Beacon
			[331370] = 1, -- Soulsteel Pinion
			[305052] = 1, -- Lens of Elchaver
			-- A Tier Powers
			[331369] = 2, -- Acrobat's Razor
			[331476] = 2, -- Bag of Mawrat Eyes
			[331187] = 2, -- Cadaverous Cleats
			[331300] = 2, -- Chelonian Crest
			[331192] = 2, -- Necrotic Venom
			[314243] = 2, -- Deadsoul Aspect (Kyrian)
			[314247] = 2, -- Pact of the Soulstalkers (Kyrian, Group)
			[314245] = 2, -- Super Soul Scope (Kyrian)
			[314242] = 2, -- Deathwire (Kyrian)
			[335566] = 2, -- Bag of Munitions (Necrolord)
			[342818] = 2, -- Mask of Withering (Venthyr)
			[342779] = 2, -- Crystallized Dreams (Night Fae)
			[308194] = 2, -- Finger of Frozen Fury
			[319287] = 2, -- Elethium Lantern
			[319041] = 2, -- Elethium Weights
			[285479] = 2, -- Flame Jet
			-- B Tier Powers
			[331185] = 3, -- Bone Barbs
			[331179] = 3, -- Acrobat's Rations
			[331186] = 3, -- Beaststalker's Signet
			[331338] = 3, -- Petrified Pet Food
			[331355] = 3, -- Craven Strategem
			[331365] = 3, -- Deadeye Satchel
			[331283] = 3, -- Peltsman's Grit
			[331183] = 3, -- Piercing Scope
			[335611] = 3, -- Capsule of Pure Moonlight (Night Fae)
			[335608] = 3, -- Majestic Antler Fragment (Night Fae)
			[325867] = 3, -- Parliament Stone (Kyrian)
			[342799] = 3, -- Gnarled Key (Venthyr)
			[342789] = 3, -- Smuggled Wildseed (Night Fae)
			[337613] = 3, -- Erratic Howler
			[319288] = 3, -- Elethium Censer
			[319056] = 3, -- Elethium Veil
			-- C Tier Powers
			[331287] = 4, -- Bursting Tar
			[331190] = 4, -- Euphoria Emblem
			[331463] = 4, -- Fogged Crystal
			[331296] = 4, -- Forsworn Feather
			[331192] = 4, -- Necrotic Venom
			[313882] = 4, -- Huntmaster's Gift
			[335632] = 4, -- Deathdealer's Scope (Venthyr)
			[335620] = 4, -- Serrated Arrowhead (Venthyr)
			[335557] = 4, -- Pendulum of Impending Doom (Necrolord)
			[342632] = 4, -- Malevolent Stitching (Necrolord)
			[342664] = 4, -- Musophobic Femur (Necrolord)
			[342710] = 4, -- Volatile Flesh (Necrolord)
			[319279] = 4, -- Elethium Alembic
			[315288] = 4, -- Frostbite Wand
			-- D Tier Powers
			[331357] = 5, -- Hateful Shard-Ring 
			[313884] = 5, -- Huntmaster's Invocation
			[313886] = 5, -- Huntmaster's Mythos
			[322852] = 5, -- Hunter's Spoils
			[331181] = 5, -- Sticky Tar
			[342556] = 5, -- Stuffed on Mawrats
			[313887] = 5, -- Huntmaster's Ultimatum
			[313881] = 5, -- Huntmaster's Cypher
			[313885] = 5, -- Huntmaster's Legacy
			[335562] = 5, -- Chakram Throwers (Necrolord)
			[335600] = 5, -- Glowing Pollen Satchel (Night Fae)
			[325890] = 5, -- Darksight Orbs (Kyrian)
			[325830] = 5, -- Bottomless Chalice (Kyrian)
			[325800] = 5, -- Phial of Light (Kyrian)
			[325801] = 5, -- Phial of Pain (Kyrian)
			[325887] = 5, -- Strigidium (Kyrian)
			[342793] = 5, -- Murmuring Shawl (Venthyr)
			[300793] = 5, -- Open Doors (Venthyr)
			[342757] = 5, -- Clinging Fog (Night Fae)
			[338512] = 5, -- Gaze of Death
			[304996] = 5, -- Frostchipper
			-- E Tier Powers
			[331193] = 6, -- Feline Femur
			[313883] = 6, -- Huntmaster's Lesson
			[335630] = 6, -- Blood-soaked Bow String (Venthyr)
			-- F Tier Powers
			[331455] = 7, -- Amplifying Mirror
			[342540] = 7, -- Neural Pet Enhancer
			[331194] = 7, -- Scaredy Rat
			[314247] = 7, -- Pact of the Soulstalkers (Kyrian, Solo)
			[306609] = 7, -- Disemboweler's Hook
			[319276] = 7, -- Elethium Muzzle
		},
	},
}

local function AnimaPowerExistsForClass(classId, specId, desiredSpellId)
	for spellId, spellTier in pairs(animaPowers[classId][specId]) do
		if spellId == desiredSpellId then
			return true
		end
	end
	return false
end

e:RegisterEvent("PLAYER_CHOICE_UPDATE")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_CHOICE_UPDATE" then
		if HelpMePlayOptionsDB.TorghastPowers == false then return end
		local choiceOptionInfo = ""
		local mapId = C_Map.GetBestMapForUnit("player")
		if mapId then
			local mapName = C_Map.GetMapInfo(mapId).name
			if mapName == L["Torghast"] then
				local choiceInfo = C_PlayerChoice.GetPlayerChoiceInfo()
				if choiceInfo then
					-- Anima Powers are sectioned off by
					-- class and specialization, so get
					-- the player's class and specialization
					-- IDs.
					local _, _, classId = UnitClass("player")
					local specIndex = GetSpecialization()
					local specId = GetSpecializationInfo(specIndex)
					
					-- The stack count is how many stacks
					-- of the spell the player has applied.
					local stackCount = 0
					
					-- Highest priority is based on the
					-- spell's tier. This means the spell
					-- with the lowest number is more
					-- important.
					--
					-- There aren't 10 tiers to Anima Powers
					-- so set the default to 10 as a starting
					-- value.
					local highestPriority = 10
					
					-- The response ID is the number
					-- that represents which option
					-- needs to be selected based on
					-- the highest priority.
					local responseId = 0
					
					-- All the info about a spell is stored
					-- in this variable.
					local option = ""
					
					for i = 1, choiceInfo.numOptions do
						option = C_PlayerChoice.GetPlayerChoiceOptionInfo(i)
						if choiceInfo.numOptions == 1 then
							responseId = option.buttons[1].id
							SendPlayerChoiceResponse(option.buttons[1].id)
							HideUIPanel(PlayerChoiceFrame)
						end
						if option then
							if AnimaPowerExistsForClass(classId, specId, option.spellID) then
								-- The spell exists in the table, so
								-- let's check its assigned priority.
								local priority = animaPowers[classId][option.spellID]
								
								-- If the priority is higher than the
								-- previous spell, then assign the
								-- highest priority for selection.
								--
								-- If the priority is the same as the
								-- highest priority, then the current
								-- Anima Power is on the same tier
								-- as the previous. In this situation
								-- the addon must determine which
								-- spell has the higher current stack
								-- count. The stack count needs to be
								-- set to the new count in case a
								-- future power, if available, is also
								-- on the same tier.
								if priority < highestPriority then
									highestPriority = priority
									responseId = option.buttons[1].id
									for j=1,44 do
										local _, icon, count, _, _, _, _, _, _, spellId = UnitAura("player", i, "MAW")
										if spellId == option.spellID then
											stackCount = count
											break
										end
									end
								elseif priority == highestPriority then
									for j=1,44 do
										local _, icon, count, _, _, _, _, _, _, spellId = UnitAura("player", i, "MAW")
										if spellId == option.spellID then
											if count < stackCount then
												stackCount = count
												responseId = option.buttons[1].id
												break
											end
										end
									end
								end
							end
						end
					end
					-- Select the power that should be chosen
					-- by index, hide the player choice UI, then
					-- print the chosen power to the chat frame.
					--
					-- Reset the highest priority back to 10 to
					-- prevent taint between Anima Powers.
					if responseId ~= 0 then
						SendPlayerChoiceResponse(responseId)
						HideUIPanel(PlayerChoiceFrame)
						print("|cff00CCFF" .. addonName .. "|r: |T" .. option.choiceArtID .. ":0|t" .. GetSpellLink(option.spellID))
						highestPriority = 10
					end
				end
			end
		end
	end
end)