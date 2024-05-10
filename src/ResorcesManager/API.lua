local resorsesModuleAPI = {}

local resorsesModuleMine = require("/CC/src/ResorcesManager/Resorces")

function resorsesModuleAPI.handleRequest(request)
    -- return {"teste": resorsesModuleMine.getIron()}
    return {"teste": 123}
end

return resorsesModuleAPI