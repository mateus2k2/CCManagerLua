local mainGUIModule = {}

function mainGUIModule.createMainFrame(main)
    frame = main:addFrame():setPosition(1, 1):setSize("{parent.w}", "{parent.h}"):hide()

    frame:addLabel():setText("Main Page"):setPosition(2, 2)

    return main, frame
end

return mainGUIModule