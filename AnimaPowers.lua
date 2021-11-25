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
			[314290] = 4, -- Kyrian Warhelm (Kyrian)
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
			[332407] = 4, -- Defiled Prayer Beads (better for Night Fae)
			[334730] = 4, -- Pendrake's Locket (better in a group)
			[332808] = 4, -- Pendrake's Shattered Aegis (better in a group)
			[332947] = 4, -- Pendrake's Brooch (better in a group)
			[332541] = 4, -- Radiant Essence
			[334992] = 4, -- Thread of Beads
			[313840] = 4, -- Highlord's Gift
			[313843] = 4, -- Highlord's Legacy
			[313844] = 4, -- Highlord's Mythos
		},
		[66] = { -- Protection
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
			[313840] = 2, -- Highlord's Gift
			[313843] = 2, -- Highlord's Legacy
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
			[313842] = 3, -- Highlord's Invocation
			[313841] = 3, -- Highlord's Lesson
			-- C Tier Powers
			[332407] = 4, -- Defiled Prayer Beads (better for Night Fae)
			[334730] = 4, -- Pendrake's Locket (better in a group)
			[332808] = 4, -- Pendrake's Shattered Aegis (better in a group)
			[332947] = 4, -- Pendrake's Brooch (better in a group)
			[332541] = 4, -- Radiant Essence
			[334992] = 4, -- Thread of Beads
			[313844] = 4, -- Highlord's Mythos
		},
		[70] = { -- Retribution
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
			[335441] = 2, -- Golden Plume
			[332806] = 2, -- Badge of the Mad Paragon
			[332545] = 2, -- Ring of Unburdening
			[332807] = 2, -- Coldheart Plume
			[332540] = 2, -- Ancient Writ of Order
			[332803] = 2, -- Gavel of True Judgment
			[332939] = 2, -- Mark of Conk-quest
			[335088] = 2, -- Small Smooth Spike
			[335095] = 2, -- Shard of Milkglass
			[313845] = 2, -- Highlord's Ultimatum
			-- B Tier Powers
			[335054] = 3, -- Faintly Glowing Ember
			[332398] = 3, -- Shattered Gauntlet
			[332799] = 3, -- Blood Beacon
			[332409] = 3, -- Winged Medallion
			[332541] = 3, -- Radiant Essence
			[332534] = 3, -- Soulforged Censer
			[333121] = 3, -- Of Dusk and Dawn
			[305004] = 3, -- Words of Incomprehensible Glory
			[313839] = 3, -- Highlord's Cypher
			[313840] = 3, -- Highlord's Gift
			[332808] = 3, -- Pendrake's Shattered Aegis (better in a group)
			[332842] = 3, -- Soulsteel Hasp
			[335424] = 3, -- Soul-Touched Spurs
			[332539] = 3, -- Soul-Touched Reins
			[332401] = 3, -- Vestige of Hope
			-- C Tier Powers
			[332592] = 4, -- Theory of Justice
			[313843] = 4, -- Highlord's Legacy
			[334730] = 4, -- Pendrake's Locket (better in a group)
			[332947] = 4, -- Pendrake's Brooch (better in a group)
			[334992] = 4, -- Thread of Beads
			[313844] = 4, -- Highlord's Mythos
			[313841] = 4, -- Highlord's Lesson
			[313842] = 4, -- Highlord's Invocation
			[332800] = 4, -- Pendrake's Visor
			[332407] = 4, -- Defiled Prayer Beads (better for Night Fae)
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
	[4] = { -- Rogue
		[259] = { -- Assassination
			-- Powers for Assassination Rogue aren't
			-- listed in tiers like the other specializations.
		},
		[260] = { -- Outlaw
			-- Powers for Outlaw Rogue aren't listed in
			-- tiers like the other specializations.
		},
		[261] = { -- Subtlety
			-- Powers for Subtlety Rogue aren't listed
			-- in tiers like the other specializations.
		},
	},
	[5] = { -- Priest
		[256] = { -- Discipline
			-- S Tier Powers
			[320868] = 1, -- Horrific Dictionary
			[329428] = 1, -- Scales of Trauma
			-- A Tier Powers
			[320887] = 2, -- Painbreaker Psalm
			[320880] = 2, -- Painwheel
			[329605] = 2, -- Power Overwhelming
			[342399] = 2, -- Fae-bliss Lantern
			[342390] = 2, -- Maldo's Soul Exploder
			[342413] = 2, -- Cracked Mindscreecher
			[327513] = 2, -- Feathered Fetters
			[327468] = 2, -- Second Chorus
			[327363] = 2, -- Torch of Humility
			[321189] = 2, -- Dead Mawrat
			[329416] = 2, -- Death Harvester
			[320884] = 2, -- Impulsor
			[320888] = 2, -- Mind Exploder
			[313892] = 2, -- High Priest's Legacy
			[344566] = 2, -- Rapid Contagion
			-- B Tier Powers
			[320886] = 3, -- Catharstick
			[342397] = 3, -- Pixie Dust
			[342387] = 3, -- Baroness' Lost Plagueloop
			[342411] = 3, -- Mindmancer Handgloves
			[342412] = 3, -- Earworm
			[327469] = 3, -- Deeply-Held Vow
			[329241] = 3, -- Volatile Phantasm
			[320886] = 3, -- Catharstick
			[320892] = 3, -- Puppetmaster's Strings
			[320889] = 3, -- Diary of Necrotic Thoughts
			[320896] = 3, -- Enchanted Shroud
			[320872] = 3, -- Flashbox
			[320885] = 3, -- Modified Impulsor
			[320895] = 3, -- Thick Burlap Sash
			[313888] = 3, -- High Priest's Cypher
			-- C Tier Powers
			[320890] = 4, -- Psychic Wallet
			[342409] = 4, -- Dreamspun Mushrooms
			[342382] = 4, -- Necromight Infusion
			[327370] = 4, -- Faithstone
			[327536] = 4, -- Glorious Prayer
			[313894] = 4, -- High Priest's Ultimatum
			[313893] = 4, -- High Priest's Mythos
			[313890] = 4, -- High Priest's Lesson
			[313889] = 4, -- High Priest's Gift
			[313891] = 4, -- High Priest's Invocation
			[329689] = 4, -- Wailing Visage
			[320871] = 4, -- Vandal's Zeal
			[320881] = 4, -- Schaden Fluorite
			[321289] = 4, -- Power Word: Snuggle
			[329300] = 4, -- Pandemonium Loop
			[320869] = 4, -- Light-Tinged Scraps
			[320879] = 4, -- Idea Eater
			[329588] = 4, -- Fragments of Obscurity
			[320870] = 4, -- Flash-Echo Focus
			[320893] = 4, -- Cruelty Censer
			[320874] = 4, -- Art of Phantasmal Healing
		},
		[257] = { -- Holy
			-- S Tier Powers
			[320886] = 1, -- Catharstick
			[321189] = 1, -- Dead Mawrat
			[329416] = 1, -- Death Harvester
			[320876] = 1, -- Holyfire Draught
			[320868] = 1, -- Horrific Dictionary
			[329300] = 1, -- Pandemonium Loop
			[320890] = 1, -- Psychic Wallet
			[344566] = 1, -- Rapid Contagion
			[329241] = 1, -- Volatile Phantasm
			[342413] = 1, -- Cracked Mindscreecher
			[342390] = 1, -- Maldo's Soul Exploder
			-- A Tier Powers
			[320889] = 2, -- Diary of Necrotic Thoughts
			[320875] = 2, -- Consuming Refrain
			[320893] = 2, -- Cruelty Censer
			[320878] = 2, -- Holy Hellstone
			[313891] = 2, -- High Priest's Invocation
			[320884] = 2, -- Impulsor
			[320885] = 2, -- Modified Impulsor
			[320887] = 2, -- Painbreaker Psalm
			[320880] = 2, -- Painwheel
			[320882] = 2, -- Red-Hot Mindpokers
			[327513] = 2, -- Feathered Fetters
			[327363] = 2, -- Torch of Humility
			[342382] = 2, -- Necromight Infusion
			-- B Tier Powers
			[313889] = 3, -- High Priest's Gift
			[313894] = 3, -- High Priest's Ultimatum
			[342387] = 3, -- Baroness' Lost Plagueloop
			[320896] = 3, -- Enchanted Shroud
			[320872] = 3, -- Flashbox
			[329588] = 3, -- Fragments of Obscurity
			[320877] = 3, -- Mark of Righteous Protection
			[320892] = 3, -- Puppetmaster's Strings
			[329428] = 3, -- Scales of Trauma
			[320873] = 3, -- Searing Lantern
			[329689] = 3, -- Wailing Visage
			[327536] = 3, -- Glorious Prayer
			[327469] = 3, -- Deeply-Held Vow
			[342412] = 3, -- Earworm
			[342399] = 3, -- Fae-bliss Lantern
			-- C Tier Powers
			[342409] = 4, -- Dreamspun Mushrooms
			[342397] = 4, -- Pixie Dust
			[321289] = 4, -- Power Word: Snuggle
			[320879] = 4, -- Idea Eater
			[320869] = 4, -- Light-Tinged Scraps
			[327370] = 4, -- Faithstone
			[320870] = 4, -- Flash-Echo Focus
			[320874] = 4, -- Art of Phantasmal Healing
			[342411] = 4, -- Mindmancer Handgloves
			[320881] = 4, -- Schaden Fluorite
			[320895] = 4, -- Thick Burlap Sash
			[320871] = 4, -- Vandal's Zeal
			[313888] = 4, -- High Priest's Cypher
			[313892] = 4, -- High Priest's Legacy
			[313890] = 4, -- High Priest's Lesson
			[313893] = 4, -- High Priest's Mythos
		},
		[258] = { -- Shadow
			-- S Tier Powers
			[320893] = 1, -- Cruelty Censer
			[342409] = 1, -- Dreamspun Mushrooms
			[342399] = 1, -- Fae-bliss Lantern
			[342390] = 1, -- Maldo's Soul Exploder
			[329605] = 1, -- Power Overwhelming
			[329416] = 1, -- Death Harvester
			[350068] = 1, -- Fallen Priest's Blessing
			[350140] = 1, -- Voidwraith Signet
			[350117] = 1, -- Soul of an Archon
			[320868] = 1, -- Horrific Dictionary
			-- A Tier Powers
			[342387] = 2, -- Baroness' Lost Plagueloop
			[342413] = 2, -- Cracked Mindscreecher
			[320884] = 2, -- Impulsor
			[313892] = 2, -- High Priest's Legacy
			[313890] = 2, -- High Priest's Lesson
			[329237] = 2, -- Mask of Sheer Terror
			[342382] = 2, -- Necromight Infusion
			[329241] = 2, -- Volatile Phantasm
			[329689] = 2, -- Wailing Visage
			[321189] = 2, -- Dead Mawrat
			[320886] = 2, -- Catharstick
			[320880] = 2, -- Painwheel
			[320871] = 2, -- Vandal's Zeal
			[350129] = 2, -- Dark Technique
			[329632] = 2, -- Light-Infused Egg
			-- B Tier Powers
			[320882] = 3, -- Red-Hot Mindpokers
			[327469] = 3, -- Deeply-Held Vow
			[327513] = 3, -- Feathered Fetters
			[320872] = 3, -- Flashbox
			[313891] = 3, -- High Priest's Invocation
			[313893] = 3, -- High Priest's Mythos
			[313894] = 3, -- High Priest's Ultimatum
			[320879] = 3, -- Idea Eater
			[320888] = 3, -- Mind Exploder
			[320885] = 3, -- Modified Impulsor
			[320887] = 3, -- Painbreaker Psalm
			[329300] = 3, -- Pandemonium Loop
			[321289] = 3, -- Power Word: Snuggle
			[349859] = 3, -- Cowl of Influence
			[320892] = 3, -- Puppetmaster's Strings
			[329428] = 3, -- Scales of Trauma
			[320873] = 3, -- Searing Lantern
			[320895] = 3, -- Thick Burlap Sash
			[327363] = 3, -- Torch of Humility
			[329588] = 3, -- Fragments of Obscurity
			[342411] = 3, -- Mindmancer Handgloves
			-- C Tier Powers
			[320889] = 4, -- Diary of Necrotic Thoughts
			[342412] = 4, -- Earworm
			[320896] = 4, -- Enchanted Shroud
			[327370] = 4, -- Faithstone
			[327536] = 4, -- Glorious Prayer
			[313888] = 4, -- High Priest's Cypher
			[313889] = 4, -- High Priest's Gift
			[313892] = 4, -- High Priest's Legacy
			[329510] = 4, -- Life Barrier
			[320869] = 4, -- Light-Tinged Scraps
			[342397] = 4, -- Pixie Dust
			[344566] = 4, -- Rapid Contagion
			[320881] = 4, -- Schaden Fluorite
			[327468] = 4, -- Second Chorus
		},
	},
	[6] = { -- Death Knight
		[250] = { -- Blood
			-- A Tier Powers
			[331865] = 2, -- Skull Bloomer
			[334974] = 2, -- Superstrain
			[332366] = 2, -- Ancient Drake Breath
			[332924] = 2, -- Blood-tinged Poker
			[332532] = 2, -- Boundless Fortitude
			[332603] = 2, -- Exterminator
			[332548] = 2, -- Necromantic Bile
			[332584] = 2, -- Unquenchable Blade
			[333471] = 2, -- Undertaker's Crown
			[313846] = 2, -- Deathlord's Cypher
			[313849] = 2, -- Deathlord's Invocation
			[313850] = 2, -- Deathlord's Legacy
			-- B Tier Powers
			[332546] = 3, -- Animate Armaments
			[332578] = 3, -- Bone Growing Juice
			[332316] = 3, -- Bone Harvester
			[332739] = 3, -- Darkreaver's Lens
			[332573] = 3, -- Lich Robes
			[332517] = 3, -- Death Turf
			[333124] = 3, -- Blightstone
			[331519] = 3, -- The Horsemen's Call
			[332212] = 3, -- Occult Emitter
			[333067] = 3, -- Rune Hunter
			[331921] = 3, -- Tome of Swordplay
			[313847] = 3, -- Deathlord's Gift
			[313851] = 3, -- Deathlord's Mythos
			-- C Tier Powers
			[332216] = 4, -- Chains of Anguish
			[332125] = 4, -- Creeping Decay
			[332861] = 4, -- Darkreaver's Ward
			[331916] = 4, -- Force Pull
			[332001] = 4, -- Monstrous Concoction
			[332199] = 4, -- Phearomones
			[332685] = 4, -- Plaguebringer
			[332163] = 4, -- Slick Ice
			[333041] = 4, -- Unbreakable Cuffs
			[313848] = 4, -- Deathlord's Lesson
			[313852] = 4, -- Deathlord's Ultimatum
		},
		[251] = { -- Frost
			-- A Tier Powers
			[332366] = 2, -- Ancient Drake Breath
			[313846] = 2, -- Deathlord's Cypher
			[332548] = 2, -- Necromantic Bile
			[313847] = 2, -- Deathlord's Gift
			[313852] = 2, -- Deathlord's Ultimatum
			[332924] = 2, -- Blood-tinged Poker
			[332578] = 2, -- Bone Growing Juice
			[332517] = 2, -- Death Turf
			[331865] = 2, -- Skull Bloomer
			[314235] = 2, -- Oppressor's Chain
			[340728] = 2, -- Fatal Grasp (Necrolord)
			[332573] = 2, -- Lich Robes
			[332001] = 2, -- Monstrous Concoction
			[333471] = 2, -- Undertaker's Crown
			[333041] = 2, -- Unbreakable Cuffs
			[332532] = 2, -- Boundless Fortitude
			-- B Tier Powers
			[332216] = 3, -- Chains of Anguish
			[313849] = 3, -- Deathlord's Invocation
			[313851] = 3, -- Deathlord's Mythos
			[332739] = 3, -- Darkreaver's Lens
			[331519] = 3, -- The Horsemen's Call
			[333067] = 3, -- Rune Hunter
			[331921] = 3, -- Tome of Swordplay
			[314233] = 3, -- Hateforged Cilice (Kyrian)
			[314230] = 3, -- Eyes of the Unceasing (Kyrian)
			[341098] = 3, -- Death's Deliverance (Venthyr)
			[341095] = 3, -- Swarm Host (Venthyr)
			[340725] = 3, -- Engorged Limb (Necrolord)
			[333327] = 3, -- Corrupted Sapwood (Night Fae)
			[332861] = 3, -- Darkreaver's Ward
			[332543] = 3, -- Entropic Pool
			[350575] = 3, -- Bone Borrower
			[348904] = 3, -- Desolate Chitin (Necrolord)
			[348910] = 3, -- Frigid Wildseed (Night Fae)
			-- C Tier Powers
			[332316] = 4, -- Bone Harvester
			[333124] = 4, -- Blightstone
			[332212] = 4, -- Occult Emitter
			[332125] = 4, -- Creeping Decay
			[331916] = 4, -- Force Pull
			[332199] = 4, -- Phearomones
			[332685] = 4, -- Plaguebringer
			[332163] = 4, -- Slick Ice
			[314232] = 4, -- Darkhelm of Nuren (Kyrian)
			[314234] = 4, -- Twisted Hellchoker (Kyrian)
			[314231] = 4, -- Reinforced Manacle (Kyrian)
			[340928] = 4, -- Formless Executioner (Venthyr)
			[340755] = 4, -- Prosthetic Grabber (Necrolord)
			[333608] = 4, -- Nightmare Tendrils (Night Fae)
			[333388] = 4, -- Toxic Accumulator (Night Fae)
			[348908] = 4, -- Ethereal Wildseed (Night Fae)
		},
		[252] = { -- Unholy
			-- A Tier Powers
			[332366] = 2, -- Ancient Drake Breath
			[332001] = 2, -- Monstrous Concoction
			[332924] = 2, -- Blood-tinged Poker
			[313846] = 2, -- Deathlord's Cypher
			[332548] = 2, -- Necromantic Bile
			[313847] = 2, -- Deathlord's Gift
			[313852] = 2, -- Deathlord's Ultimatum
			[332578] = 2, -- Bone Growing Juice
			[332517] = 2, -- Death Turf
			[331865] = 2, -- Skull Bloomer
			[314235] = 2, -- Oppressor's Chain
			[340728] = 2, -- Fatal Grasp (Necrolord)
			[332573] = 2, -- Lich Robes
			[332216] = 2, -- Chains of Anguish
			[332532] = 2, -- Boundless Fortitude
			[333471] = 2, -- Undertaker's Crown
			-- B Tier Powers
			[313849] = 3, -- Deathlord's Invocation
			[332739] = 3, -- Darkreaver's Lens
			[331519] = 3, -- The Horsemen's Call
			[333067] = 3, -- Rune Hunter
			[331921] = 3, -- Tome of Swordplay
			[314233] = 3, -- Hateforged Cilice (Kyrian)
			[314230] = 3, -- Eyes of the Unceasing (Kyrian)
			[341098] = 3, -- Death's Deliverance (Venthyr)
			[341095] = 3, -- Swarm Host (Venthyr)
			[340725] = 3, -- Engorged Limb (Necrolord)
			[333327] = 3, -- Corrupted Sapwood (Night Fae)
			[332212] = 3, -- Occult Emitter
			[332543] = 3, -- Entropic Pool
			[350575] = 3, -- Bone Borrower
			[348904] = 3, -- Desolate Chitin (Necrolord)
			[348910] = 3, -- Frigid Wildseed (Night Fae)
			-- C Tier Powers
			[332316] = 4, -- Bone Harvester
			[333124] = 4, -- Blightstone
			[332125] = 4, -- Creeping Decay
			[332861] = 4, -- Darkreaver's Ward
			[331916] = 4, -- Force Pull
			[332199] = 4, -- Phearomones
			[332685] = 4, -- Plaguebringer
			[332163] = 4, -- Slick Ice
			[333041] = 4, -- Unbreakable Cuffs
			[313851] = 4, -- Deathlord's Mythos
			[314232] = 4, -- Darkhelm of Nuren (Kyrian)
			[314234] = 4, -- Twisted Hellchoker (Kyrian)
			[314231] = 4, -- Reinforced Manacle (Kyrian)
			[340928] = 4, -- Formless Executioner (Venthyr)
			[340755] = 4, -- Prosthetic Grabber (Necrolord)
			[333608] = 4, -- Nightmare Tendrils (Night Fae)
			[333388] = 4, -- Toxic Accumulator (Night Fae)
			[348908] = 4, -- Ethereal Wildseed (Night Fae)
		},
	},
	[7] = { -- Shaman
		[262] = { -- Elemental
			-- S Tier Powers
			[329798] = 1, -- Deeptremor Stone
			[329534] = 1, -- Deadened Earth
			[329789] = 1, -- Deathseer's Whip
			[350248] = 1, -- Depleted Tesla Coil
			-- A Tier Powers
			[329580] = 2, -- Bottle of Swirling Maelstrom
			[329590] = 2, -- Elemental Core
			[329572] = 2, -- Flames of the Cauldron
			[188389] = 2, -- Flame Shock
			[329526] = 2, -- Wailing Winds
			[333357] = 2, -- Elemental Conduit
			[333366] = 2, -- Crystallized Elemental Heart
			[333344] = 2, -- Hourglass of Soul Dust
			[298884] = 2, -- Farseer's Gift
			[298885] = 2, -- Farseer's Invocation
			[329573] = 2, -- Vial of Soothing Waters
			[330383] = 2, -- Guardian's Cudgel
			[298581] = 2, -- Shake the Foundations
			[333352] = 2, -- Seeds of Rampant Growth
			[329949] = 2, -- Blood of Heroes
			[333262] = 2, -- Vesperwind Bit
			-- B Tier Powers
			[329817] = 3, -- Flowing Streams
			[329595] = 3, -- Leeching Lilypad
			[333264] = 3, -- Generosity of the Winged Seer
			[333339] = 3, -- Splintered Elemental Rod
			[329811] = 3, -- Spike of the Ice Guardian
			[298883] = 3, -- Farseer's Cypher
			[313766] = 3, -- Farseer's Legacy
			[329538] = 3, -- Astral Bulwark
			[144585] = 3, -- Ancestral Fury
			[329576] = 3, -- Tsunami Relic
			[298952] = 3, -- Ignan Oblation
			-- C Tier Powers
			[350252] = 4, -- Pure Elemental Core
			[314278] = 4, -- Wildzeal Wraps
			[330179] = 4, -- Heart of the Deathseer
			[329857] = 4, -- Deathseer's Satchel
			[298991] = 4, -- By Fire Be Purged
			[333355] = 4, -- Blood Stained Gauntlet
			[298969] = 4, -- Magma Fist
			[333334] = 4, -- Fossilized Bone Fragments
			[333349] = 4, -- Bloody Thorn Stalk
			[333348] = 4, -- Crystalline Leaf
			[329726] = 4, -- Rimeblood
			[329793] = 4, -- Mawrats on Ice
			[329937] = 4, -- Deathseer Choker
			[295948] = 4, -- Farseer's Lesson
			[298887] = 4, -- Farseer's Ultimatum
		},
		[263] = { -- Enhancement
			-- S Tier Powers
			[305274] = 1, -- Dark Armaments
			[329937] = 1, -- Deathseer Choker
			[329857] = 1, -- Deathseer's Satchel
			[329789] = 1, -- Deathseer's Whip
			[333357] = 1, -- Elemental Conduit
			[329590] = 1, -- Elemental Core
			[298885] = 1, -- Farseer's Invocation
			[329817] = 1, -- Flowing Streams
			[304996] = 1, -- Frostchipper
			[329726] = 1, -- Rimeblood
			[329732] = 1, -- Untaintable Waters
			-- A Tier Powers
			[329883] = 2, -- Blackened Boulder
			[319279] = 2, -- Elethium Alembic
			[319288] = 2, -- Elethium Censer
			[319287] = 2, -- Elethium Lantern
			[298883] = 2, -- Farseer's Cypher
			[298887] = 2, -- Farseer's Ultimatum
			[308194] = 2, -- Finger of Frozen Fury
			[315288] = 2, -- Frostbite Wand
			[329962] = 2, -- Furious Spirits
			[333264] = 2, -- Generosity of the Winged Seer
			[306573] = 2, -- Gift of Ardenweald
			[330179] = 2, -- Heart of the Deathseer
			[306563] = 2, -- Kyrian Blessing
			[308195] = 2, -- Lightning Dust
			[342818] = 2, -- Mask of Withering
			[306571] = 2, -- Maldraxxian Repayment
			[325801] = 2, -- Phial of Pain
			[295694] = 2, -- Secret Spices
			[333352] = 2, -- Seeds of Rampant Growth
			[315319] = 2, -- Spectral Oats
			[297721] = 2, -- Subjugator's Manacles
			[306575] = 2, -- Venthyr's Gratitude
			[333262] = 2, -- Vesperwind Bit
			[300730] = 2, -- Vitality Guillotine
			-- B Tier Powers
			[329538] = 3, -- Astral Bulwark
			[300771] = 3, -- Blade of the Lifetaker
			[329949] = 3, -- Blood of Heroes
			[333355] = 3, -- Blood Stained Gauntlet
			[333349] = 3, -- Bloody Thorn Stalk
			[294719] = 3, -- Bottled Enigma
			[333348] = 3, -- Crystalline Leaf
			[342779] = 3, -- Crystallized Dreams
			[333366] = 3, -- Crystallized Elemental Heart
			[308196] = 3, -- Corruption Antenna
			[329798] = 3, -- Deeptremor Stone
			[333261] = 3, -- Diamondine Vesper
			[333344] = 3, -- Hourglass of Soul Dust
			[338023] = 3, -- Irritating Moth Dust
			[329595] = 3, -- Leeching Lilypad
			[308193] = 3, -- Lens of Elchaver
			[337928] = 3, -- Potent Acid Gland
			[338616] = 3, -- Pulsing Rot-hive
			[329530] = 3, -- Storm Conduit
			[304998] = 3, -- Stormcycle Peridot
			[329573] = 3, -- Vial of Soothing Waters
			[305050] = 3, -- Watchful Lightfly
			-- C Tier Powers
			[294422] = 4, -- Bloating Fodder
			[329768] = 4, -- Chains of Devastation
			[308201] = 4, -- Curious Miasma
			[337878] = 4, -- Dark Fortress
			[325890] = 4, -- Darksight Orbs
			[329534] = 4, -- Deadened Earth
			[319041] = 4, -- Elethium Weights
			[329537] = 4, -- Essence of the Ancestors
			[298884] = 4, -- Farseer's Gift
			[298886] = 4, -- Farseer's Mythos
			[329572] = 4, -- Flames of the Cauldron
			[333334] = 4, -- Fossilized Bone Fragments
			[342793] = 4, -- Murmuring Shawl
			[300793] = 4, -- Open Doors
			[295754] = 4, -- Purifier's Flame
			[325800] = 4, -- Phial of Light
			[329805] = 4, -- Shield of Spirits
			[342789] = 4, -- Smuggled Wildseed
			[333339] = 4, -- Splintered Elemental Rod
			[325887] = 4, -- Strigidium
			[338631] = 4, -- Swarm Form
			[342710] = 4, -- Volatile Flesh
			[329526] = 4, -- Wailing Winds
			[305054] = 4, -- Yel'Shir's Powerglove
			-- D Tier Powers
			[342757] = 5, -- Clinging Fog
			[308204] = 5, -- Crumbling Aegis
			[306609] = 5, -- Disemboweler's Hook
			[319280] = 5, -- Elethium Beacon
			[313766] = 5, -- Farseer's Legacy
			[342799] = 5, -- Gnarled Key
			[330383] = 5, -- Guardian's Cudgel
			[325867] = 5, -- Parliament Stone
			[315314] = 5, -- Spectral Bridle
			[329811] = 5, -- Spike of the Ice Guardian
			-- E Tier Powers
			[319276] = 6, -- Elethium Muzzle
			[319285] = 6, -- Elethium Teardrop
			[295948] = 6, -- Farseer's Lesson
			[329580] = 6, -- Ghost Bone
			[316693] = 6, -- Irresistible Cheese
			[342632] = 6, -- Malevolent Stitching
			[295187] = 6, -- Mawrat Harness
			[329793] = 6, -- Mawrats on Ice
			[304845] = 6, -- Mawrat Stirrups
			[342664] = 6, -- Musophobic Femur
			[305006] = 6, -- Scroll of Elchaver
			[297576] = 6, -- Tremorbeast Tusk
			[329576] = 6, -- Tsunami Relic
			-- F Tier Powers
			[325830] = 7, -- Bottomless Chalice
			[320800] = 7, -- Edgelurker
			[327761] = 7, -- Negation Well
		},
		[264] = { -- Restoration
			-- S Tier Powers
			[329789] = 1, -- Deathseer's Whip
			[329798] = 1, -- Deeptremor Stone
			[329534] = 1, -- Deadened Earth
			[350248] = 1, -- Depleted Tesla Coil
			[329590] = 1, -- Elemental Core
			[329580] = 1, -- Bottle of Swirling Maelstrom
			[329530] = 1, -- Storm Conduit
			[308196] = 1, -- Corruption Antenna
			[350252] = 1, -- Pure Elemental Core
			[329949] = 1, -- Blood of Heroes
			[330179] = 1, -- Heart of the Deathseer
			[329883] = 1, -- Blackened Boulder
			[329572] = 1, -- Flames of the Cauldron
			[329537] = 1, -- Essence of the Ancestors
			[342027] = 1, -- Offer of Souls
			[306573] = 1, -- Gift of Ardenweald
			[306575] = 1, -- Venthyr's Gratitude
			[306571] = 1, -- Maldraxxian Repayment
			[329576] = 1, -- Tsunami Relic
			-- A Tier Powers
			[329732] = 2, -- Untaintable Waters
			[329726] = 2, -- Rimeblood
			[329937] = 2, -- Deathseer Choker
			[342818] = 2, -- Mask of Withering
			[342799] = 2, -- Gnarled Key
			[325867] = 2, -- Parliament Stone
			[329595] = 2, -- Leeching Lilypad
			[342710] = 2, -- Volatile Flesh
			[329526] = 2, -- Wailing Winds
			[329768] = 2, -- Chains of Devastation
			[306625] = 2, -- Cilice of Denathrius
			[333264] = 2, -- Generosity of the Winged Seer
			[333262] = 2, -- Vesperwind Bit
			[314278] = 2, -- Wildzeal Wraps
			[330383] = 2, -- Guardian's Cudgel
			[333349] = 2, -- Bloody Thorn Stalk
			[333348] = 2, -- Crystalline Leaf
			[356250] = 2, -- Elemental Conduit
			[333366] = 2, -- Crystallized Elemental Heart
			[333355] = 2, -- Blood Stained Gauntlet
			-- B Tier Powers
			[333339] = 3, -- Splintered Elemental Rod
			[294422] = 3, -- Bloating Fodder
			[329538] = 3, -- Astral Bulwark
			[320800] = 3, -- Edgelurker
			[342632] = 3, -- Malevolent Stitching
			[342793] = 3, -- Murmuring Shawl
			[348904] = 3, -- Desolate Chitin
			[329857] = 3, -- Deathseer's Satchel
			[298690] = 3, -- Improved Healing Surge
			[329573] = 3, -- Vial of Soothing Waters
			-- C Tier Powers
			[348910] = 4, -- Frigid Wildseed
			[308204] = 4, -- Crumbling Aegis
			[329817] = 4, -- Flowing Streams
			[348908] = 4, -- Ethereal Wildseed
			[333352] = 4, -- Seeds of Rampant Growth
			[298883] = 4, -- Farseer's Cypher
			[298884] = 4, -- Farseer's Gift
			[298885] = 4, -- Farseer's Invocation
			[313766] = 4, -- Farseer's Legacy
			[295948] = 4, -- Farseer's Lesson
			[298886] = 4, -- Farseer's Mythos
			[298887] = 4, -- Farseer's Ultimatum
			[333344] = 4, -- Hourglass of Soul Dust
		},
	},
	[8] = { -- Mage
		[62] = { -- Arcane
			-- S Tier Powers
			[320915] = 1, -- Grisly Icicle
			[320926] = 1, -- Art of the Blinkmage
			[320927] = 1, -- Clouded Diamond
			[320907] = 1, -- Highly-Polished Handmirror
			[320898] = 1, -- Seeker's Scroll
			[320912] = 1, -- Tundrid Phial
			[342376] = 1, -- Maliced Rumination
			[320914] = 1, -- Chronomancer's Hourglass
			-- A Tier Powers
			[330630] = 2, -- Gravity Dynamo
			[350267] = 2, -- Incanter's Ward
			[320927] = 2, -- Clouded Diamond
			[320898] = 2, -- Seeker's Scroll
			[320921] = 2, -- Runecloth Wrappings
			[320907] = 2, -- Highly-Polished Handmirror
			[320911] = 2, -- Resolute Medallion
			[320906] = 2, -- Scroll of Explosure
			[313870] = 2, -- Archmage's Invocation
			[320924] = 2, -- Spaceweaver's Thread
			[342376] = 2, -- Maliced Rumination
			-- B Tier Powers
			[320926] = 3, -- Art of the Blinkmage
			[320912] = 3, -- Tundrid Phial
			[320909] = 3, -- Eldritch Teachings
			[320903] = 3, -- Chaos Invitation
			[321445] = 3, -- Mad Wizard's Intellect
			[320900] = 3, -- Pandemonium Lens
			[333373] = 3, -- Triune Ward
			[320901] = 3, -- Whizzard Hat
			[313867] = 3, -- Archmage's Cypher
			[313871] = 3, -- Archmage's Legacy
			[313869] = 3, -- Archmage's Lesson
			[313872] = 3, -- Archmage's Mythos
			[314253] = 3, -- Wizard's Prayer
			[342371] = 3, -- Fae Concentration
			[342372] = 3, -- Fae Tendrils
			-- C Tier Powers
			[320902] = 4, -- Bombardier's Etching
			[350267] = 4, -- Incanter's Ward
			[320910] = 4, -- Constellation Shield
			[320919] = 4, -- Echoes of Elisande
			[320905] = 4, -- Sapphire Prism
			[330551] = 4, -- Spellweaver's Mojo
			[320899] = 4, -- Wand Grease
			[313873] = 4, -- Archmage's Ultimatum
			[314251] = 4, -- Long-Forbidden Words
			[314249] = 4, -- Scroll of the Arcane Meditator
			[314252] = 4, -- Urael's Finality
			[342377] = 4, -- Malevolence
			[342360] = 4, -- One With Death
			[330579] = 4, -- Fire Juggler
			[313868] = 4, -- Archmage's Gift
			[320908] = 4, -- Sorceror's Frozen Soul
			-- D Tier Powers
			[320923] = 5, -- Arcanic Pulse Detector
			[320903] = 5, -- Chaos Invitation
			[320925] = 5, -- Dimensional Blade
			[320909] = 5, -- Maldo's Enchanted Cane
			[320924] = 5, -- Spaceweaver's Thread
			[320920] = 5, -- Timebreaker's Paradox
			[320914] = 5, -- Tome of Zoomancy
			[314248] = 5, -- Anima-Flecked Topaz
			[314250] = 5, -- Winged Curio
			[285212] = 5, -- Chilling Touch
			[342359] = 5, -- Power Overwhelming
			-- E Tier Powers
			[320917] = 6, -- Bottled Tesseract
			[320913] = 6, -- Everwarm Socks
			[320915] = 6, -- Grisly Icicle
			[320908] = 6, -- Polymorbid Rat Liver
			[330745] = 6, -- Timeweaver's Needle
			[300796] = 6, -- Touch of the Unseen
			[342374] = 6, -- Lingering Torments
			[342370] = 6, -- Infinite Power
			[320904] = 6, -- Manascale
		},
		[63] = { -- Fire
			-- S Tier Powers
			[330630] = 1, -- Gravity Dynamo
			[320914] = 1, -- Chronomancer's Hourglass
			[320915] = 1, -- Grisly Icicle
			[320926] = 1, -- Art of the Blinkmage
			[320927] = 1, -- Clouded Diamond
			[320907] = 1, -- Highly-Polished Handmirror
			[320898] = 1, -- Seeker's Scroll
			[320912] = 1, -- Tundrid Phial
			[342376] = 1, -- Maliced Rumination
			[330579] = 1, -- Fire Juggler
			[330630] = 1, -- Gravity Dynamo
			[330579] = 1, -- Fire Juggler
			-- A Tier Powers
			[350267] = 2, -- Incanter's Ward
			[320909] = 2, -- Eldritch Teachings
			[320927] = 2, -- Clouded Diamond
			[320921] = 2, -- Runecloth Wrappings
			[320907] = 2, -- Highly-Polished Handmirror
			[320911] = 2, -- Resolute Medallion
			[320906] = 2, -- Scroll of Explosure
			[313870] = 2, -- Archmage's Invocation
			[320924] = 2, -- Spaceweaver's Thread
			[342376] = 2, -- Maliced Rumination
			-- B Tier Powers
			[320926] = 3, -- Art of the Blinkmage
			[320912] = 3, -- Tundrid Phial
			[313868] = 3, -- Archmage's Gift
			[320903] = 3, -- Chaos Invitation
			[321445] = 3, -- Mad Wizard's Intellect
			[320904] = 3, -- Manascale
			[320900] = 3, -- Pandemonium Lens
			[320916] = 3, -- Triune Ward
			[320901] = 3, -- Whizzard Hat
			[313867] = 3, -- Archmage's Cypher
			[313871] = 3, -- Archmage's Legacy
			[313869] = 3, -- Archmage's Lesson
			[313872] = 3, -- Archmage's Mythos
			[314253] = 3, -- Wizard's Prayer
			[342371] = 3, -- Fae Concentration
			[342372] = 3, -- Fae Tendrils
			[320898] = 3, -- Seeker's Scroll
			-- C Tier Powers
			[350267] = 4, -- Incanter's Ward
			[320902] = 4, -- Bombardier's Etching
			[320910] = 4, -- Constellation Shield
			[320919] = 4, -- Echoes of Elisande
			[320905] = 4, -- Sapphire Prism
			[330551] = 4, -- Spellweaver's Mojo
			[320899] = 4, -- Wand Grease
			[313873] = 4, -- Archmage's Ultimatum
			[314251] = 4, -- Long-Forbidden Words
			[314249] = 4, -- Scroll of the Arcane Meditator
			[314252] = 4, -- Urael's Finality
			[342377] = 4, -- Malevolence
			[342360] = 4, -- One With Death
			[320908] = 4, -- Sorceror's Frozen Soul
			-- D Tier Powers
			[320923] = 5, -- Arcanic Pulse Detector
			[320903] = 5, -- Chaos Invitation
			[320925] = 5, -- Dimensional Blade
			[320909] = 5, -- Maldo's Enchanted Cane
			[320924] = 5, -- Spaceweaver's Thread
			[320920] = 5, -- Timebreaker's Paradox
			[320914] = 5, -- Tome of Zoomancy
			[314248] = 5, -- Anima-Flecked Topaz
			[314250] = 5, -- Winged Curio
			[285212] = 5, -- Chilling Touch
			[342359] = 5, -- Power Overwhelming
			-- E Tier Powers
				-- No powers are in this tier for this specialization.
			-- F Tier Powers
			[320917] = 7, -- Bottled Tesseract
			[320913] = 7, -- Everwarm Socks
			[320915] = 7, -- Grisly Icicle
			[320908] = 7, -- Polymorbid Rat Liver
			[330745] = 7, -- Timeweaver's Needle
			[300796] = 7, -- Touch of the Unseen
			[342374] = 7, -- Lingering Torments
			[342370] = 7, -- Infinite Power
		},
		[64] = { -- Frost
			-- Powers for Frost Mage aren't listed in
			-- tiers like the other specializations.
		},
	},
	[9] = { -- Warlock
		[265] = { -- Affliction
			-- S Tier Powers
			[308204] = 1, -- Crumbling Aegis
			[295086] = 1, -- Ultimate Detainment
			[320942] = 1, -- Choking Chains
			-- A Tier Powers
			[322335] = 2, -- Heart of Endereth
			[315319] = 2, -- Spectral Oats
			[320800] = 2, -- Edgelurker
			[337881] = 2, -- Fallen Armaments
			[338948] = 2, -- V'lara's Cape of Subterfuge
			[337645] = 2, -- Brittle Bone Dust
			[342027] = 2, -- Offer of Souls
			[305269] = 2, -- Pocketed Soulcage
			[320939] = 2, -- Dissolving Vial
			[320938] = 2, -- Inferno Skewers
			[320932] = 2, -- Mark of Borrowed Power
			[320943] = 2, -- Pact of Thickness
			-- B Tier Powers
			[339126] = 3, -- Imperial Warrant
			[296141] = 3, -- Knowledge of Mortality
			[337928] = 3, -- Potent Acid Gland
			[338616] = 3, -- Pulsing Rot-hive
			[297721] = 3, -- Subjugator's Manacles
			[337878] = 3, -- Dark Fortress
			[337585] = 3, -- The Stone Ward
			[337620] = 3, -- Unstable Form
			[305282] = 3, -- Glasswing Charm
			[305274] = 3, -- Dark Armaments
			[339024] = 3, -- Ephemeral Effigy
			[339026] = 3, -- Resonating Effigy
			[332185] = 3, -- Blood-Stained Dagger
			[320937] = 3, -- Detonation Torch
			[320940] = 3, -- Eye of Endereth
			[320931] = 3, -- Glutton's Guise
			[320945] = 3, -- Pact of Infernal Intimacy
			[320941] = 3, -- Soulvoid Bag
			[332206] = 3, -- Tainted Blood Vial
			[320954] = 3, -- Zovaal's Resolution
			-- C Tier Powers
			[338512] = 4, -- Gaze of Death
			[315288] = 4, -- Frostbite Wand
			[299049] = 4, -- Heart of the Forge
			[295754] = 4, -- Purifier's Flame
			[338062] = 4, -- Stoneflesh Figurine
			[334337] = 4, -- Oversized Boots
			[338922] = 4, -- Soulward Clasp
			[306625] = 4, -- Cilice of Denathrius
			[294887] = 4, -- Glutton's Kerchief
			[320955] = 4, -- Art of the Blood Passage
			[320928] = 4, -- Chaotic Effigy
			[320930] = 4, -- Darkwhisper Signet
			[320956] = 4, -- Disembodied Tongue
			[320944] = 4, -- Hellfire Pact
			[320934] = 4, -- Realmlord's Insignia
			[332201] = 4, -- Smoking Shard of Teleportation
			[332762] = 4, -- Void Etched Talisman
			[320957] = 4, -- Warlock's Bargain
			-- D Tier Powers
			[308196] = 5, -- Corruption Antenna
			[285479] = 5, -- Flame Jet
			[308194] = 5, -- Finger of Frozen Fury
			[337728] = 5, -- Kerim's Amulet of Laceration
			[308195] = 5, -- Lightning Dust
			[338596] = 5, -- Defiance of Death
			[295978] = 5, -- Echo of Azeroth
			[338023] = 5, -- Irritating Moth Dust
			[338631] = 5, -- Swarm Form
			[338446] = 5, -- Coffer of Spectral Whispers
			[306615] = 5, -- Roots of the Dreamtree
			[339111] = 5, -- Suffused Noble Writ
			[332775] = 5, -- Bottled Shadow
			[320951] = 5, -- Claw of Endereth
			[332200] = 5, -- Crystal of Perpetual Displacement
			[320950] = 5, -- Sacrificial Vermin
			[320953] = 5, -- Shadowed Shortblade
			[320936] = 5, -- Soul Platter
			[320948] = 5, -- Thirsting Chain
			[320952] = 5, -- Visage of Lethality
			[320949] = 5, -- Whispers of the Jailer
			-- E Tier Powers
			[306609] = 6, -- Disemboweler's Hook
			[337613] = 6, -- Erratic Howler
			[338072] = 6, -- Gruul's Shattered Toenail
			[308193] = 6, -- Lens of Elchaver
			[297576] = 6, -- Tremorbeast Tusk
			[305050] = 6, -- Watchful Lightfly
			[294719] = 6, -- Bottled Enigma
			[305277] = 6, -- Flamestarved Cinders
			[315300] = 6, -- Icy Heartcrust
			[338705] = 6, -- Overgrowth Seedling
			[300771] = 6, -- Blade of the Lifetaker
			[308201] = 6, -- Curious Miasma
			[308203] = 6, -- Crown of Obstinance
			[338029] = 6, -- Shimmering Wingcape
			[338733] = 6, -- Ever-Beating Heart
			[295732] = 6, -- Golden Idol
			[337657] = 6, -- The Fifth Skull
			-- F Tier Powers
			[304996] = 7, -- Frostchipper
			[305006] = 7, -- Scroll of Elchaver
			[304998] = 7, -- Stormcycle Peridot
			[305054] = 7, -- Yel'Shir's Powerglove
			[327761] = 7, -- Negation Well
			[304992] = 7, -- Band of Deep Burns
			[305008] = 7, -- Hematoma Bat
			[337938] = 7, -- Lumbering Form
			[338449] = 7, -- Elongated Skeletal Arms
		},
		[266] = { -- Demonology
			-- S Tier Powers
			-- A Tier Powers
			-- B Tier Powers
			-- C Tier Powers
			-- D Tier Powers
			-- E Tier Powers
			-- F Tier Powers
		},
		[267] = { -- Destruction
			-- S Tier Powers
			-- A Tier Powers
			-- B Tier Powers
			-- C Tier Powers
			-- D Tier Powers
			-- E Tier Powers
			-- F Tier Powers
		},
	},
	[10] = { -- Monk
		[268] = { -- Brewmaster
			-- S Tier Powers
			-- A Tier Powers
			-- B Tier Powers
			-- C Tier Powers
			-- D Tier Powers
			-- E Tier Powers
			-- F Tier Powers
		},
		[269] = { -- Windwalker
			-- S Tier Powers
			-- A Tier Powers
			-- B Tier Powers
			-- C Tier Powers
			-- D Tier Powers
			-- E Tier Powers
			-- F Tier Powers
		},
		[270] = { -- Mistweaver
			-- S Tier Powers
			-- A Tier Powers
			-- B Tier Powers
			-- C Tier Powers
			-- D Tier Powers
			-- E Tier Powers
			-- F Tier Powers
		},
	},
	[11] = { -- Druid
		[102] = { -- Balance
			-- S Tier Powers
			-- A Tier Powers
			-- B Tier Powers
			-- C Tier Powers
			-- D Tier Powers
			-- E Tier Powers
			-- F Tier Powers
		},
		[103] = { -- Feral
			-- S Tier Powers
			-- A Tier Powers
			-- B Tier Powers
			-- C Tier Powers
			-- D Tier Powers
			-- E Tier Powers
			-- F Tier Powers
		},
		[104] = { -- Guardian
			-- S Tier Powers
			-- A Tier Powers
			-- B Tier Powers
			-- C Tier Powers
			-- D Tier Powers
			-- E Tier Powers
			-- F Tier Powers
		},
		[105] = { -- Restoration
			-- S Tier Powers
			-- A Tier Powers
			-- B Tier Powers
			-- C Tier Powers
			-- D Tier Powers
			-- E Tier Powers
			-- F Tier Powers
		},
	},
	[12] = { -- Demon Hunter
		[577] = { -- Havoc
			-- S Tier Powers
			-- A Tier Powers
			-- B Tier Powers
			-- C Tier Powers
			-- D Tier Powers
			-- E Tier Powers
			-- F Tier Powers
		},
		[581] = { -- Vengeance
			-- S Tier Powers
			-- A Tier Powers
			-- B Tier Powers
			-- C Tier Powers
			-- D Tier Powers
			-- E Tier Powers
			-- F Tier Powers
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
								local priority = animaPowers[classId][specId][option.spellID]
								
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