.nds
.relativeinclude on
.include "macros.asm"

;edit the ARM9
;uncompressed sizes: 0x5CF78, 0x5CFD8
;RAM ranges: 0x02004000-0x02060F77,  0x02004000-0x02060FD7
.ropen "arm9/arm9.bin", "arm9/arm9.bin", \
       "temp/arm9.bin", "temp/arm9.bin", \
        0x02004000, 0x02004000
	;advance dialog with A/B in addition to tap
	.rorg 0x0203A474, 0x0203A4B8
	bl dialog_advance_check_keys

	;stops game from clearing the pressed buttons during boss battles
	.rorg 0x0202ADEC, 0x0202AE04
	rb 0x0202ADF8,  0x0202AE10

	;ARM9 "freespace"
	.rorg 0x02058608, 0x02058664
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
;uncompressed size: 0x71F60, 0x71F60
;RAM range 0x02077360-0x020E92C0,  0x020773C0-0x020E9320
.ropen "arm9/overlay_0000.bin", "arm9/overlay_0000.bin", \
       "temp/overlay_0000.bin", "temp/overlay_0000.bin", \
       0x02077360, 0x020773C0
	.include "interact/interact_overlay0000.asm"
	.include "attack/attack_overlay0000.asm"
	.include "movement/movement_overlay0000.asm"
.close

;edit the overlay0021/20 (contains checks for key inputs for quick menus)
;EU uses overlay20 for this but it was extracted as "overlay_0021_original.bin" to work around an armips bug (this is fixed in later releases)
;uncompressed size: 0xC900
;RAM range 0x02112BA0-0x0211F4A0
.ropen "arm9/overlay_0021.bin", "arm9/overlay_0020.bin", \
       "temp/overlay_0021.bin", "temp/overlay_0020.bin", \
       0x02112BA0, 0x02112C20
	.include "movement/movement_overlay0021.asm"
.close

;edit the overlay0029 (contains checks for key inputs for quick menus)
;uncompressed size: 0x3B560, 0x3B580
;RAM range 0x0211F5C0-0x0215AB20
.ropen "arm9/overlay_0029.bin", "arm9/overlay_0029.bin", \
       "temp/overlay_0029.bin", "temp/overlay_0029.bin", \
       0x0211F5C0, 0x0211F640
	.include "movement/movement_overlay0029.asm"
.close
;eof
