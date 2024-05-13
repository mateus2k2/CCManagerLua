local APIHelperModule = {}

local logFilePath = "/CC/Logs/logs.txt"
local statusFilePath = "/CC/Logs/APIStatus.txt"

function APIHelperModule.getLogs()
    local logData = {}
    local file = fs.open(logFilePath, "r")
    if not file then
        return logData
    end

    local line = file.readLine()
    while line do
        local success, logEntry = pcall(textutils.unserialiseJSON, line)
        table.insert(logData, logEntry)
        line = file.readLine()
    end

    file.close()
    return logData
end

local function readFile()
    local file = fs.open(statusFilePath, "r")
    if not file then
        return nil
    end

    local content = file.readAll()
    file.close()
    return content
end


return APIHelperModule