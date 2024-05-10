local APIGUIModule = {}

local APIModule = require("/CC/src/API/API")

function APIGUIModule.createAPIFrame(main)
    local w, h = main:getSize()
    local pageTitle = "API Page"
    local pageTitleLength = string.len(pageTitle)
    local pageTitleX = math.floor(w / 2 - pageTitleLength / 2)

    local frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")
    
    titleLabelVar = frame:addLabel():setText(pageTitle):setPosition(pageTitleX, 2)
    batteryLabelVar = frame:addLabel():setText("Requests: "):setPosition(2, 5)

    objects = {
        title = titleLabelVar,
        batteryLavel = batteryLabelVar
    }

    return main, frame, objects
end

function APIGUIModule.updateFrame(objects)
    while true do
        objects.batteryLavel:setText("Requests: ")
        os.sleep(1)
    end
end

return APIGUIModule