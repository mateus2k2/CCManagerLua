local resorsesModuleAPI = {}

local resorsesModuleMine = require("/app/CC/src/ResorcesManager/Resorces")

function resorsesModuleAPI.handleRequest(request)
    return resorsesModuleMine.getItem(request)
end

return resorsesModuleAPI