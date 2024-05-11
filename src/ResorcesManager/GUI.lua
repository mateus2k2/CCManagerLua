local resorcesManagerGUIModule = {}
local resorsesModuleMine = require("/CC/src/ResorcesManager/Resorces")

function resorcesManagerGUIModule.createResorcesManagerFrame(main)
    local w, h = main:getSize()
    local pageTitle = "Resorces Manager"
    local pageTitleLength = string.len(pageTitle)
    local pageTitleX = math.floor(w / 2 - pageTitleLength / 2)

    frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")
    
    frame:addLabel():setText(pageTitle):setPosition(pageTitleX, 2)

    local searchField = frame:addInput():setPosition(2, 6):setSize(20, 2)
    local searchButton = frame:addButton():setText("Search"):setPosition(2, 9):setBackground(colors.red):setSize(10, 1)

    itemLabel = frame:addLabel():setText(""):setPosition(2, 14)

    local debugTestInMain = require("/CC/src/Uteis/Debug")
    debugFrame = debugTestInMain.debugFunc({first = false})
    debugFrame.debug("GUI")

    searchButton:onClick(function(text)
        retorno = resorsesModuleMine.getItemAmount(text)
        itemLabel:setText(retorno)
    end)

    local objects = {
        title = titleLabel,
    }

    return main, frame, objects
end

function resorcesManagerGUIModule.updateFrame(objects)
    while true do
        os.sleep(1)
    end
end

return resorcesManagerGUIModule

-- minecraft:iron_ingot