local resorsesModuleAPI = {}

local resorsesModuleMine = require("/CC/ResorcesManager/Resorces")

function resorsesModuleAPI.handleRequest(request)
    if(request.name == nil) then result = "Eroor in the resorsesModuleAPI.handleRequest"

    return resorsesModuleMine.getItem(request.name)
end

return resorsesModuleAPI