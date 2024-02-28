-- local serverURL = "ws://ccapi.567437965.xyz/"
-- local serverURL = "ws://localhost:5000"
local serverURL = "https://ccapi.567437965.xyz"

local function handleWebSocketMessage(message)
    print("Received message from client: " .. message)
end

local function openWebSocket()
    local ws, err = http.websocketAsync(serverURL)

    if not ws then
        print("Failed to open websocket: " .. err)
        return
    end

    print("Websocket opened successfully")

    while true do
        local event, url, message = os.pullEvent("websocket_message")
        handleWebSocketMessage(message)
    end
end

openWebSocket()
