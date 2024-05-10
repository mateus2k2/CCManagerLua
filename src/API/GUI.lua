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

    local logs = frame:addScrollableFrame():setSize(40, 15):setPosition(2, 7):setBackground(colors.black)
    logs:addLabel():setPosition(3, 2):setText("Scrollable"):setForeground(colors.red)
    logs:addLabel():setPosition(3, 3):setText("Inside"):setForeground(colors.red)
    logs:addLabel():setPosition(3, 4):setText("Outside"):setForeground(colors.red)

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