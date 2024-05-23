local basalt = require("/Modules/basalt")

indexOnTop = 1
sub = nil
GUIModules = nil

----------------------------------------
--MAIN FRAME
----------------------------------------
local function createGUI() 

    -- local monitors = peripheral.wrap("monitor_0") 
    -- local main = basalt.addMonitor():setMonitor(monitors):setTheme({FrameBG = colors.lightGray, FrameFG = colors.black})
    
    local main = basalt.createFrame():setTheme({FrameBG = colors.lightGray, FrameFG = colors.black})
    local w, h = main:getSize()

    local debugModuleInit = require("/CC/Uteis/Debug")
    debugFrame = debugModuleInit.debugFunc({basalt = basalt, main = main, first = true})

    ----------------------------------------
    --SIDE BAR
    ----------------------------------------

    local sidebar = main:addScrollableFrame():setBackground(colors.gray):setPosition(w, 1):setSize(15, "{parent.h}"):setZ(25):setDirection("vertical")
    :onGetFocus(function(self)
        self:setPosition("{parent.w - (self.w-1) - 1}", 1)
    end)
    :onLoseFocus(function(self)
        self:setPosition(w, 1)
    end)

    sub = {}

    for k,v in pairs(GUIModules) do
        main, frame, objects, title = v.createFrame(main)
        index = #sub + 1

        if index > 1 then frame:hide() end
        table.insert(sub, {index = index, frame = frame, title = title, objects = objects, updateFrame = v.updateFrame, updateInterfaces = v.updateInterfaces})
    end


    local y = 2
    for k,v in pairs(sub) do
        sidebar:addButton():setText(v.title)
        :setBackground(colors.black)
        :setForeground(colors.lightGray)
        :setSize("{parent.w - 3}", 3)
        :setPosition(2, y)
        :onClick(function()
            for a, b in pairs(sub)do
                b.frame:hide()
                v.frame:show()
                indexOnTop = v.index
            end
        end)
        y = y + 4
    end
end

----------------------------------------
--UPDATE
----------------------------------------

-- update interfaces 
function updateInterfaces()
    for k,v in pairs(sub) do
        v.updateInterfaces()
    end
    os.sleep(1)
end

function updateFrame()
    while true do
        sub[indexOnTop].updateFrame(sub[indexOnTop].objects)
        updateInterfaces()
        os.sleep(1)
    end
end

----------------------------------------
--START
----------------------------------------

function startGUI(GUIModulesToLoad) 
    GUIModules = GUIModulesToLoad 
    createGUI() 
    updateFrame()

end

return {
    basalt = basalt,
    startGUI = startGUI
}
