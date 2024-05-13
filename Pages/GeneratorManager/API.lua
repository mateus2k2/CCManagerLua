local gerenatorModuleAPI = {}

local generatorModule = require("/CC/Pages/GeneratorManager/Generator")

function gerenatorModuleAPI.handleRequest(request)
    local result = nil

    if(request.action == nil) then result = {result = "ERROR", errorType = "Error in the gerenatorModuleAPI.handleRequest. Missing action"} end

    if(request.action == "getBatteryFillLevel") then
        result = {result = generatorModule.getBatteryFillLevel()    }
    end

    if(request.action == "getBatteryMaxFillLevel") then
        result = {result = generatorModule.getBatteryMaxFillLevel()}
    end

    if(request.action == "turnOnGenerator") then
        result = {result = generatorModule.turnOnGenerator()}
    end

    if(request.action == "turnOffGenerator") then
        result = {result = generatorModule.turnOffGenerator()}
    end

    if(request.action == "getStateGenerator") then
        result = {result = generatorModule.getStateGenerator()}
    end

    return result
end


return gerenatorModuleAPI
