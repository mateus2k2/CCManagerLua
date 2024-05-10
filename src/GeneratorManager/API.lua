local gerenatorModuleAPI = {}

local generatorModule = require("/CC/src/GeneratorManager/Generator")

function gerenatorModuleAPI.handleRequest()
    
    return {"teste" : generatorModule.getBatteryFillLevel()}
end


return gerenatorModuleAPI
