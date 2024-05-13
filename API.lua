local uteisModule = require("/CC/Uteis/Uteis") 

local serverURL = "http://localhost:5015"
local apiToken = "token"

local logFilePath = "/CC/Logs/logs.txt"
local statusFilePath = "/CC/Logs/APIStatus.txt"

local APIModules = {}

local function writeLog(log)
    local file = fs.open(logFilePath, "a")
    file.writeLine(textutils.serialiseJSON(log))
    file.close()
end

local function handleRequest(request)
    local responseObj = nil
    local body = request.body
    local id = request.id

    if id and body and body.type then 
        if APIModules[body.type] then
            responseObj = APIModules[body.type].handleRequest(body) 
        else
            responseObj = {result = "ERROR", errorType = "type not found"}
        end

        if responseObj.result == "ERROR" then 
            writeLog({ERROR = "Error processing request = " .. textutils.serialiseJSON(responseObj.errorType)})
        else
            writeLog({SUCCESS = "Got valid result processing request = " .. textutils.serialiseJSON(responseObj)})
        end

    else
        writeLog({ERROR = "Error in the main handleRequest. Missing request.id or request.body.type or request.body"})
        responseObj = {result = "ERROR", errorType="Error in the main handleRequest. Missing request.id or request.body.type or request.body"}
    end

    local responseStr = textutils.serialiseJSON(responseObj)
    local url = serverURL .. "/makeResponse/" .. id
    local headers = { ["Content-Type"] = "application/json", ["Authorization"] = apiToken}
    local response = http.post(url, responseStr, headers)

    if response then
        writeLog({SUCCESS = "Responded to: " .. tostring(id) .. " Got: " .. (response.readAll())})
        response.close()
    else
        writeLog({ERROR = "Error in response: " .. tostring(id)})
    end
end

local function status()
    local headers = { ["Authorization"] = apiToken}
    request = http.get(serverURL .. "/status", headers)
    if request then 
        request.close()
        return "OK" 
    else
        return "DOWN"
    end
end

local function startAPI(APIModulesToLoad)
    APIModules = APIModulesToLoad

    while true do
        local statusResult = status()
        local statusFile = fs.open(statusFilePath, "w")
        statusFile.write(statusResult)
        statusFile.close()

        local headers = { ["Authorization"] = apiToken}
        request = http.get(serverURL .. "/getOldestRequest", headers)

        if request then 
            obj = textutils.unserialiseJSON(request.readAll())
            request.close()
        end
        if obj then
            writeLog({INFO = "Request Made: " .. uteisModule.tableToString(obj)})
            handleRequest(obj)
        end
        os.sleep(0.5)
    end
end 


return {
    startAPI = startAPI,
    status = status,
}
