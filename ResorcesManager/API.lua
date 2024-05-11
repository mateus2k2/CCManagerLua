local resorsesModuleAPI = {}

local resorsesModuleMine = require("/CC/ResorcesManager/Resorces")

function resorsesModuleAPI.handleRequest(request)
    return resorsesModuleMine.getItem(request)
end

return resorsesModuleAPI