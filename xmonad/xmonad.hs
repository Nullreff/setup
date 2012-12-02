import XMonad hiding ( (|||) )  
import XMonad.Layout.LayoutCombinators 
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.WindowGo(runOrRaiseMaster)
import XMonad.Layout.Tabbed
import qualified Data.Map as M
import System.IO
import qualified XMonad.StackSet as W
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Actions.MouseGestures
import qualified XMonad.StackSet as W
import XMonad.Layout.Named(named)

main = do
	trproc <- spawnPipe trayerCommand
	xmproc <- spawnPipe xmobarCommand
	xmonad $ defaultConfig
		{ manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
        , workspaces = myWorkspaces
		, layoutHook = myLayout --avoidStruts $ layoutHook defaultConfig
		, logHook = myLogHook xmproc
		, modMask = mod4Mask  -- Rebind Mod to the Meta key
        , keys = myKeys 
        , mouseBindings = myMouseBindings
		} 

-- Workspaces
myWorkspaces = map show [1..9] --["web", "docs", "server", "code4", "code5", "code6", "code7", "music", "chat" ] 

-- Layouts
myLayout = avoidStruts $ named "Tabbed" simpleTabbed ||| tiled ||| Mirror tiled ||| Full
    where
        tiled = Tall 1 (3/100) (1/2)

-- Float gimp and vncviewer
myManageHook = composeAll
	[ className =? "Gimp"		--> doFloat
	, className =? "Vncviewer"	--> doFloat
    , isFullscreen              --> (doF W.focusDown <+> doFullFloat)
	]

-- Commands used to run external programs
xmobarCommand = "/usr/bin/xmobar ~/.xmobarrc"
trayerCommand = "/usr/bin/trayer --edge top --align right --SetDockType true --SetPartialStrut false --expand true --widthtype request --transparent true --alpha 0 --tint 0x1E0E00 --height 17 --margin 125" 

-- Union default and new key bindings
myKeys x  = M.fromList (newKeys x) `M.union` keys defaultConfig x

-- Add new and/or redefine key bindings
newKeys conf@(XConfig {XMonad.modMask = modm}) = 
    [ ((mod4Mask, xK_q),               spawn "killall conky trayer; xmonad --recompile; xmonad --restart")
    , ((mod4Mask, xK_s),               runOrRaiseMaster "spotify" (className =? "Spotify"))
    , ((mod4Mask, xK_b),               spawn "google-chrome")
    , ((mod4Mask, xK_v),               spawn "vlc")
    , ((mod4Mask, xK_f),               spawn "thunar")
    , ((mod4Mask, xK_Escape),          spawn "cb-exit")
    , ((mod4Mask .|. shiftMask, xK_l), spawn "xscreensaver-command -lock")
    , ((controlMask, xK_Print),        spawn "sleep 0.2; scrot -s")
    , ((0, xK_Print),                  spawn "scrot")
    ]

-- Mouse Bindings
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((mod4Mask,               button3), (\w -> focus w >> mouseMoveWindow w)) -- Move
    , ((mod4Mask .|. shiftMask, button3), (\w -> focus w >> mouseResizeWindow w 
                                                         >> windows W.shiftMaster)) -- Resize
    , ((mod4Mask,               button1), mouseGesture layoutGestures) 
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

-- Mouse Gestures
layoutGestures = M.fromList
    [ ([L], \_ -> sendMessage $ JumpToLayout "Tabbed")
    , ([U], \_ -> sendMessage $ JumpToLayout "Tall")
    , ([R], \_ -> sendMessage $ JumpToLayout "Mirror Tall")
    , ([D], \_ -> sendMessage $ JumpToLayout "Full")
    ]

-- Custom colors for trayer
myLogHook h = dynamicLogWithPP $ defaultPP 
    { ppHidden  = xmobarColor "#D04300" ""
    , ppCurrent = xmobarColor "#E68100" "" . wrap "(" ")"
    , ppUrgent  = xmobarColor "#E68100" "" . wrap "#" "#"
    , ppLayout  = xmobarColor "#D04300" "" 
    , ppTitle   = xmobarColor "#E68100" "" . shorten 83
    , ppSep     = " "
    , ppOutput  = hPutStrLn h 
    }
