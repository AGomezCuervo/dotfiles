slstatus &
xinput --set-prop 12 "libinput Accel Profile Enabled" 0, 1
xinput --set-prop 12 "libinput Accel Speed" 0
setxkbmap -option ctrl:nocaps
exec dwm
