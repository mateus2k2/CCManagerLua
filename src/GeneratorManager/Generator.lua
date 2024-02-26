local gerenatorModule = {}

local inductionMatrix = peripheral.wrap("inductionPort_0")
if inductionMatrix == nil then error("Batery not found") end

transmiter = peripheral.find("redstoneIntegrator")
if transmiter == nil then error("Transmiter not found") end

function gerenatorModule.getBatteryFillLevel()
    return inductionMatrix.getEnergy()
end

function gerenatorModule.getBatteryMaxFillLevel()
    return inductionMatrix.getMaxEnergy()
end

function gerenatorModule.turnOnGenerator()
    integrator.setOutput("south", true)
end

function gerenatorModule.turnOffGenerator()
    integrator.setOutput("south", false)
end

function gerenatorModule.getStateGenerator()
    valor = integrator.getAnalogInput("south")
    return (valor > 0)
end

return gerenatorModule
