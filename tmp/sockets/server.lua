local socketPort = "5000"
local serverURL = "ws://localhost:" .. socketPort .. "/"
-- local serverURL = "wss://ccapi.567437965.xyz/"

local function handleWebSocketMessage(message)
    print("Received message from client: " .. message)
end

local function openWebSocket()
    local ws, err = http.websocket(serverURL)

    if not ws then
        print("Failed to open websocket: " .. err)
        return
    end

    print("Websocket opened successfully")
    print(serverURL)

    local firstIteration = true
    local token = "123456789"
    while true do
        local event, url, message = os.pullEvent("websocket_message")
        handleWebSocketMessage(message)

        if firstIteration then
            print("Sending token to server" .. token)
            ws.send(token)
            firstIteration = false
        end


    end
end

openWebSocket()
