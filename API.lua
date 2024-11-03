local uteisModule = require("/CC/Uteis/Uteis") 

local serverURL = "http://localhost:5015"
local apiToken = "token"

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

local function resorceTrackerAPI(APIModulesToLoad)
    -- primeiro verifica quais recursos trackear pelo liferay
    -- depois inicia o loop para ficar mandando novos pontos pro liferay
end 

return {
    startAPI = startAPI,
    status = status,
}
