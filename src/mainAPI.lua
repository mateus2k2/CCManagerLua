-- Imports das APIs individuais

local serverURL = "http://localhost:5000"

local function handleRequest(request)
    local responseObj = { resources = { "iron", 123 } }
    local responseStr = textutils.serialiseJSON(responseObj)
    print("Response: " .. responseStr)

    local postData = textutils.urlEncode(responseStr)  -- Encode response JSON for POST body

    local url = serverURL .. "/makeResponse/" .. request.id
    local headers = { ["Content-Type"] = "application/json" }
    local response = http.post(url, postData, headers)  -- Send POST request with JSON body

    if response then
        print("Response Code: " .. response.getResponseCode())
        print("Response Body: " .. response.readAll())
        response.close()
    else
        print("Failed to send response")
    end
end

-- Function to print a table
function printTable(tbl, indent)
    indent = indent or 0
    for key, value in pairs(tbl) do
        if type(value) == "table" then
            print(string.rep("  ", indent) .. key .. " : ")
            printTable(value, indent + 1)
        else
            print(string.rep("  ", indent) .. key .. " : " .. tostring(value))
        end
    end
end

local function startAPI()
    
    print("Starting" .. serverURL)

    while true do
        print("Buscando Request")
        request = http.get(serverURL .. "/getOldestRequest")   
        if request then obj = textutils.unserialiseJSON(request.readAll()) end
        if obj then 
            handleRequest(obj)
            printTable(obj)
        else
            print("Sem requests")
        end
        
        os.sleep(1)
    end
    
end 

startAPI()
