local resorsesModuleAPI = {}

local resorsesModuleMine = require("/CC/src/ResorcesManager/Resorces")

function resorsesModuleAPI.handleRequest(request)
    return resorsesModuleMine.getItem(request)
end

return resorsesModuleAPI