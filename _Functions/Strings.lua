local addonName, addon = ...

-- Split a string based on a given separator and return
-- the nth value from the string.
addon.SplitString = function(str, separator, nth)
    local strings = {}
    local pattern = ("([^%s]+)"):format(separator)
    for string in str:gmatch(pattern) do
        table.insert(strings, string)
    end

    if tonumber(strings[nth]) then
        return tonumber(strings[nth])
    end
    return strings[nth]
end