local mainPageModule = {}

function mainPageModule.createFrame(main)
    local w, h = main:getSize()
    local pageTitle = "Main Page"
    local pageTitleLength = string.len(pageTitle)
    local pageTitleX = math.floor(w / 2 - pageTitleLength / 2)

    frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")

    frame:addLabel():setText(pageTitle):setPosition(pageTitleX, 2)

    objects = {}

    return main, frame, objects, "Main"
end

function mainPageModule.updateFrame()
end

function generatorGUIModule.updateInterfaces()
end

return mainPageModule