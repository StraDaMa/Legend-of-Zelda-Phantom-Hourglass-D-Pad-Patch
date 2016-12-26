dialog_advance_check_keys:
stmfd r13!,r3-r7,r14
ldrh r1,[r0,0x34]
bl util_get_keys_down
tst r6,(GBAKEY_A|GBAKEY_B)
orrne r1,r1,0x01
ldmfd r13!,r3-r7,r15
;eof
