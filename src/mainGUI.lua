local mainGUIModule = {}

function mainGUIModule.createMainFrame(main)
    local pageTitle = "Main Page"
    local pageTitleLength = string.len(pageTitle)
    local pageTitleX = math.floor(w / 2 - pageTitleLength / 2)

    frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}")

    frame:addLabel():setText(pageTitle):setPosition(pageTitleX, 2)

    return main, frame
end

return mainGUIModule