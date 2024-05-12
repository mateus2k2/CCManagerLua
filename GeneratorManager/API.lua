local gerenatorModuleAPI = {}

local generatorModule = require("/CC/GeneratorManager/Generator")

function gerenatorModuleAPI.handleRequest(request)
    local result = nil

    if(request.action == nil) then result = "Eroor in the gerenatorModuleAPI.handleRequest"

    if(request.action == "getBatteryFillLevel") then
        result = generatorModule.getBatteryFillLevel()    
    end

    if(request.action == "getBatteryMaxFillLevel") then
        result = generatorModule.getBatteryMaxFillLevel()
    end

    if(request.action == "turnOnGenerator") then
        result = generatorModule.turnOnGenerator()
    end

    if(request.action == "turnOffGenerator") then
        result = generatorModule.turnOffGenerator()
    end

    if(request.action == "getStateGenerator") then
        result = generatorModule.getStateGenerator()
    end

    return {result = result}
end


return gerenatorModuleAPI
