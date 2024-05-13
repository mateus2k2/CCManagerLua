local generatorModule = {}

local inductionMatrix = peripheral.wrap("inductionPort_0")
if inductionMatrix == nil then error("Batery not found") end

transmiter = peripheral.find("redstoneIntegrator")
if transmiter == nil then error("Transmiter not found") end

local lock = false

function generatorModule.getLock()
    if lock == false then
        lock = true
        return true
    else
        return false
    end
end

function generatorModule.releaseLock()
    lock = false
end

function generatorModule.getBatteryFillLevel()
    return inductionMatrix.getEnergy()
end

function generatorModule.getBatteryMaxFillLevel()
    return inductionMatrix.getMaxEnergy()
end

function generatorModule.turnOnGenerator()
    transmiter.setOutput("south", true)
end

function generatorModule.turnOffGenerator()
    transmiter.setOutput("south", false)
end

function generatorModule.getStateGenerator()
    valor = transmiter.getAnalogInput("south")
    return (valor > 0)
end

return generatorModule
