local uteisModule = require("/CC/Uteis/Uteis") 

local serverURL = "http://localhost:5015"
local apiToken = "token"

local logFilePath = "/CC/Logs/logs.txt"
local statusFilePath = "/CC/Logs/APIStatus.txt"

local APIModules = {}

local function handleRequest()
    return "OK"
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
        -- espera mesagem pelo ws
        -- responde a mensagem

        os.sleep(1)
    end
end 


return {
    startAPI = startAPI,
    status = status,
}
