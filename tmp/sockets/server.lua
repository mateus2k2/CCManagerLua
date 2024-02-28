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

    local token = "123456789"
    local isFirst = true
    while true do
        if isFirst == true then
            print("Sending token to server")
            print(token)
            ws.send(token)
            isFirst = false
        end

        local event, url, message = os.pullEvent("websocket_message")
        handleWebSocketMessage(message)
    end

end

openWebSocket()
