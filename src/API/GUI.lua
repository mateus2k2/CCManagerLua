local APIGUIModule = {}

local APIModule = require("/CC/src/API/API")

function APIGUIModule.createAPIFrame(main)
    local w, h = main:getSize()
    local pageTitle = "API Page"
    local pageTitleLength = string.len(pageTitle)
    local pageTitleX = math.floor(w / 2 - pageTitleLength / 2)

    local frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")
    
    titleLabelVar = frame:addLabel():setText(pageTitle):setPosition(pageTitleX, 2)
    logsFrame = frame:addLabel():setText("LOGS"):setPosition(2, 5)

    local sub1 = frame:addScrollableFrame():setSize(20, 15):setPosition(2, 7)
    sub1:addLabel():setPosition(3, 2):setText("Scrollable"):setForeground(colors.lightGray)
    sub1:addLabel():setPosition(3, 12):setText("Inside"):setForeground(colors.lightGray)
    sub1:addLabel():setPosition(3, 20):setText("Outside"):setForeground(colors.lightGray)

    objects = {
        title = titleLabelVar,
        logsFrame = logsFrame
    }

    return main, frame, objects
end

function APIGUIModule.updateFrame(objects)
    while true do
        objects.logsFrame:setText("LOGS")
        os.sleep(1)
    end
end

return APIGUIModule