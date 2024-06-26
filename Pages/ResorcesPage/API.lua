local resorsesModuleAPI = {}

local resorsesModuleMine = require("/CC/Pages/ResorcesPage/Resorces")

function resorsesModuleAPI.handleRequest(request)
    result = nil

    if(request.name == nil) then 
        return {result = "ERROR", errorType = "Error in the resorsesModuleAPI.handleRequest. Missing request.name"}
    else
        return {result = resorsesModuleMine.getItem(request.name)}
    end
end

return resorsesModuleAPI