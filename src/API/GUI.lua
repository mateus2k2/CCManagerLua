local debugMenu = require('/CC/Modules/basaltDebug'):setBasalt(basalt)

local APIGUIModule = {}

local APIModule = require("/CC/src/API/API")

local logCount = 2
MyColors = {SUCCESS = colors.green, ERROR = colors.red, INFO = colors.yellow}

function APIGUIModule.createAPIFrame(main)
    local w, h = main:getSize()
    local pageTitle = "API Page"
    local pageTitleLength = string.len(pageTitle)
    local pageTitleX = math.floor(w / 2 - pageTitleLength / 2)

    local frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")
    
    titleLabelVar = frame:addLabel():setText(pageTitle):setPosition(pageTitleX, 2)
    APIFrame = frame:addLabel():setText("LOGS"):setPosition(2, 5)

    local logsFrame = frame:addScrollableFrame():setSize(47, 1500):setPosition(2, 7):setBackground(colors.black)

    for level, logString in pairs(APIModule.logs) do
        logsFrame:addLabel():setPosition(3, logCount):setText(logString):setForeground(MyColors.level)
        logCount = logCount + 1
    end

    objects = {
        title = titleLabelVar,
        APIFrame = APIFrame,
        logsFrame = logsFrame
    }

    return main, frame, objects
end

function APIGUIModule.updateFrame(objects)
    local localCount = 0
    debugFrame.debug("123")

    while true do
        for level, logString in pairs(APIModule.logs) do
            if localCount >= logCount then
                logsFrame:addLabel():setPosition(3, logCount):setText(logString):setForeground(MyColors.level)
                logCount = logCount + 1
            else
                localCount = localCount + 1
            end
        end

        os.sleep(1)
    end
end

return APIGUIModule