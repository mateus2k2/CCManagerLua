local gerenatorModuleAPI = {}

local generatorModule = require("/CC/GeneratorManager/Generator")

function gerenatorModuleAPI.handleRequest()
    return {teste = generatorModule.getBatteryFillLevel()}
end


return gerenatorModuleAPI
