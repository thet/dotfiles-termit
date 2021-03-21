-- color_dark = '#333333'
-- color_dark = '#1B1D1E'
color_dark = '#000000'
-- color_bright = 'white'
color_bright = '#FFFFFF'

color_fg_c = 'white'
color_bg_c = 'green'
color_fg_v = 'black'
color_bg_v = 'yellow'
color_fg_x = 'white'
color_bg_x = 'red'
color_fg_z = 'white'
color_bg_z = 'blue'
color_fg_a = 'red'
color_bg_a = 'blue'

defaults = {}

defaults.fillTabbar = false
defaults.hideMenubar = true
defaults.hideSingleTab = true
defaults.hideTabbar = false
defaults.showBorder = false
defaults.showScrollbar = true

-- defaults.transparency = 0.0
defaults.transparency = 1.0
defaults.windowTitle = 'Termit'
defaults.tabName = ''
defaults.encoding = 'UTF-8'
defaults.wordChars = '+-AA-Za-z0-9,./?%&#:_~'
--defaults.font = 'Source Code Pro 11'
--defaults.font = 'Ubuntu Mono for Powerline 12'
defaults.font = 'UbuntuMono Nerd Font Regular 12'
defaults.foregroundColor = color_bright
defaults.backgroundColor = color_dark
defaults.scrollbackLines = 20000
--defaults.geometry = '120x50'
defaults.geometry = '80x25'
setOptions(defaults)

-- Tango Color Theme
--colormap = {'#2e2e34343636', '#cccc00000000', '#4e4e9a9a0606', '#c4c4a0a00000', '#34346565a4a4', '#757550507b7b', '#060698209a9a', '#d3d3d7d7cfcf', '#555557575353', '#efef29292929', '#8a8ae2e23434', '#fcfce9e94f4f', '#72729f9fcfcf', '#adad7f7fa8a8', '#3434e2e2e2e2', '#eeeeeeeeecec'}
-- Zenburn Color Theme
--colormap={'#1e2320', '#705050', '#60b48a', '#dfaf8f', '#b8c2cb', '#dc8cc3', '#486858', '#dcdccc', '#709080' ,'#dca3a3', '#c3bf9f', '#f0dfaf', '#94bff3', '#ec93d3', '#93e0e3', '#ffffff'}
--setColormap(colormap)
--


-- Prevent opening multiple tabs on click to window header bar
bindMouse('DoubleClick', nil)

-- Ctrl-w is disabled by default since..?
bindKey('Ctrl-w', nil)
-- bindKey('Ctrl-t', nil) -- needed by aptitude, etc.

-- OPEN NEW TAB, SET WORKING DIR TO CALLER's TAB
function open_new_tab()
    local tabinfo = currentTab()
    openTab(tabinfo)
end
bindKey('Alt-t', open_new_tab)
-- bindKey('Alt-n', openTab) -- open tab with default tabinfo
bindKey('Alt-r', toggleTabbar)
--bindKey('Alt-w', closeTab)

-- OPEN/SAVE SESSION
bindKey('Alt-o', loadSessionDlg)
bindKey('Alt-s', saveSessionDlg)

-- COPY/PASTE
bindKey('Alt-y', copy)
bindKey('Alt-p', paste)

-- menubar
--bindKey('Alt-m', toggleMenubar)

function toggleScrollbar()
    temp_options = {}
    temp_options.showScrollbar = true
    setOptions(temp_options)
end
bindKey('Alt-h', toggleScrollbar)


function flipColors()
    tab = tabs[currentTabIndex()]
    setTabForegroundColor(tab.backgroundColor)
    setTabBackgroundColor(tab.foregroundColor)
end
function flipColorsW()
    setTabForegroundColor(color_dark)
    setTabBackgroundColor(color_bright)
end
function flipColorsB()
    setTabForegroundColor(color_bright)
    setTabBackgroundColor(color_dark)
end
function flipColorsV()
    setTabForegroundColor(color_fg_v)
    setTabBackgroundColor(color_bg_v)
end
function flipColorsC()
    setTabForegroundColor(color_fg_c)
    setTabBackgroundColor(color_bg_c)
end
function flipColorsX()
    setTabForegroundColor(color_fg_x)
    setTabBackgroundColor(color_bg_x)
end
function flipColorsZ()
    setTabForegroundColor(color_fg_z)
    setTabBackgroundColor(color_bg_z)
end
function flipColorsA()
    setTabForegroundColor(color_fg_a)
    setTabBackgroundColor(color_bg_a)
end



bindKey('Alt-f', function() flipColors() end)

bindKey('Alt-w', flipColorsW)
bindKey('Alt-b', flipColorsB)
bindKey('Alt-v', flipColorsV)
bindKey('Alt-c', flipColorsC)
bindKey('Alt-x', flipColorsX)
bindKey('Alt-z', flipColorsZ)
bindKey('Alt-a', flipColorsA)

function changeTabFontSize(delta)
    tab = tabs[currentTabIndex()]
    -- setTabFont(string.sub(tab.font, 1, string.find(tab.font, '%d+$') - 1) .. (tab.fontSize + delta))
    setTabFont("Ubuntu Mono for Powerline " .. math.floor(tab.fontSize + delta))
end
bindKey('Alt-i', function() changeTabFontSize(1) end)
bindKey('Alt-u', function() changeTabFontSize(-1) end)

bindKey('Alt-1', function() activateTab(1) end)
bindKey('Alt-2', function() activateTab(2) end)
bindKey('Alt-3', function() activateTab(3) end)
bindKey('Alt-4', function() activateTab(4) end)
bindKey('Alt-5', function() activateTab(5) end)
bindKey('Alt-6', function() activateTab(6) end)
bindKey('Alt-7', function() activateTab(7) end)
bindKey('Alt-8', function() activateTab(8) end)
bindKey('Alt-9', function() activateTab(9) end)
bindKey('Alt-0', function() activateTab(10) end)

-- paste ssh login strings into buffer
bindKey('Alt-l', function() feedChild('eval $(\'ssh-agent\'); ssh-add\n\r') end)
bindKey('Alt-n', function() feedChild('termit . &\n\r') end)
bindKey('Alt-m', function() feedChild('gnome-terminal . &\n\r') end)

-- Gnome compatibility
bindKey('Ctrl-Page_Up', nextTab)
bindKey('Ctrl-Page_Down', prevTab)
bindKey('Ctrl-t', open_new_tab)
bindKey('CtrlShift-c', copy)
bindKey('CtrlShift-v', paste)
