local resorsesModuleMine = {}

local rfSystem = peripheral.find("rsBridge")
if rfSystem == nil then error("RF System not found") end

function resorsesModuleMine.getItem(itemFilter)
    local returnVar = rfSystem.getItem({name = itemFilter})

    if returnVar == nil then return {"Error"} end
    if returnVar == "nil" then return {"Item Not Found"} end

    return returnVar
end

function resorsesModuleMine.getItemAmount(txtName)
    local returnVar = rfSystem.getItem({name = txtName})

    if returnVar == nil then return "Error" end
    if returnVar == "nil" then return "Item Not Found" end

    return returnVar.amount
end

return resorsesModuleMine
