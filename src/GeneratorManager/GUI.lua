local generatorGUIModule = {}

local generatorModuleObject = require("/CC/src/GeneratorManager/Generator")

function generatorGUIModule.createGeneratorFrame(main)
    frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}"):hide()

    frame:addLabel():setText("Now we're on example 3!"):setPosition(2, 2)

    return main, frame
end

-- function generatorGUIModule.teste(x)
--     x = x + 1
--     return x
-- end

return generatorGUIModule