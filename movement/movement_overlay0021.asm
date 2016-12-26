;fix quickmap key
.org 0x0211B130
ldrh r2,[r0,0x00]
bl quickmap_check_buttons
bne 0x0211B150

.org 0x0211B214
bl quickmenu_check_buttons
beq 0x0211B298

.org 0x0211b2b0
ldrh r0,[r0,0x00]
bl quickstatus_check_buttons
bne 0x0211B2CC
;eof
