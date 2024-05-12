local generatorGUIModule = {}

local Generator = require("/CC/GeneratorManager/Generator")

function handleGeneratorButton()
    if Generator.getLock() then
        if Generator.getStateGenerator() then 
            Generator.turnOffGenerator()
        else 
            Generator.turnOnGenerator()
        end
        Generator.releaseLock()
    end
end

function generatorGUIModule.createGeneratorFrame(main)
    local w, h = main:getSize()
    local pageTitle = "Generator Manager"
    local pageTitleX = math.floor(w / 2 - #pageTitle / 2)

    local frame = main:addFrame():setPosition(1, 1):setSize("parent.w", "parent.h")
    
    local titleLabel = frame:addLabel():setText(pageTitle):setPosition(pageTitleX, 2)
    local batteryLabel = frame:addLabel():setText("Battery Energy: " .. Generator.getBatteryFillLevel()):setPosition(2, 5)

    local generatorButton = frame:addButton():setText("Generator is"):setPosition(pageTitleX, 8):onClick(handleGeneratorButton):setBackground(colors.red):setBorder(colors.white):setSize(19, 3)

    local objects = {
        title = titleLabel,
        batteryLabel = batteryLabel,
        generatorButton = generatorButton
    }

    return main, frame, objects
end

function generatorGUIModule.updateFrame(objects)
    objects.batteryLabel:setText("Battery Energy: " .. Generator.getBatteryFillLevel())

    if Generator.getLock() then
        if Generator.getStateGenerator() then 
            objects.generatorButton:setText("Generator is ON"):setBackground(colors.green)
        else
            objects.generatorButton:setText("Generator is OFF"):setBackground(colors.red)
        end
        Generator.releaseLock()
    end
end

return generatorGUIModule
