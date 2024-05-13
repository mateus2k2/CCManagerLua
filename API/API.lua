local uteisModule = require("/CC/Uteis/Uteis")

local serverURL = "http://localhost:5015"

local logs = {}
local myModules = {}

local function handleRequest(request)
    local responseObj = nil
    local body = request.body
    local id = request.id

    if id and body and body.type then 
        if myModules[body.type] then
            responseObj = myModules[body.type].handleRequest(body) 
        else
            responseObj = {result = "ERROR", errorType = "type not found"}
        end

        if responseObj.result == "ERROR" then 
            logs[#logs + 1] = {ERROR = "Error processing request = " .. textutils.serialiseJSON(responseObj.errorType)}
        else
            logs[#logs + 1] = {SUCCESS = "Got valid result processing request."}
        end

    else
        logs[#logs + 1] = {ERROR = "Error in the main handleRequest. Missing request.id or request.body.type or request.body"}
        responseObj = {result = "ERROR", errorType="Error in the main handleRequest. Missing request.id or request.body.type or request.body"}
    end

    local responseStr = textutils.serialiseJSON(responseObj)
    local url = serverURL .. "/makeResponse/" .. id
    local headers = { ["Content-Type"] = "application/json" }
    local response = http.post(url, responseStr, headers)

    if response then
        logs[#logs + 1] = {SUCCESS = "Responded to: " .. tostring(id) .. " Got: " .. (response.readAll())}
        response.close()
    else
        logs[#logs + 1] = {ERROR = "Error in response: " .. tostring(id)}
    end
end


local function startAPI(toLoad)
    myModules = toLoad

    while true do
        request = http.get(serverURL .. "/getOldestRequest")
        if request then 
            obj = textutils.unserialiseJSON(request.readAll())
            request.close()
        end
        if obj then
            logs[#logs + 1] = {INFO = "Request Made: " .. uteisModule.tableToString(obj)}
            handleRequest(obj)
        end
        os.sleep(0.5)
    end
    
end 

local function status()
    request = http.get(serverURL .. "/status")
    if request then 
        request.close()
        return "OK" 
    else
        return "DOWN"
    end

end

-- startAPI()

return {
    startAPI = startAPI,
    logs = logs,
    status = status,
    initAPI = initAPI
}
