Legend of Zelda Phantom Hourglass D-pad Patch

1. Introduction

This patch adds D-pad controls for essential actions such as walking,
interacting with objects, and attacking. The new control bindings are
Control Bindings:
D-Pad      Move
Y+Dpad     Move slower
B          Wide slash
B+Dpad     Long slash
Y+B        Spin Attack
A          Interact
A+Dpad     Roll
A          Advance Dialogs



2. Instructions for Patching

Apply Patch using the xdelta command line:

xdelta.exe -d -s (old_file) (delta_file) (decoded_new_file)

old_file should be a copy of Legend of Zelda Phantom Hourglass US/EU
delta_file is the patch (zelda_phantom_hourglass_dpad.xdelta)
decoded_new_file is the filename after patching

3. Contact

I tried out the patch a bit in the beginning and end of the game
and it doesn't seem to break anything. But I haven't checked the
entire game/story so I don't know if it breaks anything throughout.
You can let me know about any errors or bugs at
griegamaster@gmail.com
