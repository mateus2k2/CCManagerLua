local loader = require("basaltLoader")
local VisualElement = loader.load("VisualElement")
local tHex = require("utils").tHex

---@class Input : VisualElement
local Input = setmetatable({}, VisualElement)
Input.__index = Input

Input:initialize("Input")
Input:addProperty("value", "string", "")
Input:addProperty("cursorIndex", "number", 1)
Input:addProperty("scrollIndex", "number", 1)
Input:addProperty("inputLimit", "number", nil)
Input:addProperty("inputType", "string", "text")
Input:addProperty("placeholderText", "string", "")
Input:addProperty("placeholderColor", "color", colors.gray)
Input:addProperty("placeholderBackground", "color", colors.black)
Input:combineProperty("placeholder", "placeholderText", "placeholderColor", "placeholderBackground")

Input:addListener("change", "change_value")
Input:addListener("enter", "enter_pressed")

--- Creates a new Input.
---@param id string The id of the object.
---@param parent? Container The parent of the object.
---@param basalt Basalt The basalt object.
--- @return Input
---@protected
function Input:new(id, parent, basalt)
  local newInstance = VisualElement:new(id, parent, basalt)
  setmetatable(newInstance, self)
  self.__index = self
  newInstance:setType("Input")
  newInstance:create("Input")
  newInstance:setSize(10, 1)
  newInstance:setZ(5)
  return newInstance
end

---@protected
function Input.render(self)
    VisualElement.render(self)
    local text = self:getValue()
    local width = self:getWidth()
    local placeHolderActive = false
    if(text == "")then
        text = self:getPlaceholderText()
        placeHolderActive = true
    end
    local visibleText = text:sub(self.scrollIndex, self.scrollIndex + width - 1)
    if(self.inputType=="password")then
        visibleText = ("*"):rep(visibleText:len())
    end
    local space = (" "):rep(width - visibleText:len())
    visibleText = visibleText .. space
    self:addText(1, 1, visibleText)
    if(placeHolderActive)then
        self:addBg(1, 1, tHex[self:getPlaceholderBackground()]:rep(width))
        self:addFg(1, 1, tHex[self:getPlaceholderColor()]:rep(visibleText:len()))
    end
end

Input:extend("Load", function(self)
    self:listenEvent("mouse_click")
    self:listenEvent("mouse_up")
end)

---@protected
function Input:lose_focus()
    VisualElement.lose_focus(self)
    self.parent:setCursor(false)
end

---@protected
function Input:mouse_up(button, x, y)
    if(VisualElement.mouse_up(self, button, x, y))then
        if(button == 1)then
            self.cursorIndex = math.min(x - self.x + self.scrollIndex, self.value:len() + 1)
            self.parent:setCursor(true, self.x + self.cursorIndex - self.scrollIndex, self.y, self:getForeground())
        end
        return true
    end
end

---@protected
function Input:key(key)
    if(VisualElement.key(self, key))then
        if key == keys.backspace and self.value ~= "" and self.cursorIndex > 1 then
            local before = self.value:sub(1, self.cursorIndex-2)
            local after = self.value:sub(self.cursorIndex, -1)
            self.value = before .. after
            self.cursorIndex = self.cursorIndex - 1
            self:updateRender()
        elseif key == keys.left then
            self.cursorIndex = math.max(1, self.cursorIndex - 1)
            self:updateRender()
        elseif key == keys.right then
            self.cursorIndex = math.min(self.value:len() + 1, self.cursorIndex + 1)
            self:updateRender()
        elseif key == keys.enter then
            self:fireEvent("enter", self.value)
            self:setFocused(false)
            self:adjustScrollIndex()
            self:updateRender()
            return
        end
        self:adjustScrollIndex()
        self.parent:setCursor(true, self.x + self.cursorIndex - self.scrollIndex, self.y, self:getForeground())
        return true
    end
end

---@protected
function Input:char(char)
    if(VisualElement.char(self, char))then
        if self.inputLimit and self.value:len() >= self.inputLimit then
            return true
        end
        if self.inputType == "number" and not tonumber(char) then
            if (char == "," or char == ".") and self.value:find("[.,]") then
                return true
            elseif char ~= "," and char ~= "." then
                return true
            end
        end
        local before = self.value:sub(1, self.cursorIndex-1)
        local after = self.value:sub(self.cursorIndex, -1)
        self.value = before .. char .. after
        self.cursorIndex = self.cursorIndex + 1
        self:fireEvent("change", self.value)
        self:adjustScrollIndex()
        self:updateRender()
        self.parent:setCursor(true, self.x + self.cursorIndex - self.scrollIndex, self.y, self:getForeground())
        return true
    end
end

---@protected
function Input:adjustScrollIndex()
    local width = self:getWidth()
    local cursorIndex = self:getCursorIndex()
    local scrollIndex = self:getScrollIndex()
    if cursorIndex < scrollIndex then
        scrollIndex = cursorIndex
    elseif cursorIndex > scrollIndex + width - 1 then
        scrollIndex = cursorIndex - width + 1
    end
    self:setScrollIndex(scrollIndex)
end

return Input