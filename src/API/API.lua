local resorsesModuleAPI  = require("/CC/src/ResorcesManager/API")
local generatorModuleAPI = require("/CC/src/GeneratorManager/API")

local uteisModule = require("/CC/src/Uteis/Uteis")

local serverURL = "http://localhost:5000"

local logs = {}

local function handleRequest(request)
    local responseObj = nil

    if request.body.type == "resource" then
        responseObj = resorsesModuleAPI.handleRequest(request.body)
    elseif request.body.type == "generator" then
        responseObj = generatorModuleAPI.handleRequest(request.body)
    end

    local responseStr = textutils.serialiseJSON(responseObj)
    local url = serverURL .. "/makeResponse/" .. request.id
    local headers = { ["Content-Type"] = "application/json" }
    local response = http.post(url, responseStr, headers)

    if response then
        logs[#logs + 1] = {SUCCESS = "Responded to: " .. tostring(request.id) .. " Got: " .. (response.readAll())} 
        response.close()
    else
        logs[#logs + 1] = {ERROR = "Error in response: " .. tostring(id) .. " Got: " .. (response.readAll())} 
    end
end


local function startAPI()
    while true do
        request = http.get(serverURL .. "/getOldestRequest")   
        if request then obj = textutils.unserialiseJSON(request.readAll()) end
        if obj then
            logs[#logs + 1] = {INFO = "Request Made: " .. uteisModule.tableToString(obj)} 
            handleRequest(obj)
        end
        os.sleep(1)
    end
    
end 

local function status()
    request = http.get(serverURL .. "/status")   
    if request then 
        return "OK" 
    else
        return "DOWN"
    end

end

-- startAPI()

return {
    startAPI = startAPI,
    logs = logs,
    status = status
}
