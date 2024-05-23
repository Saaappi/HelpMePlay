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

-- If the string is longer than 15 characters, then truncate
-- it.
addon.TruncateString = function(str)
    if str:len() <= 15 then
		return str
	end
    return str:sub(1, 15) .. "..."
end