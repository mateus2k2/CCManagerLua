local APIGUIModule = {}

local APIModule = require("/app/CC/src/API/API")
local uteisModule = require("/app/CC/src/Uteis/Uteis")

local logLine = 1
local logCount = 1
MyColors = {SUCCESS = colors.green, ERROR = colors.red, INFO = colors.yellow}

function APIGUIModule.createAPIFrame(main)
    local w, h = main:getSize()
    local pageTitle = "Logs API Page"
    local pageTitleLength = string.len(pageTitle)
    local pageTitleX = math.floor(w / 2 - pageTitleLength / 2)

    local frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")
    
    titleLabelVar = frame:addLabel():setText(pageTitle):setPosition(pageTitleX, 2)
    
    local logsFrame = frame:addScrollableFrame():setSize(47, 14):setPosition(2, 5):setBackground(colors.black)
    statusLabel = frame:addLabel():setText("STATUS"):setPosition(2, 3)
    
    objects = {
        title = titleLabelVar,
        statusLabel = statusLabel,
        logsFrame = logsFrame
    }

    return main, frame, objects
end

function APIGUIModule.updateFrame(objects)
    while true do
        objects.statusLabel:setText("STATUS = " .. APIModule.status())

        for i = logCount, #APIModule.logs do
            for level, LogString in pairs(APIModule.logs[i]) do
                for _, chunk in ipairs(uteisModule.breakString(LogString)) do
                    objects.logsFrame:addLabel():setPosition(1, logLine):setText(chunk):setForeground(MyColors[level])
                    logLine = logLine + 1
                end
                objects.logsFrame:addLabel():setPosition(1, logLine):setText(""):setForeground(MyColors[level])
                logLine = logLine + 1
                logCount = logCount + 1
            end
        end
        os.sleep(1)
    end
end

return APIGUIModule