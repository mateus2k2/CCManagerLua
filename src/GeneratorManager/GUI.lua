local generatorGUIModule = {}

local generatorModule = require("/CC/src/GeneratorManager/Generator")

function handleGeneratorButtom()
    if generatorModule.getStateGenerator() then 
        generatorModule.turnOffGenerator()
    else 
        generatorModule.turnOnGenerator()
    end
end

function generatorGUIModule.createGeneratorFrame(main)
    local w, h = main:getSize()
    local pageTitle = "Generator Manager"
    local pageTitleLength = string.len(pageTitle)
    local pageTitleX = math.floor(w / 2 - pageTitleLength / 2)

    local frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")
    
    titleLabelVar = frame:addLabel():setText(pageTitle):setPosition(pageTitleX, 2)
    batteryLabelVar = frame:addLabel():setText("Battery Energy: " .. generatorModule.getBatteryFillLevel()):setPosition(2, 5)

    local generatorButtom = frame:addButton():setText("Generator is"):setPosition(pageTitleX, 8):onClick(handleGeneratorButtom):setBackground(colors.red):setBorder(colors.white):setSize(19, 3)


    objects = {
        title = titleLabelVar,
        batteryLavel = batteryLabelVar,
        generatorButtom = generatorButtom
    }

    return main, frame, objects
end

function generatorGUIModule.updateFrame(objects)
    while true do
        objects.batteryLavel:setText("Battery Energy: " .. generatorModule.getBatteryFillLevel())

        if generatorModule.getStateGenerator() then 
            objects.generatorButtom:setText("Generator is ON"):setBackground(colors.green)
        else
            objects.generatorButtom:setText("Generator is OFF"):setBackground(colors.red)
        end

        os.sleep(1)
    end
end

return generatorGUIModule