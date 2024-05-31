local addonName, addon = ...

local colors={["COMMON"]="|cffFFFFFF",["UNCOMMON"]="|cff1EFF00",["RARE"]="|cff0070DD",["EPIC"]="|cffA335EE",["LEGENDARY"]="|cffFF8000",["ARTIFACT"]="|cffE6CC80",["HEIRLOOM"]="|cff00CCFF",["GOLD"]="|cffFFD100"}

addon.ColorText = function(colorCode, text)
    return format("%s%s|r", colors[colorCode], text)
end