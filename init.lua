local mouseCircle = nil
local mouseCircleTimer = nil

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

hs.hotkey.bind({"cmd", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x 
  f.y = max.y
  f.w = max.w 
  f.h = max.h/2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x 
  f.y = max.y + (max.h/2)
  f.w = max.w 
  f.h = max.h/2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "C", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w/12)
  f.y = max.y + (max.h/12)
  f.w = max.w*10/12 
  f.h = max.h*10/12
  win:setFrame(f)
end)


local cmdalt = {"cmd", "alt"}
local hyper = {"cmd","alt","ctrl"}

-- Windows Hints
hs.hotkey.bind(hyper, "i", function()
    hs.hints.windowHints()
    local win = hs.window.focusedWindow()
    local max = win:frame()
    local center = hs.geometry.rectMidPoint(max)

    hs.mouse.setAbsolutePosition(center)
end)

hs.hotkey.bind(cmdalt, 'Up', function()
    hs.window.focusedWindow():focusWindowNorth()
    local win = hs.window.focusedWindow()
    local max = win:frame()
    local center = hs.geometry.rectMidPoint(max)

    hs.mouse.setAbsolutePosition(center)
end)

hs.hotkey.bind(cmdalt, 'Down', function()
    hs.window.focusedWindow():focusWindowSouth()
    local win = hs.window.focusedWindow()
    local max = win:frame()
    local center = hs.geometry.rectMidPoint(max)

    hs.mouse.setAbsolutePosition(center)
end)

hs.hotkey.bind(cmdalt, 'Right', function()
    hs.window.focusedWindow():focusWindowEast()
    local win = hs.window.focusedWindow()
    local max = win:frame()
    local center = hs.geometry.rectMidPoint(max)

    hs.mouse.setAbsolutePosition(center)
end)

hs.hotkey.bind(cmdalt, 'Left', function()
    hs.window.focusedWindow():focusWindowWest()
    local win = hs.window.focusedWindow()
    local max = win:frame()
    local center = hs.geometry.rectMidPoint(max)

    hs.mouse.setAbsolutePosition(center)

end)

-- FullScreen Binding
hs.hotkey.bind({"cmd","ctrl"}, "f", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)

end)

-- Wifi Binding

-- Ethernet Binding

-- Mouse Highlight

function mouseHighlight()
    local win = hs.window.focusedWindow()
    local max = win:frame()
    local center = hs.geometry.rectMidPoint(max)

    hs.mouse.setAbsolutePosition(center)
    
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    mousepoint = hs.mouse.getAbsolutePosition()
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
    mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:bringToFront(true)
    mouseCircle:show()

    mouseCircleTimer = hs.timer.doAfter(3, function() mouseCircle:delete() end)
end

hs.hotkey.bind(hyper, 'm', mouseHighlight)