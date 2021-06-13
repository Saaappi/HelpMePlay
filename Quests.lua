local addonName, t = ...;

local quests = {
	-- Orgrimmar
	["Warlords of Draenor: The Dark Portal"] = 34398,
	-- Assault on the Dark Portal
	["Azeroth's Last Stand"] = 35933,
	["Onslaught's End"] = 34392,
	["The Portal's Power"] = 34393,
	["The Cost of War"] = 34420,
	["Blaze of Glory"] = 34422,
	["Bled Dry"] = 34421,
	["Vengeance for the Fallen"] = 35241,
	["Altar Altercation"] = 34423,
	["The Kargathar Proving Grounds"] = 34425,
	["A Potential Ally"] = 34427,
	["Kill Your Hundred"] = 34429,
	["Masters of Shadow"] = 34737,
	["The Shadowmoon Clan"] = 34739,
	["Yrel"] = 34740,
	["Keli'dan the Breaker"] = 34741,
	["Prepare for Battle"] = 35005,
	["The Battle of the Forge"] = 34439,
	["Ga'nar of the Frostwolf"] = 34442,
	["The Gunpowder Plot"] = 34987,
	["The Shadow of the Worldbreaker"] = 34958,
	["Polishing the Iron Throne"] = 34925,
	["The Prodigal Frostwolf"] = 34437,
	["Taking a Trip to the Top of the Tank"] = 35747,
	["A Taste of Iron"] = 34445,
	["The Home Stretch"] = 34446,
	-- Frostfire Ridge
	["The Home of the Frostwolves"] = 33868,
	["A Song of Frost and Fire"] = 33815,
	["Of Wolves and Warriors"] = 34402,
	["For the Horde!"] = 34364,
	["Back to Work"] = 34375,
	["A Gronnling Problem"] = 34592,
	["The Den of Skog"] = 34765,
	["Establish Your Garrison"] = 34378,
	["What We Need"] = 34822,
	["What We Got"] = 37824,
	["Build Your Barracks"] = 34461,
	["We Need An Army"] = 34861,
	["Winds of Change"] = 34462,
	["Mission Probable"] = 34775,
	-- Silverpine Forest
	["The Warchief Cometh"] = 26965,
	["Warchief's Command: Hillsbrad Foothills!"] = 28089,
	["Guts and Gore"] = 26995,
	["The Gilneas Liberation Front"] = 26989,
	["Agony Abounds"] = 26992,
	["Iterating Upon Success"] = 26998,
	["Dangerous Intentions"] = 27039,
	["Waiting to Exsanguinate"] = 27045,
	["Belmont's Report"] = 27056,
	["The Warchief's Fleet"] = 27065,
	["Steel Thunder"] = 27069,
	["Give 'em Hell!"] = 27073,
	["Playing Dirty"] = 27082,
	["It's Only Poisonous if You Ingest It"] = 27088,
	["Lost in the Darkness"] = 27093,
	["Skitterweb Menace"] = 27095,
	["Deeper into Darkness"] = 27094,
	["Orcs are in Order"] = 27096, -- Flight Path
	["Rise, Forsaken"] = 27097,
	["No Escape"] = 27099,
	["Lordaeron"] = 27098,
	["Honor the Dead"] = 27180,
	["Hair of the Dog"] = 27226,
	["Reinforcements from Fenris"] = 27231,
	["Excising the Taint"] = 27181,
	["Seek and Destroy"] = 27193,
	["Cornered and Crushed!"] = 27194,
	["Nowhere to Run"] = 27195,
	["The Waters Run Red..."] = 27232,
	["To Forsaken Forward Command"] = 27290,
	["In Time, All Will Be Revealed"] = 27342,
	["Losing Ground"] = 27333,
	["The F.C.D."] = 27345,
	["Korok the Colossus"] = 27322,
	["Break in Communications: Dreadwatch Outpost"] = 27349,
	["Break in Communications: Rutsak's Outpost"] = 27350,
	["Vengeance for Our Soldiers"] = 27360,
	["On Whose Orders?"] = 27364,
	["What Tomorrow Brings"] = 27401,
	["Fall Back!"] = 27405,
	["A Man Named Godfrey"] = 27406,
	["Resistance is Futile"] = 27423,
	["The Great Escape"] = 27438,
	["Rise, Godfrey"] = 27472,
	["Breaking the Barrier"] = 27474,
	["Unyielding Servitors"] = 27475,
	["Dalar Dawnweaver"] = 27476,
	["Relios the Relic Keeper"] = 27478,
	["Practical Vengeance"] = 27483,
	["Ley Energies"] = 27480,
	["Only One May Enter"] = 27484,
	["Transdimensional Warfare: Chapter I"] = 27512,
	["A Wolf in Bear's Clothing"] = 27510,
	["Transdimensional Warfare: Chapter II"] = 27513,
	["Transdimensional Warfare: Chapter III"] = 27518,
	["Taking the Battlefront"] = 27542,
	["Pyrewood's Fall"] = 27550,
	["Lessons in Fear"] = 27548,
	["Of No Consequence"] = 27547,
	["I Never Forget a Face"] = 27574,
	["From the Belly of the Beast"] = 27575,
	["7th Legion Battle Plans"] = 27577,
	["Sowing Discord"] = 27580,
	-- Hillsbrad Foothills
	["Welcome to the Machine"] = 28096,
	["Trouble at Azurelode"] = 28111,
	["Glorious Harvest"] = 28114,
	["Past Their Prime"] = 28115,
	["Human Infestation"] = 28138,
	["Thieving Little Monsters!"] = 28144,
	["Coastal Delicacies"] = 28146,
	["Muckgill's Flipper or Something..."] = 28154,
	["Deep Mine Rescue"] = 28156,
	["Trouble at the Sludge Fields"] = 28168,
	["No One Here Gets Out Alive"] = 28192,
	["Discretion is Key"] = 28197,
	["For Science!"] = 28199,
	["The Battle for Hillsbrad"] = 28196,
	["Do the Right Thing"] = 28189,
	["Little Girl Lost"] = 28206,
	["Freedom for Lydon"] = 28209,
	["Protocol"] = 28230,
	["Do it for Twinkles"] = 28231,
	["Burnside Must Fall"] = 28235,
	["A Blight Upon the Land"] = 28237,
	["Trouble at Southshore"] = 28251,
	["Studies in Lethality"] = 28324,
	["Green Living"] = 28325,
	["Helcular's Rod Giveth..."] = 28331,
	["Helcular's Command"] = 28332,
	["Angry Scrubbing Bubbles"] = 28329,
	["Trail of Filth"] = 28330,
	["Can You Smell What the Lok'tar is Cooking?"] = 28344,
	["*Gurgle* HELP! *Gurgle*"] = 28345,
	["Stormpike Rendezvous"] = 28348,
	["Preemptive Strike"] = 28356,
	["Kasha Will Fly Again"] = 28354,
	["Terrible Little Creatures"] = 28355,
	["The Road to Purgation"] = 28375,
	-- Tirisfal Glades
	["After the Crusade"] = 26930,
	["Foxes and Hounds"] = 26931,
	["Foes Before Hoes"] = 26933,
	["Latent Disease"] = 26934,
	["Who Needs Cauldrons?"] = 26978,
	["The Menders' Stead"] = 26952,
	-- Western Plaguelands
	["Scourge First... Alliance Later"] = 26921,
	["The Endless Flow"] = 26922,
	["War Machines"] = 26923,
	["Scholomancer"] = 26924,
	["Araj the Summoner"] = 26925,
	["Brute Strength"] = 27117,
	["Victory, For Now"] = 26926,
	["A New Era for the Plaguelands"] = 26999,
	["I Ain't Sayin' You a Gourd-Digger..."] = 26956,
	["Zen'Kiki, the Druid"] = 26953,
	["A Different Approach"] = 26954,
	["Northridge Lumber Mill"] = 26935,
	["Learning the Ropes"] = 27000,
	["Too Close for Comfort"] = 27013,
	["This Means WAR (Wild Arachnid Roundup)"] = 27001,
	["Redpine Thievery"] = 27011,
	["A Gnoll's Resolve"] = 27012,
	-- Northern Barrens
	["In Defense of Far Watch"] = 871,
	["The Far Watch Offensive"] = 872,
	["Plainstrider Menace"] = 844,
	["Through Fire and Flames"] = 13878,
	["Supplies for the Crossroads"] = 5041,
	["Crossroads Caravan Pickup"] = 13949,
	["Drag it Out of Them"] = 13961,
	["The Grol'dom Militia"] = 13973,
	["Consumed by Hatred"] = 899,
	["By Hook Or By Crook"] = 13963,
	["The Tortusk Takedown"] = 13968,
	["Grol'dom's Missing Kodo"] = 13969,
	["Animal Services"] = 13970,
	["The Kodo's Return"] = 13971,
	["Crossroads Caravan Delivery"] = 13975,
	["The Zhevra"] = 845,
	["Hunting the Huntress"] = 903,
	["Echeyakee"] = 881,
	["Into the Raptor's Den"] = 905,
	["The Purloined Payroll"] = 13991,
	["The Forgotten Pools"] = 870,
	["Kolkar Leaders"] = 850,
	["A Little Diversion"] = 13992,
	["A Growing Problem"] = 13988,
	["The Stagnant Oasis"] = 877,
	["King of Centaur Mountain"] = 13995,
	["Altered Beings"] = 880,
	["Flushing Out Verog"] = 14072,
	["Verog the Dervish"] = 851,
	["Deathgate's Reinforcements"] = 14073,
	["Fungal Spores"] = 848,
	["In Fungus We Trust"] = 13998,
	["Who's Shroomin' Who?"] = 13999,
	["Centaur Bracers"] = 855,
	["Hezrul Bloodmark"] = 852,
	["Counterattack!"] = 4021,
	["Investigate the Wreckage"] = 14066,
	["To Track a Thief"] = 869,
	["The Stolen Silver"] = 14067,
	["Waptor Twapping"] = 14068,
	["Find Baron Longshore"] = 14045,
	["The Baron's Demands"] = 14046,
	["A Most Unusual Map"] = 14049,
	["Gazlowe's Fortune"] = 14050,
	["Raging River Ride"] = 26769,
	["Club Foote"] = 14034,
	["Love it or Limpet"] = 14038,
	["Ammo Kerblammo"] = 14042,
	["A Captain's Vengeance"] = 891,
	["Take it up with Tony"] = 14052,
	["Glomp is Sitting On It"] = 14056,
	["Guns. We Need Guns."] = 14057,
	["Mutiny, Mon!"] = 14063,
	["Southsea Freebooters"] = 887,
	["WANTED: Cap'n Garvey"] = 895,
	["It's Gotta be the Horn"] = 865,
	["Samophlange"] = 29021,
	["Competition Schmompetition"] = 29086,
	["Samophlange Repair"] = 14003,
	["Wenikee Boltbucket"] = 29026,
	["Nugget Slugs"] = 29027,
	["A Burning Threat"] = 29090,
	["Return to Samophlanger"] = 14004,
	["Read the Manual"] = 14006,
	["Miner's Fortune"] = 29015,
	["Ignition"] = 858,
	["The Escape"] = 863,
	["Sludge Investigation"] = 29087,
	["Hyena Extermination"] = 29088,
	["Sludge Beast!"] = 29089,
	["The Short Way Home"] = 29094,
	["Harpy Raiders"] = 867,
	["Harpy Lieutenants"] = 875,
	["Serena Bloodfeather"] = 876,
	["Report to Thork"] = 29095,
	["Mor'shan Caravan Pick-Up"] = 29109,
	["Mor'shan Caravan Rescue"] = 29110,
	["Demon Seed"] = 29112,
	["Mor'shan Caravan Delivery"] = 29111,
	-- Ashenvale
	["We're Here to Do One Thing, Maybe Two..."] = 25945,
	-- Stonetalon Mountains
	["Barrier to Entry"] = 25999,
	["Lessons from the Lost Isles"] = 26003,
	["The Missing Blastgineer"] = 26001,
	["Alliance Attack Plans"] = 26002,
	["Krom'gar Fortress"] = 26004,
	["Ashes to Ashes"] = 26010,
	["Might of the Krom'gar"] = 28084,
	["Seek and Destroy"] = 26009,
	["Dream of a Better Tomorrow"] = 26026,
	["Enemy of the Horde: Marshal Paltrow"] = 26011,
	["BEWARE OF CRAGJAW!"] = 26043,
	["Mr. D's Wild Ride"] = 26028,
	["Orders from Base Camp"] = 26016,
	["Report to Bombgutz"] = 26020,
	["Where Are the Parts?"] = 26044,
	["I Got Your Parts Right Here..."] = 26045,
	["Between a Rock and a Hard Place"] = 26046,
	["And That's Why They Call Them Peons..."] = 26047,
	["Spare Parts Up In Here!"] = 26048,
	["In Defense of Krom'gar Fortress"] = 26058,
	["Eyes and Ears: Malaka'jin"] = 26059,
	["The Queen and Her Court"] = 26063,
	["Da Voodoo: Stormer Heart"] = 26060,
	["Da Voodoo: Ram Horns"] = 26061,
	["Fight On Their Stomachs"] = 26064,
	["Da Voodoo: Resonite Crystal"] = 26062,
	["Jin'Zil's Blessing"] = 26067,
	["Nura Pathfinder"] = 26069,
	["Reinforcements..."] = 26066,
	["Kobold Fury!"] = 26068,
	["All's Quiet on the Southern Front"] = 26073,
	["Beginning of the End"] = 26074,
	["The Turd Problem"] = 26075,
	["Spy Infestation"] = 26076,
	["Final Delivery"] = 26077,
	["To Battlescar!"] = 26082,
	["Proof of Lies"] = 26097,
	["Betrayal at the Grove"] = 26098,
	["Is This Justice?"] = 26099,
	["The General is Dead"] = 26100,
	-- Southern Barrens
	["Clear the High Road"] = 24504,
	["Warriors' Redemption"] = 24512,
	["Feeding the Fear"] = 25284,
	["Holdout at Hunter's Hill"] = 24505,
	["Eye for an Eye"] = 24513,
	["Raptor Scraps"] = 24514,
	["Put the Fear in Them"] = 24517,
	["The Low Road"] = 24518,
	["Stalling the Survey"] = 24519,
	["Signals in the Sky"] = 24515,
	["Keeping the Dogs at Bay"] = 24525,
	["Bad to Worse"] = 24529,
	["When Plants Attack"] = 24539,
	["A Curious Bloom"] = 24542,
	["Speaking Their Language"] = 24534,
	["A Family Divided"] = 24543,
	["Biological Intervention"] = 24565,
	["Adder Subtraction"] = 24570,
	["Lashvine Seeds"] = 24571,
	["Sowing a Solution"] = 24566,
	["To Harvest Chaos"] = 24574,
	["The Nightmare Scar"] = 24601,
	["Winnoa Pineforest"] = 24807,
	["Lion's Pride"] = 24552,
	["Meet the New Boss"] = 24551,
	["A Line in the Dirt"] = 24546,
	["Siegebreaker"] = 24569,
	["Honoring the Dead"] = 24573,
	["Taking Back Taurajo"] = 24572,
	["Desolation Hold Inspection"] = 24577, -- Flight Path
	["Changing of the Gar'dul"] = 24591,
	["Parts-is-Parts"] = 24619,
	["Hearts-is-Hearts"] = 24620,
	["Smarts-is-Smarts"] = 24621,
	["Claim the Battle Scar"] = 24618,
	["Silithissues"] = 24654,
	["Firestone Point"] = 24667,
	["Intelligence Warfare"] = 24634,
	["The Butcher of Taurajo"] = 24637,
	["Flightmare"] = 24631,
	["Tauren Vengeance"] = 24632,
	["The Disturbed Earth"] = 24824,
	["Concern for Mankrik"] = 24604,
	["Mahka's Plea"] = 24633,
	["Don't Stop Bereavin'"] = 24603,
	["Mangletooth"] = 24608,
	["Blood of the Barrens"] = 24606,
	["Echoes of Agamaggan"] = 24653,
	["A Weezil in the Henhouse"] = 24684,
	["Dwarf Fortress"] = 24685,
	["Sabotage!"] = 24747,
	["Next of Kin"] = 25292,
	-- Dustwallow Marsh
	["The Black Shields"] = 27254,
	["Suspicious Hoofprints"] = 27259,
	["Lieutenant Paval Reethe"] = 27260,
	["Theramore Spies"] = 1201,
	["The Theramore Docks"] = 1202,
	["The Hermit of Witch Hill"] = 27182,
	["A Shambling Threat"] = 26682,
	["Darkmist Extermination"] = 25051,
	["SMASH BROODQUEEN"] = 27229,
	["The Black Shield"] = 27255,
	["Twilight of the Dawn Runner"] = 9437,
	["The Lost Report"] = 27244,
	["Marsh Frog Legs"] = 27183,
	["What's Haunting Witch Hill?"] = 27188,
	["The Witch's Bane"] = 27189,
	["Jarl Needs Eyes"] = 27184,
	["Hungry as an Ogre!"] = 27191,
	["Jarl Needs a Blade"] = 27186,
};

local questCinematics = {
	[34398] = true;
	[34393] = true;
	[34423] = true;
	[34429] = true;
	[34741] = true;
	[34445] = true;
};

t.quests = quests;
t.questCinematics = questCinematics;