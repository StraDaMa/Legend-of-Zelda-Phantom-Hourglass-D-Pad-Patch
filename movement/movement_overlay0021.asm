;fix quickmap key
.rorg 0x0211B130,0x0211B1B0
ldrh r2,[r0,0x00]
bl quickmap_check_buttons
;bne 0x0211B150

.rorg 0x0211B214,0x0211B294
bl quickmenu_check_buttons
;beq 0x0211B298

.rorg 0x0211B2B0,0x0211B330
ldrh r0,[r0,0x00]
bl quickstatus_check_buttons
rbne 0x0211B2CC,0x0211B34C
;eof
