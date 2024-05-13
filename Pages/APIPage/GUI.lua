local APIGUIModule = {}

local APIModule = require("/CC/Pages/APIPage/API")
local uteisModule = require("/CC/Uteis/Uteis")

local logLine = 2
local logCount = 1
MyColors = {SUCCESS = colors.green, ERROR = colors.red, INFO = colors.yellow}

function APIGUIModule.createFrame(main)
    local w, h = main:getSize()
    local pageTitle = "Logs API Page"
    local pageTitleLength = string.len(pageTitle)
    local pageTitleX = math.floor(w / 2 - pageTitleLength / 2)

    local frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")
    
    titleLabelVar = frame:addLabel():setText(pageTitle):setPosition(pageTitleX, 2)
    
    local logsFrame = frame:addScrollableFrame():setSize("{parent.w - 5}", "{parent.h - 8}"):setPosition(2, 5):setBackground(colors.black):setBorder(colors.white)
    statusLabel = frame:addLabel():setText("STATUS"):setPosition(2, 3)

    objects = {
        title = titleLabelVar,
        statusLabel = statusLabel,
        logsFrame = logsFrame,
        size = logsFrame:getSize()
    }

    return main, frame, objects, "API"
end

function APIGUIModule.updateFrame(objects)
    logs = APIModule.getLogs(0)
    status = APIModule.getStatus()
    
    objects.statusLabel:setText("STATUS = " .. status)

    for i = logCount, #logs do
        for level, LogString in pairs(logs[i]) do
            for _, chunk in ipairs(uteisModule.breakString(LogString, objects.size-2)) do
                objects.logsFrame:addLabel():setPosition(2, logLine):setText(chunk):setForeground(MyColors[level])
                logLine = logLine + 1
            end
            objects.logsFrame:addLabel():setPosition(2, logLine):setText(""):setForeground(MyColors[level])
            logLine = logLine + 1
            logCount = logCount + 1
        end
    end
end

return APIGUIModule