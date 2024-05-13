local APIModule = require("/CC/API/API")
local mainGUIModule = require("/CC/mainGUI")

local resorsesModuleAPI  = require("/CC/ResorcesManager/API")
local generatorModuleAPI = require("/CC/GeneratorManager/API")
modulesAPI = {
    resource = resorsesModuleAPI,
    generator = generatorModuleAPI
}

mainGUIModule.mainGUI()

parallel.waitForAny(
    function() mainGUIModule.updateFrame() end,
    function() mainGUIModule.basalt.autoUpdate() end,
    function() APIModule.startAPI(modulesAPI) end
)

-- ----------------------------------------
-- --TESTES
-- ----------------------------------------

-- shell.run("/CC/API/API.lua")

-- ----------------------------------------
-- --BASALT 2.0
-- ----------------------------------------

-- local basalt = require("/Modules/basalt2")
-- local main = basalt.getMainFrame()

-- -- Create a button
-- local button = main:addButton():setText("Click me")

-- -- Attach an onClick event to the button
-- button:onClick(function()
--     basalt.debug("Button clicked!")
-- end)

-- basalt.run()