local APIGUIModule = {}

local APIModule = require("/CC/src/API/API")

local logLine = 1
MyColors = {SUCCESS = colors.green, ERROR = colors.red, INFO = colors.yellow}

function APIGUIModule.createAPIFrame(main)
    local w, h = main:getSize()
    local pageTitle = "Logs API Page"
    local pageTitleLength = string.len(pageTitle)
    local pageTitleX = math.floor(w / 2 - pageTitleLength / 2)

    local frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")
    
    titleLabelVar = frame:addLabel():setText(pageTitle):setPosition(pageTitleX, 2)
    -- APIFrame = frame:addLabel():setText("LOGS"):setPosition(2, 5)

    local logsFrame = frame:addScrollableFrame():setSize(47, 15):setPosition(2, 4):setBackground(colors.black)

    objects = {
        title = titleLabelVar,
        APIFrame = APIFrame,
        logsFrame = logsFrame
    }

    return main, frame, objects
end

function APIGUIModule.updateFrame(objects)
    while true do
        for i = logLine, #APIModule.logs do
            for level, LogString in pairs(APIModule.logs[i]) do
                objects.logsFrame:addLabel():setPosition(1, i):setText(LogString):setForeground(MyColors[level])
                objects.logsFrame:addLabel():setPosition(1, i):setText(" "):setForeground(MyColors[level])
                logLine = logLine + 2
            end
        end
        os.sleep(1)
    end
end

return APIGUIModule

-- #---------------------------------------------#