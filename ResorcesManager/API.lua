local resorsesModuleAPI = {}

local resorsesModuleMine = require("/CC/ResorcesManager/Resorces")

function resorsesModuleAPI.handleRequest(request)
    if(request.name == nil) then {result = "ERROR", errorType = "Error in the resorsesModuleAPI.handleRequest"} end

    return {result = resorsesModuleMine.getItem(request.name)}
end

return resorsesModuleAPI