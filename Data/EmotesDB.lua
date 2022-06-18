local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local EMOTES = {
	-- gossip: false if we don't want to process
	-- the GOSSIP_SHOW event for a particular NPC.
	-- true, otherwise.
	--
	-- emote: The emote to perform in game.
	[33224]		= { gossip=false, emote="kiss" }, 		-- Lake Frog
	[41539]		= { gossip=false, emote="whistle" }, 	-- Stolen Ram
	[153580]	= { gossip=false, emote="wave" }, 		-- Gor'groth
	[162553] 	= { gossip=true, emote="flex" }, 		-- Runestone of Constructs
	[162559] 	= { gossip=true, emote="kneel" }, 		-- Runestone of Rituals
	[162562] 	= { gossip=true, emote="bleed" }, 		-- Runestone of Plague
	[162584] 	= { gossip=true, emote="sneak" }, 		-- Runestone of Eyes
	[162592] 	= { gossip=true, emote="salute" }, 		-- Runestone of Chosen
}

addonTable.EMOTES = EMOTES