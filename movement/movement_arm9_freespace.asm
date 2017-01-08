movement_check_keys:
stmfd r13!,r0-r7,r14
rbl 0x020B7888,0x020B78E8;overwritten opcode
bl util_get_keys_held
tst r6,GBAKEY_SELECT
;If select is pressed no movement
bne @@endroutine
ands r1,r6,GBAKEY_DIRECTION
mov r3,0x07*0x04
ldr r2,=@@dpad_movement_angle_pool
@@key_lookup_start:
ldrh r5,[r2,r3]
cmp r5,r1
beq @@keyfound
subs r3,0x04
bge @@key_lookup_start
b @@endroutine
@@keyfound:
mov r0,0x5F0000
tst r6,DSKEY_Y
movne r0,0x060000
str r0,[r4,0x58]

;get map angle
rldr r0,0x027E0F64,0x027E0F64
ldr r0,[r0]
rbl 0x0208B120,0x0208B180
add r0,r0,0x200
ldrsh r5,[r0,0x26]

add r3,0x02
ldr r2,=@@dpad_movement_angle_pool
ldrh r1,[r2,r3];get angle for direction
add r1,r5,r1
strh r1,[r4,0x6A]
mov r2,0x00
strh r2,[r4,0x60]
strh r2,[r4,0x64]
ldmfd r13!,r0-r7,r15
@@endroutine:
@@end2:
ldmfd r13!,r0-r7,r15
@@dpad_movement_angle_pool:
.halfword (GBAKEY_UP),0x8000;up
.halfword (GBAKEY_DOWN),0x0000;down
.halfword (GBAKEY_LEFT),0xC000;left
.halfword (GBAKEY_RIGHT),0x4000;right
.halfword (GBAKEY_UP|GBAKEY_RIGHT),0x6000;UPRIGHT
.halfword (GBAKEY_DOWN|GBAKEY_RIGHT),0x2000;DOWNRIGHT
.halfword (GBAKEY_UP|GBAKEY_LEFT),0xA000;UPLEFT
.halfword (GBAKEY_DOWN|GBAKEY_LEFT),0xE000;DOWNLEFT

quickmenu_check_buttons:
stmfd r13!,r0-r7,r14
tst r2,GBAKEY_SELECT
blne util_get_keys_down
tstne r6,GBAKEY_LEFT
ldmfd r13!,r0-r7,r15


quickitemmenu_check_buttons:
stmfd r13!,r0-r7,r14
tst r2,GBAKEY_SELECT
blne util_get_keys_down
tstne r6,GBAKEY_RIGHT
ldmfd r13!,r0-r7,r15

quickmap_check_buttons:
stmfd r13!,r0-r7,r14
tst r2,GBAKEY_SELECT
blne util_get_keys_down
tstne r6,GBAKEY_DOWN
ldmfd r13!,r0-r7,r15

quickstatus_check_buttons:
ands r0,r0,GBAKEY_UP|GBAKEY_SELECT
cmp r0,GBAKEY_UP|GBAKEY_SELECT
mov r15,r14
;eof
