local generatorModule = {}

local inductionMatrix = peripheral.wrap("inductionPort_0")
if inductionMatrix == nil then error("Batery not found") end

transmiter = peripheral.find("redstoneIntegrator")
if transmiter == nil then error("Transmiter not found") end

function generatorModule.getBatteryFillLevel()
    return inductionMatrix.getEnergy()
end

function generatorModule.getBatteryMaxFillLevel()
    return inductionMatrix.getMaxEnergy()
end

function generatorModule.turnOnGenerator()
    integrator.setOutput("south", true)
end

function generatorModule.turnOffGenerator()
    integrator.setOutput("south", false)
end

function generatorModule.getStateGenerator()
    valor = integrator.getAnalogInput("south")
    return (valor > 0)
end

return generatorModule
