local resorsesModuleAPI = {}

local resorsesModuleMine = require("/CC/src/ResorcesManager/Resorces")

function resorsesModuleAPI.handleRequest(request)
    return {"teste": resorsesModuleMine.getIron()}
end

return resorsesModuleAPI