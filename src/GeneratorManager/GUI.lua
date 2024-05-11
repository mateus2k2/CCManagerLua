local generatorGUIModule = {}

local generatorModule = require("/CC/src/GeneratorManager/Generator")

function handleGeneratorButtom()

end

function generatorGUIModule.createGeneratorFrame(main)
    local w, h = main:getSize()
    local pageTitle = "Generator Manager"
    local pageTitleLength = string.len(pageTitle)
    local pageTitleX = math.floor(w / 2 - pageTitleLength / 2)

    local frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")
    
    titleLabelVar = frame:addLabel():setText(pageTitle):setPosition(pageTitleX, 2)
    batteryLabelVar = frame:addLabel():setText("Battery Energy: " .. generatorModule.getBatteryFillLevel()):setPosition(2, 5)

    local generatorButtom = main:addButton():setText("Generator is"):setPosition(pageTitleX, 4):onClick(handleGeneratorButtom):setBackground(colors.red)


    objects = {
        title = titleLabelVar,
        batteryLavel = batteryLabelVar
    }

    return main, frame, objects
end

function generatorGUIModule.updateFrame(objects)
    while true do
        objects.batteryLavel:setText("Battery Energy: " .. generatorModule.getBatteryFillLevel())
        os.sleep(1)
    end
end

return generatorGUIModule