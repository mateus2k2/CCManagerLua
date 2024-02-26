local generatorGUIModule = {}

local generatorModuleObject = require("/CC/src/GeneratorManager/Generator")

function generatorGUIModule.createGeneratorFrame(frame)
    frame:setText("Now we're on example 3!"):setPosition(2, 2)
    return frame
end

function generator.teste(x)
    x = x + 1
    return x
end

return generatorGUIModule