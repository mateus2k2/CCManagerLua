local basalt = require("/Modules/basalt")

indexOnTop = 1
sub = nil
GUIModules = nil

----------------------------------------
--MAIN FRAME
----------------------------------------
local function createGUI() 

    -- local monitors = peripheral.wrap("monitor_10") 
    -- local main = basalt.addMonitor():setMonitor(monitors):setTheme({FrameBG = colors.lightGray, FrameFG = colors.black})

    local main = basalt.createFrame():setTheme({FrameBG = colors.lightGray, FrameFG = colors.black})
    local w, h = main:getSize()

    local debugTestInMain = require("/CC/Uteis/Debug")
    debugFrame = debugTestInMain.debugFunc({basalt = basalt, main = main, first = true})

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

    main, frameGenerator, generatorObjects = GUIModules.generatorGUIModule.createGeneratorFrame(main)
    main, frameResorces, resoursesObjects = GUIModules.resorcesManagerGUIModule.createResorcesManagerFrame(main)
    main, frameAPI, APIObjects = GUIModules.APIGUIModule.createAPIFrame(main)
    main, frameMain = GUIModules.mainPageModule.createMainFrame(main)

    sub = {
        {index = 1, frame = frameMain,             title = "Main",      objects = nil,              updateFunction = GUIModules.mainPageModule.updateFrame},
        {index = 2, frame = frameAPI:hide(),       title = "API",       objects = APIObjects,       updateFunction = GUIModules.APIGUIModule.updateFrame},
        {index = 3, frame = frameGenerator:hide(), title = "Generator", objects = generatorObjects, updateFunction = GUIModules.generatorGUIModule.updateFrame},
        {index = 4, frame = frameResorces:hide(),  title = "Resorses",  objects = resoursesObjects, updateFunction = GUIModules.resorcesManagerGUIModule.updateFrame},
    }


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

function updateFrame()
    while true do
        sub[indexOnTop].updateFunction(sub[indexOnTop].objects)
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
