local addonName, HelpMePlay = ...

-- This function can take any number of tables and
-- merge them into one table.
HelpMePlay.MergeTables = function(...)
    local mergedTable = {}
    for i = 1, select("#", ...) do
        local tbl = select(i, ...)
        if (#tbl > 0) then
            for k, v in pairs(tbl) do
                mergedTable[k] = v
            end
        end
    end
    return mergedTable
end