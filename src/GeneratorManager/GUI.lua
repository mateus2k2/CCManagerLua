local genetorGUIModule = {}

local generatorModuleObject = require("/CC/src/GeneratorManager/Generator")

function genetorGUIModule.createGeneratorFrame(frame)
    frame:setText("Now we're on example 3!"):setPosition(2, 2)
    return frame
end

return genetorGUIModule