local generatorGUIModule = {}

local generatorModule = require("/CC/src/GeneratorManager/Generator")

function generatorGUIModule.createGeneratorFrame(main)
    frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}"):hide()

    frame:addLabel():setText("Generator Manager"):setPosition(2, 2)

    return main, frame
end

return generatorGUIModule