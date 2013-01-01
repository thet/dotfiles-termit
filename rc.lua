defaults = {}
defaults.hideMenubar = true
defaults.hideSingleTab = true
defaults.showScrollbar = true
defaults.windowTitle = 'Termit'
defaults.tabName = ''
defaults.encoding = 'UTF-8'
defaults.wordChars = '+-AA-Za-z0-9,./?%&#:_~'
defaults.font = 'Ubuntu Mono 12'
defaults.foregroundColor = 'white'
defaults.backgroundColor = '#300A24'
defaults.scrollbackLines = 4096
defaults.geometry = '10x1'
setOptions(defaults)

-- Tango Color Theme
--colormap = {'#2e2e34343636', '#cccc00000000', '#4e4e9a9a0606', '#c4c4a0a00000', '#34346565a4a4', '#757550507b7b', '#060698209a9a', '#d3d3d7d7cfcf', '#555557575353', '#efef29292929', '#8a8ae2e23434', '#fcfce9e94f4f', '#72729f9fcfcf', '#adad7f7fa8a8', '#3434e2e2e2e2', '#eeeeeeeeecec'}
-- Zenburn Color Theme
--colormap={'#1e2320', '#705050', '#60b48a', '#dfaf8f', '#b8c2cb', '#dc8cc3', '#486858', '#dcdccc', '#709080' ,'#dca3a3', '#c3bf9f', '#f0dfaf', '#94bff3', '#ec93d3', '#93e0e3', '#ffffff'}
--setColormap(colormap)
--

-- Ctrl-w is disabled by default since..?
bindKey('Ctrl-w', nil)
bindKey('Ctrl-t', nil) -- needed by aptitude, etc.

-- OPEN NEW TAB, SET WORKING DIR TO CALLER's TAB
function open_new_tab()
    local tabinfo = currentTab()
    openTab(tabinfo)
end
bindKey('Alt-t', open_new_tab)
bindKey('Alt-n', openTab) -- open tab with default tabinfo
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
    setTabForegroundColor('black')
    setTabBackgroundColor('white')
end
function flipColorsB()
    setTabForegroundColor('white')
    setTabBackgroundColor('black')
end
bindKey('Alt-f', function() flipColors() end)
bindKey('Alt-w', flipColorsW)
bindKey('Alt-b', flipColorsB)

function changeTabFontSize(delta)
    tab = tabs[currentTabIndex()]
    setTabFont(string.sub(tab.font, 1, string.find(tab.font, '%d+$') - 1)..(tab.fontSize + delta))
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
