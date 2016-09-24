import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS
import XMonad.ManageHook
import XMonad.Hooks.DynamicLog
import XMonad.Util.NamedScratchpad
import XMonad.Actions.GridSelect
import qualified XMonad.StackSet as W

import Data.List

myModMask = mod4Mask -- Use Super instead of Alt

myWorkspaces = ["dev","atom","web","slack","enpass","music"]
myTerminal = "urxvtc"

main = xmonad =<< xmobar myConfig

myConfig = defaultConfig {
	modMask = myModMask ,
	workspaces = myWorkspaces ,
	terminal = myTerminal,
	normalBorderColor  = "#cccccc",
	focusedBorderColor = "#cd8b00",
	manageHook = myManageHook <+> manageHook defaultConfig,
	layoutHook = avoidStruts  $  layoutHook defaultConfig }
	`additionalKeys` myKeys
	--`additionalMouseBindings` myMouseButtons

myKeys = [
	-- Application spawning
	((myModMask, xK_w), spawn "chromium" ),
	((myModMask, xK_a), spawn "atom" ),
	((myModMask, xK_s), spawn "slack" ),
	((myModMask .|. shiftMask, xK_w), spawn "chromium --incognito" ),
	((myModMask .|. shiftMask, xK_m), spawn "urxvtc -e ncmpcpp"),
	((myModMask, xK_v), spawn "urxvtc -e alsamixer"),
	((myModMask, xK_p), spawn "urxvtc -e python"),
	((myModMask, xK_r), spawn "urxvtc -e irb"),
	((myModMask, xK_n), spawn "urxvtc -e node"),
	((myModMask, xK_d), spawn "dmenu_run"),
	((myModMask, xK_t), spawn myTerminal),
	-- Scratchpads
	--((myModMask, xK_n), namedScratchpadAction scratchpads "notes"),
	--((myModMask, xK_h), namedScratchpadAction scratchpads "htop"),
	-- Basic Workspace/Window Manipulation
	((myModMask, xK_Right), nextWS),
	((myModMask, xK_Left), prevWS),
	((myModMask .|. shiftMask, xK_Right), shiftToNext),
	((myModMask .|. shiftMask, xK_Left), shiftToPrev),
	-- Screen Capture
	((myModMask , xK_Print ), spawn "scrot ~/screenshots/screen_%Y%m%d-%H-%M-%S.png"),
	((myModMask .|. shiftMask, xK_Print ), spawn "scrot ~/screenshots/window_%Y%m%d-%H-%M-%S.png -u"),
	-- Master area manipulation
	((myModMask, xK_m), windows W.swapMaster),
	((myModMask .|. shiftMask, xK_h), sendMessage Shrink),
	((myModMask .|. shiftMask, xK_s), sendMessage Expand),
	((myModMask .|. shiftMask, xK_t), sendMessage (IncMasterN 1)),
	((myModMask .|. shiftMask, xK_n), sendMessage (IncMasterN (-1))),
	-- Advanced Workspace/Window Manipulation
	--((myModMask, xK_g), goToSelected myGSConfig),
	--((myModMask .|. shiftMask, xK_g), gridselectWorkspace myGSConfig W.view),
	-- Utility hotkeys
	((myModMask, xK_Up), spawn "amixer set Master 1+"),
	((myModMask, xK_Down), spawn "amixer set Master 1-"),
	((0, xK_Print), spawn "scrot")]

--scratchpads =
--	[ NS "htop" "urxvtc -e htop" (title =? "htop") defaultFloating
--	, NS "notes" "nano --role notes ~/notes.txt" (role =? "notes") nonFloating
--	] where	role = stringProperty "WM_WINDOW_ROLE"

myManageHook = composeAll . concat $
	[ [ className =? "chromium-browser" --> doShift "web" ]
	, [ className =? "Atom" --> doShift "atom"]
	, [ className =? "slack" --> doShift "slack"]
	, [ className =? "Slack" --> doShift "slack"]
	, [ className =? "Enpass" --> doShift "enpass"]
	, [ className =? "Enpass-Desktop" --> doShift "enpass"]
	, [ title =? "ncmpcpp" --> doShift "music" ]
	, [ resource =? "Dialog" --> doFloat] --Float all dialogs
	, [ manageDocks ]
	-- Floating using list comprehension and partial matching
	, [ className =?  c --> doFloat | c <- myFloatsC ]
	, [ fmap ( c `isInfixOf`) className --> doFloat | c <- myMatchAnywhereFloatsC ]
	, [ fmap ( c `isInfixOf`) title     --> doFloat | c <- myMatchAnywhereFloatsT ]
	]
	-- Float the following exact classes, approximate classes, and approximate titles
	where 	myFloatsC = ["Gajim.py", "Xmessage"]
		myMatchAnywhereFloatsC = ["Pidgin","Gimp"]
		myMatchAnywhereFloatsT = ["VLC"]

--myGSConfig = defaultGSConfig
--	{ gs_cellheight = 50
--	, gs_cellwidth = 250
--	, gs_cellpadding = 10 }
