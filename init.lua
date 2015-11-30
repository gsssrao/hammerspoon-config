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

hs.hotkey.bind(hyper, "i", function()
    hs.hints.windowHints()
end)

hs.hotkey.bind(cmdalt, 'Up', function()
    hs.window.focusedWindow():focusWindowNorth()
end)

hs.hotkey.bind(cmdalt, 'Down', function()
    hs.window.focusedWindow():focusWindowSouth()
end)

hs.hotkey.bind(cmdalt, 'Right', function()
    hs.window.focusedWindow():focusWindowEast()
end)

hs.hotkey.bind(cmdalt, 'Left', function()
    hs.window.focusedWindow():focusWindowWest()
end)

local caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("AWAKE")
    else
        caffeine:setTitle("SLEEPY")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end