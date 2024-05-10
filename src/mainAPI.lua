-- Imports das APIs individuais
local resorsesModuleAPI  = require("../CC/src/ResorcesManager/API")
local generatorModuleAPI = require("../CC/src/GeneratorManager/API")

local serverURL = "http://localhost:5000"

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
        response.close()
    else
        print("Failed to send response")
    end
end


local function startAPI()
    print("Starting" .. serverURL)

    while true do
        print("Buscando Request")
        request = http.get(serverURL .. "/getOldestRequest")   
        if request then obj = textutils.unserialiseJSON(request.readAll()) end
        if obj then 
            print("Respodendo")
            handleRequest(obj)
        else
            print("Sem requests")
        end
        
        os.sleep(1)
    end
    
end 

startAPI()
