local resorsesModuleAPI = {}

local resorsesModuleMine = require("/CC/ResorcesManager/Resorces")

function resorsesModuleAPI.handleRequest(request)
    result = nil

    if(request.name == nil) then result = {result = "ERROR", errorType = "Error in the resorsesModuleAPI.handleRequest. Missing name"} end

    return result
end

return resorsesModuleAPI