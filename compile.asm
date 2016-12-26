.nds
.relativeinclude on
.include "macros.asm"
;edit the ARM9
;uncompressed size 0x5CF78
;RAM range 0x02004000-0x02060F77
.open "arm9_original.bin","arm9_compressed.bin",0x02004000
	;advance dialog with A/B in addition to tap
	.org 0x0203A474
	bl dialog_advance_check_keys

	;stops game from clearing the pressed buttons during boss battles
	.org 0x0202ADEC
	b 0x0202ADF8

	;ARM9 "freespace"
	.org 0x02058608
		.area 0x4B4
		.include "util.asm"
		.include "movement/movement_arm9_freespace.asm"
		.include "interact/interact_arm9_freespace.asm"
		.include "attack/attack_arm9_freespace.asm"
		.include "dialog/dialog_arm9_freespace.asm"
		.pool
		.endarea
.close

;edit the overlay0000 (contains code for movement with touchscreen)
;uncompressed size: 0x71F60
;RAM range 0x02077360-0x020E92C0
.open "overlay_0000_0000_original.bin","overlay_0000_0000_compressed.bin",0x02077360
	.include "interact/interact_overlay0000.asm"
	.include "attack/attack_overlay0000.asm"
	.include "movement/movement_overlay0000.asm"
.close

;edit the overlay0021 (contains checks for key inputs for quick menus)
;uncompressed size: 0xC900
;RAM range 0x02112BA0-0x0211F4A0
.open "overlay_0021_0009_original.bin","overlay_0021_0009_compressed.bin",0x02112BA0
	.include "movement/movement_overlay0021.asm"
.close

;edit the overlay0029 (contains checks for key inputs for quick menus)
;uncompressed size: 0x3B560
;RAM range 0x0211F5C0-0x0215AB20
.open "overlay_0029_0014_original.bin","overlay_0029_0014_compressed.bin",0x0211F5C0
	.include "movement/movement_overlay0029.asm"
.close
;eof
