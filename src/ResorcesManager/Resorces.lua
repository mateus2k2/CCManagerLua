local resorsesModuleMine = {}

local rfSystem = peripheral.find("rsBridge")
if rfSystem == nil then error("RF System not found") end

function resorsesModuleMine.getItem(request)
    local returnVar = rfSystem.getItem({name = request.name})

    if returnVar == nil then return {"eror"} end
    if returnVar == "nil" then return {"Item Not Found"} end

    return returnVar
end

function resorsesModuleMine.getItemAmount(txtName)
    local returnVar = rfSystem.getItem({name = txtName})

    if returnVar == nil then return "eror" end
    if returnVar == "nil" then return "Item Not Found" end

    return returnVar.amount
end

return resorsesModuleMine
