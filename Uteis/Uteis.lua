local uteisModule = {}

local function printTable(tbl, indent)
    indent = indent or 0
    for key, value in pairs(tbl) do
        if type(value) == "table" then
            print(string.rep("  ", indent) .. key .. " : ")
            printTable(value, indent + 1)
        else
            print(string.rep("  ", indent) .. key .. " : " .. tostring(value))
        end
    end
end

function tableToString(tbl)
    if tbl == nil then return "" end

    local result = "{"

    local function convert(t)
        for k, v in pairs(t) do
            result = result .. " " .. tostring(k) .. " = "

            if type(v) == "table" then
                result = result .. tableToString(v)
            else
                result = result .. tostring(v)
            end
            
            result = result .. ","
        end
    end
    convert(tbl)
    result = result:sub(1, -2) -- Remove the last comma
    result = result .. "}"
    return result
end

local function breakString(str, size)
    local chunks = {}
    
    for i = 1, #str, size do
        table.insert(chunks, str:sub(i, i + (size-1)))
    end

    return chunks
end

return {
    breakString = breakString,
    tableToString = tableToString,
    printTable = printTable
}