local LHMP = LibStub("LibHelpMePlay")
if not LHMP then
    return false
end

LHMP.Colors = {
    COMMON = "FFFFFF",
    UNCOMMON = "1EFF00",
    RARE = "0070DD",
    EPIC = "A335EE",
    LEGENDARY = "FF8000",
    ARTIFACT = "E6CC80",
    HEIRLOOM = "00CCFF",
    GOLD = "FFD100",
    RED = "FF0000"
}

LHMP.Containers = {
    21746,
    37586,
    54537,
    117392,
    117393,
    117394,
    147573,
    147574,
    147575,
    147576,
    211279,
    216874,
    223908,
    223909,
    223910,
    223911
}

LHMP.Emotes = {
    [153580] = "WAVE"
}

LHMP.RaceFactions = {
    [1] = 1,
    [2] = 0,
    [3] = 1,
    [4] = 1,
    [5] = 0,
    [6] = 0,
    [7] = 1,
    [8] = 0,
    [9] = 0,
    [10] = 0,
    [11] = 1,
    [22] = 1,
    [25] = 1,
    [26] = 0,
    [27] = 0,
    [28] = 0,
    [29] = 1,
    [30] = 1,
    [31] = 0,
    [32] = 1,
    [34] = 1,
    [35] = 0,
    [36] = 0,
    [37] = 1,
    [52] = 1,
    [70] = 0
}

LHMP.RaceClassCombinations = {
    [1] = {1, 2, 3, 4, 5, 6, 8, 9, 10},
    [2] = {1, 3, 4, 5, 6, 7, 8, 9, 10},
    [3] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
    [4] = {1, 3, 4, 5, 6, 8, 9, 10, 11, 12},
    [5] = {1, 3, 4, 5, 6, 8, 9, 10},
    [6] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11},
    [7] = {1, 3, 4, 5, 6, 8, 9, 10},
    [8] = {1, 3, 4, 5, 6, 7, 8, 9, 10, 11},
    [9] = {1, 3, 4, 5, 6, 7, 8, 9, 10},
    [10] = {1, 2, 3, 4, 5, 6, 8, 9, 10, 12},
    [11] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
    [22] = {1, 3, 4, 5, 6, 8, 9, 10, 11},
    [25] = {1, 3, 4, 5, 6, 7, 8, 9, 10},
    [26] = {1, 3, 4, 5, 6, 7, 8, 9, 10},
    [27] = {1, 3, 4, 5, 6, 8, 9, 10},
    [28] = {1, 3, 4, 5, 6, 7, 8, 9, 10, 11},
    [29] = {1, 3, 4, 5, 6, 8, 9, 10},
    [30] = {1, 2, 3, 4, 5, 6, 8, 9, 10},
    [31] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11},
    [32] = {1, 3, 4, 5, 6, 7, 8, 9, 10},
    [34] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
    [35] = {1, 3, 4, 5, 6, 7, 8, 9, 10},
    [36] = {1, 3, 4, 5, 6, 7, 8, 9, 10},
    [37] = {1, 3, 4, 5, 6, 8, 9, 10},
    [52] = {13},
    [70] = {13}
}

LHMP.HeroClasses = {6, 12, 13}

LHMP.PlayerChoices = {
    [234] = 1,
    [688] = 1
}

LHMP.QuestMerchants = {
    [54982] = {
        {
            Index = 1,
            Quantity = 3,
            Conditions = {
                "QUEST_ACTIVE = 29627",
                "QUEST_OBJECTIVE_INCOMPLETE = 29627,3",
            }
        }
    },
    [54981] = {
        {
            Index = 1,
            Quantity = 1,
            Conditions = {
                "QUEST_ACTIVE = 29627",
                "QUEST_OBJECTIVE_INCOMPLETE = 29627,2",
            }
        }
    },
    [73306] = {
        {
            Index = 6,
            Quantity = 1,
            Conditions = {
                "QUEST_ACTIVE = 33343",
                "QUEST_OBJECTIVE_INCOMPLETE = 33343,1",
            }
        }
    },
    [156800] = {
        {
            Index = 1,
            Quantity = 1,
            Conditions = {
                "QUEST_ACTIVE = 55194",
                "QUEST_OBJECTIVE_INCOMPLETE = 55194,1",
            }
        }
    },
    [167213] = {
        {
            Index = 1,
            Quantity = 1,
            Conditions = {
                "QUEST_ACTIVE = 59950",
                "QUEST_OBJECTIVE_INCOMPLETE = 59950,1",
            }
        }
    }
}

