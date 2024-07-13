local LHMP = LibStub("LibHelpMePlay")
if not LHMP then return end

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
    [691] = {
        ["dungeonQueueID"] = 1515,
        ["texture"] = 357813,
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