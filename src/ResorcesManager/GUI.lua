local resorcesManagerGUIModule = {}
local resorsesModuleMine = require("/CC/src/ResorcesManager/Resorces")

function handleSearchButton()

end


function resorcesManagerGUIModule.createResorcesManagerFrame(main)
    local w, h = main:getSize()
    local pageTitle = "Resorces Manager"
    local pageTitleLength = string.len(pageTitle)
    local pageTitleX = math.floor(w / 2 - pageTitleLength / 2)

    frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")
    
    frame:addLabel():setText(pageTitle):setPosition(pageTitleX, 2)

    local searchField = frame:addInput():setPosition(2, 4):setSize(20, 2)
    local searchButton = frame:addButton():setText("Search"):setPosition(2, 10):onClick(handleSearchButton):setBackground(colors.red):setBorder(colors.white):setSize(12, 2)

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