LHMP.IgnoredQuests = {
    59583, -- Welcome to Stormwind
    60343, -- Welcome to Orgrimmar
}

-- If the event should use the title from the calendar, then simply
-- omit the <name> property from the event's table below.
--
-- The texture can be an atlas or a texture ID.
LHMP.WorldEvents = {
    [559] = {
        ["dungeonQueueID"] = 744,
        ["texture"] = 630783,
        ["conditions"] = {
            ["minLevel"] = 70,
            ["isForTimerunning"] = false,
        }
    },
    [562] = {
        ["dungeonQueueID"] = 995,
        ["texture"] = 630787,
        ["conditions"] = {
            ["minLevel"] = 70,
            ["isForTimerunning"] = false,
        }
    },
    [587] = {
        ["dungeonQueueID"] = 1146,
        ["texture"] = 630784,
        ["conditions"] = {
            ["minLevel"] = 70,
            ["isForTimerunning"] = false,
        }
    },
    [643] = {
        ["dungeonQueueID"] = 1453,
        ["texture"] = 630786,
        ["conditions"] = {
            ["minLevel"] = 70,
            ["isForTimerunning"] = false,
        }
    },
    [1056] = {
        ["dungeonQueueID"] = 1971,
        ["texture"] = 2838050,
        ["conditions"] = {
            ["minLevel"] = 70,
            ["isForTimerunning"] = false,
        }
    },
    [1263] = {
        ["dungeonQueueID"] = 2274,
        ["texture"] = 1408999,
        ["conditions"] = {
            ["minLevel"] = 70,
            ["isForTimerunning"] = false,
        }
    },
    [423] = {
        ["dungeonQueueID"] = 288,
        ["texture"] = 135450,
        ["conditions"] = {
            ["minLevel"] = 70,
            ["isForTimerunning"] = false,
        }
    },
    [341] = {
        ["dungeonQueueID"] = 286,
        ["texture"] = 368565,
        ["conditions"] = {
            ["minLevel"] = 70,
            ["isForTimerunning"] = false,
        }
    },
    [372] = {
        ["dungeonQueueID"] = 287,
        ["texture"] = 132621,
        ["conditions"] = {
            ["minLevel"] = 70,
            ["isForTimerunning"] = false,
        }
    },
    [324] = {
        ["dungeonQueueID"] = 285,
        ["texture"] = 133661,
        ["conditions"] = {
            ["minLevel"] = 70,
            ["isForTimerunning"] = false,
        }
    },
    [1525] = {
        ["name"] = format("Random Heroic Timerunning Dungeon: %s", EXPANSION_NAME4),
        ["dungeonQueueID"] = 2539,
        ["texture"] = 328269,
        ["conditions"] = {
            ["minLevel"] = 10,
            ["isForTimerunning"] = true,
        }
    }
}

