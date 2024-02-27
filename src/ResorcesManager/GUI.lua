local resorcesManagerGUIModule = {}
local resorcesModule = require("CCManagerLua/src/ResorcesManager/Resorces")

function resorcesManagerGUIModule.createResorcesManagerFrame(main)
    frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}"):hide()
    frame:addLabel():setText("Resorce Menager"):setPosition(2, 2)
    frame:addLabel():setText("Iron: " .. resorcesModule.getIron()):setPosition(2, 2)
    return main, frame
end

return resorcesManagerGUIModule
