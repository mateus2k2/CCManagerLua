local resorsesModuleAPI = {}

local resorsesModuleMine = require("/CC/src/ResorcesManager/Resorces")

function resorsesModuleAPI.handleRequest(request)
    local teste = {"teste" : resorsesModuleMine.getIron()}
    
    return teste
end

return resorsesModuleAPI