LHMP.Gossips = {
    -------------------------
    -- Game Object Gossips --
    -------------------------
    [0] = {
        {ID = 33294, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31130"}}, -- Cho's "Art" (The Jade Forest)
        {ID = 40006, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29743"}}, -- Ancient Statue (The Jade Forest)
        {ID = 39082, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29743"}}, -- Ancient Statue (The Jade Forest)
        {ID = 39808, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29743"}}, -- Ancient Statue (The Jade Forest)
        {ID = 39083, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29743"}}, -- Ancient Statue (The Jade Forest)
    },
    -------------------------
    -- VANILLA --------------
    -------------------------
    -- Elwynn Forest
    [240] = {{ID = 38407, CanConfirm = false, Conditions = {"LEVEL_LOWER = 10", "QUEST_ACTIVE = 35"}}},
    -- Stormwind City
    [167032] = {{ID = 51901, CanConfirm = false, Conditions = {"CHROMIE_TIME_INACTIVE"}}},
    -- Dungeon: Blackrock Depths
    [9039] = {{ID = 28044, CanConfirm = false, Conditions = {"NONE = NONE"}}},
    -- Raid: Molten Core
    [54404] = {
        {ID = 30419, CanConfirm = false, Conditions = {"NONE = NONE"}},
        {ID = 31924, CanConfirm = false, Conditions = {"NONE = NONE"}},
        {ID = 30449, CanConfirm = false, Conditions = {"NONE = NONE"}}
    },
    -------------------------
    -- THE BURNING CRUSADE --
    -------------------------
    -------------------------
    -- WRATH OF THE LICH KING
    -------------------------
    -- Death Knights
    [28406] = {{ID = 37188, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 12733"}}},
    [29173] = {{ID = 36227, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 12801"}}},
    -------------------------
    -- MISTS OF PANDARIA ----
    -------------------------
    -- Remix
    [216591] = {{ID = 120607, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 79432"}}},
    [217538] = {
        {ID = 120604, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 79440"}},
        {ID = 120948, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 79440"}}
    },
    -- Introduction (Alliance)
    [165505] = {{ID = 54294, CanConfirm = false, Conditions = {"LEVEL_LOWER = 40", "QUEST_ACTIVE = 29548"}}},
    -- Introduction (Horde)
    [3310] = {{ID = 30402, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31853", "QUEST_OBJECTIVE_INCOMPLETE = 31853,1", "LEVEL_LOWER = 30"}}},
    [55054] = {{ID = 41023, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29690"}}},
    -- The Jade Forest
    [66292] = {{ID = 40614, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29548"}}},
    [54763] = {{ID = 39167, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29579"}}},
    [54914] = {
        {ID = 39493, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29620"}},
        {ID = 40364, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29620"}}
    },
    [54944] = {{ID = 40241, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29632"}}},
    [54924] = {{ID = 40594, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29633"}}},
    [54925] = {{ID = 40595, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29634"}}},
    [54926] = {{ID = 40337, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29635"}}},
    [59058] = {{ID = 40616, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29883"}}},
    [54960] = {
        {ID = 40442, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29883"}},
        {ID = 40441, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29894"}}
    },
    [56690] = {{ID = 40617, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29883"}}},
    [56693] = {{ID = 40427, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29883"}}},
    [55343] = {{ID = 40098, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29733"}}},
    [55381] = {
        {ID = 40113, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29726"}},
        {ID = 40114, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29730"}}
    },
    [56434] = {{ID = 40503, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29901"}}},
    [56737] = {{ID = 41374, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29922"}}},
    [55267] = {{ID = 39304, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29716"}}},
    [55368] = {{ID = 39810, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29723"}}},
    [56209] = {{ID = 40636, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29920"}}},
    [56210] = {{ID = 40637, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29920"}}},
    [56206] = {{ID = 40541, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29920"}}},
    [59395] = {{ID = 39183, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30495"}}},
    [59401] = {{ID = 40697, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30495"}}},
    [59397] = {{ID = 39805, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30495"}}},
    [59392] = {
        {ID = 39631, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30495", "QUEST_OBJECTIVE_INCOMPLETE = 30495,4", "LEVEL_LOWER = 30"}},
        {ID = 39632, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30495"}},
        {ID = 39633, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29932"}}
    },
    [59400] = {{ID = 39806, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30495"}}},
    [57242] = {{ID = 40586, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29932"}}},
    [59572] = {{ID = 39293, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30568"}}},
    [59563] = {{ID = 39488, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30568"}}},
    [64244] = {{ID = 38770, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31303"}}},
    [55141] = {{ID = 39490, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29694"}}},
    [55162] = {{ID = 39687, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29694"}}},
    [55146] = {{ID = 39686, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29694"}}},
    [55170] = {{ID = 39688, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29694"}}},
    [67090] = {{ID = 41782, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31778"}}},
    [65974] = {{ID = 41756, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31778"}}},
    [56340] = {{ID = 40184, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29941"}}},
    [56336] = {{ID = 40464, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29941"}}},
    [56478] = {{ID = 40187, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29941"}}},
    [56477] = {{ID = 40186, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29941"}}},
    [55688] = {{ID = 39795, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29823"}}},
    [56525] = {{ID = 40650, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29967"}}},
    [60952] = {{ID = 34466, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30015", "LEVEL_LOWER = 30"}}},
    [54959] = {{ID = 40054, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29903"}}},
    [56585] = {{ID = 40057, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29903"}}},
    [56592] = {{ID = 40154, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29903"}}},
    [56591] = {
        {ID = 40056, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29903"}},
        {ID = 40060, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29903"}}
    },
    [59727] = {{ID = 28345, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30499", "LEVEL_LOWER = 30"}}},
    [59305] = {{ID = 40695, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30484"}}},
    [56841] = {{ID = 40230, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30484"}}},
    [56838] = {{ID = 40583, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30484"}}},
    [56840] = {{ID = 40301, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30484"}}},
    [64207] = {{ID = 28426, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30485", "LEVEL_LOWER = 30"}}},
    [59899] = {{ID = 29679, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30648", "LEVEL_LOWER = 30"}}},
    -- Valley of the Four Winds
    [56133] = {
        {ID = 40440, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29919"}},
        {ID = 40423, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29952"}},
        {ID = 39238, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30078"}}
    },
    [56113] = {{ID = 40669, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29577"}}},
    [56474] = {
        {ID = 40623, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30051"}},
        {ID = 40622, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30172"}}
    },
    [62377] = {
        {ID = 36036, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30053"}},
        {ID = 36034, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30050"}}
    },
    [62385] = {{ID = 35295, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30053"}}},
    [57385] = {
        {ID = 40211, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30053"}},
        {ID = 40209, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30052"}}
    },
    [57123] = {{ID = 40362, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29982"}}},
    [57124] = {{ID = 40362, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29982"}}},
    [57126] = {{ID = 40473, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29982"}}},
    [57127] = {{ID = 40261, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29982"}}},
    [57121] = {{ID = 40474, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29982"}}},
    [57122] = {{ID = 40508, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29982"}}},
    [57120] = {
        {ID = 40360, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29982"}},
        {ID = 40361, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29982"}}
    },
    [56714] = {
        {ID = 41438, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29984"}},
        {ID = 41439, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29987"}},
        {ID = 41440, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29989"}}
    },
    [58461] = {{ID = 40247, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30186"}}},
    [59857] = {{ID = 39267, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30627"}}},
    [56192] = {
        {ID = 40435, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29912"}},
        {ID = 40431, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29912"}},
        {ID = 40430, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 29912"}}
    },
    -- Krasarang Wilds
    [58376] = {
        {ID = 40644, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30082"}},
        {ID = 40648, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30082"}}
    },
    [59151] = {{ID = 41038, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30178"}}},
    [55597] = {{ID = 39799, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30347"}}},
    [58547] = {{ID = 40208, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30269"}}},
    [59653] = {{ID = 39489, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30273"}}},
    [58976] = {{ID = 40353, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30359"}}},
    -- Kun-Lai Summit
    [60980] = {{ID = 33096, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30881"}}},
    [60979] = {{ID = 37429, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30881"}}},
    [60997] = {{ID = 37075, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30883"}}},
    [61004] = {{ID = 37431, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30907"}}},
    [61006] = {{ID = 37430, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30907"}}},
    [61007] = {{ID = 37432, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30907"}}},
    [61566] = {{ID = 35732, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30967"}}},
    [60973] = {{ID = 38108, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30480"}}},
    [63754] = {{ID = 41284, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30512"}}},
    [63542] = {{ID = 41467, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30512"}}},
    [60189] = {{ID = 37051, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30682"}}},
    [60190] = {{ID = 37052, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30682"}}},
    [60187] = {{ID = 35293, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30682"}}},
    [59818] = {
        {ID = 33656, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30601"}},
        {ID = 33655, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30601"}}
    },
    [60795] = {{ID = 40517, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30829"}}},
    [61382] = {{ID = 30224, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30935"}}},
    [61380] = {{ID = 30226, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30935"}}},
    [61417] = {{ID = 38585, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30944"}}},
    [61381] = {{ID = 38591, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30944"}}},
    [62629] = {{ID = 40352, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30946"}}},
    [60587] = {{ID = 34810, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30747"}}},
    [61512] = {{ID = 29681, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30724"}}},
    [61454] = {{ID = 30541, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30994"}}},
    [61819] = {
        {ID = 29128, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30993"}},
        {ID = 29129, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30993"}}
    },
    [62220] = {{ID = 41432, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30752"}}},
    [64848] = {{ID = 41177, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31512"}}},
    -- Townlong Steppes
    [60899] = {{ID = 32679, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30774"}}},
    [60864] = {{ID = 37073, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30827"}}},
    [60857] = {{ID = 35731, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30815"}}},
    [61378] = {{ID = 40590, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30890"}}},
    [61395] = {{ID = 37625, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30890"}}},
    [61397] = {{ID = 37888, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30890"}}},
    [61396] = {{ID = 37889, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 30890"}}},
    -- Dread Wastes
    [62202] = {
        {
            ID = 35586,
            CanConfirm = false,
            Conditions = {"QUEST_ACTIVE = 31006", "QUEST_OBJECTIVE_INCOMPLETE = 31006,1", "LEVEL_LOWER = 30"}
        }
    },
    [62538] = {
        {
            ID = 35587,
            CanConfirm = true,
            Conditions = {"QUEST_ACTIVE = 31007", "QUEST_OBJECTIVE_INCOMPLETE = 31007,1", "LEVEL_LOWER = 30"}
        }
    },
    [63876] = {{ID = 28603, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31091"}}},
    [62667] = {{ID = 35828, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31129"}}},
    [62845] = {{ID = 35823, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31129"}}},
    [62666] = {{ID = 35825, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31129"}}},
    [62771] = {{ID = 40853, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31084"}}},
    [64259] = {{ID = 40852, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31189"}}},
    [62151] = {{ID = 33893, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 31211"}}},
    [155707] = {{ID = 49933, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 56617"}}},
    -- Vale of Eternal Blossoms
    [78709] = {
        {ID = 42526, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32806"}},
        {ID = 42524, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32807"}}
    },
    -- Landfall Campaign (Alliance)
    [67940] = {{ID = 121752, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32248"}}},
    [68526] = {
        {ID = 41352, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32380"}},
        {ID = 41353, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32381"}},
        {ID = 41354, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32381"}},
        {ID = 41355, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32381"}}
    },
    [68539] = {{ID = 41359, CanConfirm = false, Conditions = {"HAS_ITEM = 92977"}}},
    [68537] = {{ID = 41404, CanConfirm = false, Conditions = {"HAS_ITEM = 92975"}}},
    [68540] = {{ID = 41361, CanConfirm = false, Conditions = {"HAS_ITEM = 92976"}}},
    [68741] = {
        {ID = 41244, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32382"}},
        {ID = 41242, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32193"}},
        {ID = 41241, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32315"}},
        {ID = 41240, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32370"}},
        {ID = 41239, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32393"}},
        {ID = 41237, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32355"}},
        {ID = 41236, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32400"}}
    },
    [68108] = {
        {ID = 41503, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32362"}},
        {ID = 40954, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32362"}},
        {ID = 40956, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32362"}}
    },
    [67848] = {{ID = 40720, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32414"}}},
    [68651] = {{ID = 40723, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32460"}}},
    [68687] = {{ID = 41763, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32423"}}},
    [68004] = {
        {ID = 41051, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32321"}},
        {ID = 41925, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32321"}}
    },
    [68130] = {{ID = 41837, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32334"}}},
    [68545] = {{ID = 40881, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32336"}}},
    -- Isle of Thunder Campaign (Alliance)
    [70360] = {{ID = 41772, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32681"}}},
    [70370] = {{ID = 41766, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32644"}}},
    [67992] = {
        {ID = 41768, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32654"}},
        {ID = 41767, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32652"}},
        {ID = 41765, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32656"}}
    },
    [69949] = {{ID = 41587, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32654"}}},
    [69810] = {{ID = 41898, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32652"}}},
    [70297] = {{ID = 41662, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32655"}}},
    [69615] = {{ID = 42150, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 32656"}}},
    -- Timeless Isle
    [73306] = {{ID = 41556, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 33343", "QUEST_OBJECTIVE_INCOMPLETE = 33343,1"}}},
    -------------------------
    -- WARLORDS OF DRAENOR --
    -------------------------
    -- Raid: Highmaul
    [84971] = {{ID = 43135, CanConfirm = false, Conditions = {"NONE = NONE"}}},
    -------------------------
    -- LEGION ---------------
    -------------------------
    -- Dalaran
    [99210] = {{ID = 44840, CanConfirm = false, Conditions = {"NONE = NONE"}}},
    [99182] = {{ID = 44787, CanConfirm = false, Conditions = {"NONE = NONE"}}},
    -- Demon Hunters
    [99914] = {{ID = 45047, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 40379"}}},
    [99915] = {
        {ID = 45048, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 38765"}},
        {ID = 45101, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 38765"}}
    },
    [93693] = {{ID = 44410, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 38813"}}},
    [94435] = {{ID = 44865, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 38813"}}},
    [90247] = {{ID = 42930, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 38813"}}},
    [96436] = {{ID = 45064, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 39262"}}},
    [96655] = {{ID = 44405, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 39516"}}},
    [93127] = {{ID = 44408, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 39516"}}},
    [99045] = {{ID = 44442, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 39516"}}},
    [96420] = {{ID = 44440, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 39516"}}},
    [96652] = {{ID = 44661, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 39516"}}},
    [96653] = {{ID = 44646, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 39663"}}},
    [97644] = {{ID = 44913, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 40373"}}},
    [100429] = {{ID = 45043, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 44463"}}},
    -------------------------
    -- SHADOWLANDS ----------
    -------------------------
    -- Exile's Reach
    [153211] = {{ID = 49526, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 55763"}}},
    [162998] = {
        {ID = 51269, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 58923"}},
        {ID = 51271, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 58923"}}
    },
    [156943] = {{ID = 50819, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 55981"}}},
    [161350] = {{ID = 51352, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 55992"}}},
    [154169] = {{ID = 51396, CanConfirm = false, Conditions = {"NONE = NONE"}}},
    [162943] = {
        {ID = 51265, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 58915"}},
        {ID = 51265, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59972"}}
    },
    [156886] = {
        {ID = 51802, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59354"}},
        {ID = 51803, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59355"}}
    },
    [161666] = {
        {ID = 49525, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 60168"}},
        {ID = 49523, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 60168", "QUEST_OBJECTIVE_INCOMPLETE = 60168,3"}}
    },
    [164835] = {{ID = 51237, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59347"}}},
    [162972] = {
        {ID = 51266, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 58917"}},
        {ID = 51267, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 58917"}}
    },
    [163209] = {{ID = 51202, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 58962"}}},
    [167298] = {{ID = 52949, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59944"}}},
    [167179] = {
        {ID = 52641, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59958"}},
        {ID = 52643, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59958"}}
    },
    [167598] = {{ID = 54297, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59978"}}},
    [167663] = {{ID = 52784, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59984"}}},
    [168431] = {{ID = 51745, CanConfirm = false, Conditions = {"NONE = NONE"}}},
    [167309] = {
        {ID = 52664, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59952"}},
        {ID = 52665, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59955"}}
    },
    [167215] = {
        {ID = 52668, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 60162"}},
        {ID = 52666, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 60162", "QUEST_OBJECTIVE_INCOMPLETE = 60162,3"}}
    },
    [167184] = {
        {ID = 52644, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59967"}},
        {ID = 52645, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59967"}}
    },
    [167537] = {{ID = 52640, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59956"}}},
    [167478] = {{ID = 52639, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 59970"}}},
    -------------------------
    -- DRAGONFLIGHT ---------
    -------------------------
    -- The Harbinger Questline
    [214615] = {{ID = 120217, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 79009"}}},
    [215142] = {{ID = 120247, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 79011"}}},
    [215157] = {{ID = 120248, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 79011"}}},
    [215158] = {{ID = 120249, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 79011"}}},
    [214657] = {{ID = 120568, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 79021"}}},
    -- Evokers
    [182317] = {{ID = 54978, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 65060"}}},
    [184165] = {{ID = 51921, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 65071"}}},
    [182258] = {{ID = 55597, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 65701"}}},
    [182610] = {{ID = 51849, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 65100"}}},
    [182611] = {{ID = 51850, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 65100"}}},
    -------------------------
    -- THE WAR WITHIN -------
    -------------------------
    -- Pre-Patch Questline
    [213624] = {{ID = 120882, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 78715"}}},
    [214669] = {{ID = 121542, CanConfirm = false, Conditions = {"QUEST_ACTIVE = 80500"}}},
    -------------------------
    -- MIDNIGHT -------------
    -------------------------
    -------------------------
    -- THE LAST TITAN -------
    -------------------------
}