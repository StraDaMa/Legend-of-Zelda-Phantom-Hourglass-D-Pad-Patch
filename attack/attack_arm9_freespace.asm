attack_roll_check_keys:
stmfd r13!,r1-r7,r14
rbl 0x020B1270,0x020B12D0
bl util_get_keys_down
tst r6,GBAKEY_A
beq @@endroutine
bl util_get_keys_held
tst r6,GBAKEY_DIRECTION
beq @@endroutine
mov r0,0x01
@@endroutine:
ldmfd r13!,r1-r7,r15

attack_spin_check_keys:
stmfd r13!,r3-r7,r14
strb r1,[r0,0x04]
bl util_get_keys_held
ldr r7,=(DSKEY_Y|GBAKEY_B)
ands r6,r6,r7
cmp r7,r6
bne @@endroutine
mov r3,0x01
str r3,[r0,0x04]
@@endroutine:
ldmfd r13!,r3-r7,r15

attack_slash_check_keys:
stmfd r13!,r3-r7,r14
mov r0,0x00
bl util_get_keys_down
tst r6,GBAKEY_B
movne r4,0x02
beq @@endroutine
bl util_get_keys_held
tst r6,GBAKEY_DIRECTION
movne r4,0x03
str r4,[r5]
mov r0,0x01
@@endroutine:
ldmfd r13!,r3-r7,r15
;eof
