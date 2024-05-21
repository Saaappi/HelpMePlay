local addonName, addon = ...

-- This function can take any number of tables and
-- merge them into one table.
addon.MergeTables = function(...)
    local mergedTable = {}
    for _, tbl in ipairs(...) do
        for k, v in pairs(tbl) do
            mergedTable[k] = v
        end
    end
    return mergedTable
end