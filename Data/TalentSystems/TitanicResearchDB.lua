local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local TITANICRESEARCH = {
	-- Corrupted Mementos: 1744
	791, -- Orb Operation Manual (Rank 1) (100 CM)
	798, -- Expansive Mind (Rank 1) (150 CM)
	798, -- Expansive Mind (Rank 2) (250 CM)
	798, -- Expansive Mind (Rank 3) (400 CM)
	802, -- Clear Sight (Rank 1) (750 CM)
	802, -- Clear Sight (Rank 2) (900 CM)
	802, -- Clear Sight (Rank 3) (1100 CM)
	805, -- Elite Extermination (Rank 1) (1350 CM)
	806, -- Vision Hunter (Rank 1) (1800 CM)
	806, -- Vision Hunter (Rank 2) (2200 CM)
	806, -- Vision Hunter (Rank 3) (2700 CM)
	792, -- Gift of the Titans (Rank 1) (3300 CM)
	794, -- Singular Sanitation Expertise (Rank 1) (4200 CM)
	794, -- Singular Sanitation Expertise (Rank 2) (4800 CM)
	794, -- Singular Sanitation Expertise (Rank 3) (5500 CM)
	795, -- Emergency Cranial Defibrillation (Rank 1) (6500 CM)
	804, -- Experimental Destabilization (Rank 1) (6500 CM)
	804, -- Experimental Destabilization (Rank 2) (6500 CM)
	804, -- Experimental Destabilization (Rank 3) (6500 CM)
	800, -- Synchronized Mind Stabilizer (Rank 1) (6500 CM)
}

addonTable.TITANICRESEARCH = TITANICRESEARCH