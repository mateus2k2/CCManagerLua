local APIHelperModule = {}

local logFilePath = "/CC/Logs/logs.txt"
local statusFilePath = "/CC/Logs/APIStatus.txt"

function APIHelperModule.getLogs(startingLine)
    local logData = {}
    local file = fs.open(logFilePath, "r")
    if not file then
        return logData
    end

    for _ = 1, startingLine - 1 do
        -- if not file.readLine() then
        --     file.close()
        --     return logData
        -- end
        file.readLine()
    end

    -- Read lines starting from the desired line
    local line = file.readLine()
    while line do
        local success, logEntry = pcall(textutils.unserialiseJSON, line)
        table.insert(logData, logEntry)
        line = file.readLine()
    end

    file.close()
    return logData
end

function APIHelperModule.getStatus()
    local file = fs.open(statusFilePath, "r")
    if not file then
        return nil
    end

    local content = file.readAll()
    file.close()
    return content
end


return APIHelperModule