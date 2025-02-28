-- Defaults
import qualified Data.Map as Map
import Data.Monoid
import System.Directory
import System.Environment
import System.Exit

-- Core
import XMonad
import qualified XMonad.StackSet as W

-- Actions
import XMonad.Actions.CycleWS

-- Hooks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName

-- Layout
import qualified XMonad.Layout.Fullscreen as Fullscreen
import XMonad.Layout.Grid
import XMonad.Layout.IndependentScreens
import XMonad.Layout.LayoutModifier
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.Spacing
import XMonad.Layout.ToggleLayouts

-- Operations
import XMonad.Operations

-- Util
import qualified XMonad.Util.Cursor as Cursor
import XMonad.Util.Run

-- X11
import Graphics.X11.ExtraTypes.XF86
import Graphics.X11.ExtraTypes.XorgDefault


-- VARIABLES
defaultTerminal = "wezterm"

defaultWebBrowser = "firefox"
defaultWebBrowser' = "chromium"

scriptDir = "~/.local/bin/"


-- KEYBINDINGS
defaultKeyBindings conf@XConfig { XMonad.modMask = modm } = Map.fromList $
    -- App bindings
    [ ((modm, xK_Return), spawn $ command "fish")
    , ((modm, xK_space), spawn "rofi -show run")
    , ((modm, xK_b), spawn defaultWebBrowser)
    , ((modm .|. shiftMask, xK_b), spawn defaultWebBrowser')
    , ((modm, xK_r), spawn $ command "ranger")
    , ((modm .|. shiftMask, xK_p), spawn $ command "pulsemixer")
    , ((modm .|. shiftMask, xK_r), spawn "maim -s -u | xclip -selection clipboard -t image/png -i")

    -- Close focused window
    , ((modm, xK_q), kill)

    -- Next layout
    , ((modm, xK_Tab), sendMessage NextLayout)

    -- Toggle fullscreen
    , ((modm, xK_f), sendMessage $ Toggle "Full")

    -- Moving focus
    , ((modm, xK_j), windows W.focusDown)
    , ((modm, xK_k), windows W.focusUp)
    , ((modm, xK_m), windows W.focusMaster)
    -- Moving windows
    , ((modm .|. shiftMask, xK_j), windows W.swapDown)
    , ((modm .|. shiftMask, xK_k), windows W.swapUp)
    , ((modm .|. shiftMask, xK_m), windows W.swapMaster)
    -- Resizing master
    , ((modm, xK_h), sendMessage Shrink)
    , ((modm, xK_l), sendMessage Expand)
    , ((modm .|. shiftMask, xK_h), sendMessage $ IncMasterN 1)
    , ((modm .|. shiftMask, xK_l), sendMessage $ IncMasterN (-1))
    -- Tile floating back
    , ((modm, xK_t), withFocused $ windows . W.sink)

    -- Volume keys
    , ((noModMask, xF86XK_AudioLowerVolume), lowerVolume)
    , ((modm, xK_u), lowerVolume)
    --
    , ((noModMask, xF86XK_AudioRaiseVolume), raiseVolume)
    , ((modm, xK_i), raiseVolume)
    --
    , ((noModMask, xF86XK_AudioMute), toggleMute)
    , ((modm .|. shiftMask, xK_u), toggleMute)

    -- Playback control
    , ((noModMask, xF86XK_AudioPlay), playPause)
    , ((modm, xK_p), playPause)
    --
    , ((noModMask, xF86XK_AudioPrev), prevTrack)
    , ((modm, xK_y), prevTrack)
    --
    , ((noModMask, xF86XK_AudioNext), nextTrack)
    , ((modm, xK_o), nextTrack)

    -- Monitor brightness
    , ((noModMask, xF86XK_MonBrightnessDown), lowerBrightness)
    , ((modm .|. shiftMask, xK_y), lowerBrightness)
    --
    , ((noModMask, xF86XK_MonBrightnessUp), raiseBrightness)
    , ((modm .|. shiftMask, xK_o), raiseBrightness)

    -- Restart XMonad
    -- , ((modm .|. shiftMask, xK_w), spawn "xmonad --recompile && xmonad --restart")
    , ((modm .|. shiftMask, xK_w), restart "xmonad" True)
    -- Quit XMonad
    , ((modm .|. shiftMask, xK_q), io exitSuccess)
    ]

    ++
    -- Switching and moving between workspaces
    [((m .|. modm, k), windows $ onCurrentScreen f i)
        | (i, k) <- zip (workspaces' conf)
            [ xK_plus
            , xK_ecaron
            , xK_scaron
            , xK_ccaron
            , xK_rcaron
            , xK_zcaron
            , xK_yacute
            , xK_aacute
            , xK_iacute
            , xK_eacute
            ]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    ] ++ [((m .|. modm, k), windows $ onCurrentScreen f i)
        | (i, k) <- zip (workspaces' conf) $ [xK_1 .. xK_9] ++ [xK_0]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    ]

    ++
    -- Switching and moving between monitors
    [((modm .|. mask, key), if mask == noModMask then action else shiftAction)
        | (mask, action) <- [(noModMask, shiftNextScreen), (shiftMask, shiftPrevScreen)]
        , (key, action, shiftAction) <-
            [ (xK_comma, nextScreen, shiftNextScreen >> nextScreen)
            , (xK_period, prevScreen, shiftPrevScreen >> prevScreen)
            ]
    ]

    where
        command cmd = XMonad.terminal conf ++ " start -- " ++ cmd
        --
        lowerVolume = spawn "pamixer -d 5 --allow-boost"
        raiseVolume = spawn "pamixer -i 5 --allow-boost"
        toggleMute = spawn "pamixer -t"
        --
        playPause = spawn "playerctl play-pause"
        prevTrack = spawn "playerctl previous"
        nextTrack = spawn "playerctl next"
        --
        lowerBrightness = spawn "brightnessctl s 5%- -e"
        raiseBrightness = spawn "brightnessctl s 5%+ -e"


-- MOUSE BINDINGS
defaultMouseBindings XConfig { XMonad.modMask = modm } = Map.fromList $
    [ ( (modm, button1)
      , \w -> focus w
        >> mouseMoveWindow w
        >> windows W.shiftMaster
      )
    , ( (modm, button3)
      , \w -> focus w
        >> mouseResizeWindow w
        >> windows W.shiftMaster
      )
    ]


-- LAYOUT
evenSpacing :: l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
evenSpacing = spacingRaw False (Border 8 8 8 8) True (Border 8 8 8 8) True

myLayoutHook = toggleLayouts (noBorders Full) $
    tall ||| grid
    where
        grid = renamed [Replace "Grid"]
            $ evenSpacing
            $ avoidStruts
            $ Grid

        tall = renamed [Replace "Tall"]
            $ evenSpacing
            $ avoidStruts
            $ Tall 1 (3/100) (1/2)


-- MANAGE HOOK
myManageHook =
    className =? "hl_linux" --> doFloat


-- EVENT HOOK
myEventHook = composeAll
    [ fullscreenEventHook
    ]


-- LOG HOOK
myLogHook = return ()


-- STARTUP HOOK
myStartupHook = do
    spawnPipe "remaps"
    spawnPipe "redshift -l \"50:14\" -t 6500K:4000K &"
    spawn "wallpaper"
    setWMName "LG3D"
    Cursor.setDefaultCursor Cursor.xC_left_ptr


-- MAIN
main :: IO ()
main = do
    screenCount <- countScreens
    xmonad
        $ docks
        $ ewmh
        $ Fullscreen.fullscreenSupport
        $ defaultConfig
            { modMask = mod4Mask
            , terminal = defaultTerminal
            , focusFollowsMouse = False
            , clickJustFocuses = False
            , borderWidth = 2
            , workspaces = withScreens screenCount ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
            , normalBorderColor = "#1d2021"
            , focusedBorderColor = "#928374"
            , keys = defaultKeyBindings
            , mouseBindings = defaultMouseBindings
            , layoutHook = myLayoutHook
            , manageHook = myManageHook
            , handleEventHook = myEventHook
            , logHook = myLogHook
            , startupHook = myStartupHook
            }
