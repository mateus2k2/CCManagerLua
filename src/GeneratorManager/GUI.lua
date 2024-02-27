local generatorGUIModule = {}

local generatorModule = require("/CC/src/GeneratorManager/Generator")

function generatorGUIModule.createGeneratorFrame(main)
    local w, h = main:getSize()
    local pageTitle = "Generator Manager"
    local pageTitleLength = string.len(pageTitle)
    local pageTitleX = math.floor(w / 2 - pageTitleLength / 2)

    local frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")
    frame:addLabel():setText(pageTitle):setPosition(pageTitleX, 2)

    return main, frame
end

return generatorGUIModule