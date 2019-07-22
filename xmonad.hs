import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = xmonad $ defaultConfig
              { terminal           = "termite"
	      , normalBorderColor  = "#CCCCCC"
	      , focusedBorderColor = "#FF0000"
	      , borderWidth        = 3
	      , focusFollowsMouse  = False
	      , manageHook	   = manageDocks <+> manageHook defaultConfig
	      , layoutHook         = avoidStruts $ layoutHook defaultConfig
	      , handleEventHook    = handleEventHook defaultConfig <+> docksEventHook
	     -- , modMask		   = mod4Mask
              } `additionalKeys`
	      [ ((mod4Mask , xK_l), spawn "i3lock-fancy")
	      , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
              , ((0, xK_Print), spawn "scrot")
	      ]
