interact_check_keys:
	stmfd r13!, r2-r6, r14
	strh r1, [r4, 0x62]
	sub r13, r13, 0x10
	bl util_get_keys_held
	tst r6, GBAKEY_DIRECTION
	bne @@endroutine
	bl util_get_keys_down
	tst r6, GBAKEY_A
	beq @@endroutine
	mov r0, r5
	add r1, r13, 0x54
	add r2, r13, 0x04
	add r3, r13, 0x00
	rbl 0x1FFE468, 0x1FFE468
	ldrh r7, [r13, 0x00]
	ldrh r8, [r13, 0x04]
	ldr r0, =0x027E0F64
	ldr r0, [r0, 0x00]
	rbl 0x0208B120, 0x0208B180
	add r0, r0, 0x200
	ldrsh r0, [r0, 0x26]
	ldrh r1, [r4, 0x6A]
	add r1, r1, r0
	cmp r1, 0x8000
	mov r0, 0x00
	addlt r0, r0, 0x1E
	subgt r0, r0, 0x1E
	cmp r1, 0x00
	moveq r0, 0x00
	add r8, r8, r0
	mov r0, 0x00
	cmp r1, 0x4000
	addlt r0, r0, 0x1E
	ble @@add_done
	cmp r1, 0xC000
	addgt r0, r0, 0x1E
	bgt @@add_done
	sublt r0, r0, 0x1E
@@add_done:
	add r7, r7, r0
	rldr r6, 0x027E0D84, 0x027E0D84
	mov r1, 0x01
	str r1, [r6, 0x00]
	str r8, [r6, 0x04]
	str r7, [r6, 0x08]
	strb r1, [r4, 0x0C]
	str r8, [r4, 0x10]
	str r7, [r4, 0x14]
	mov r0, r4
	mov r1, 0x02
	rbl 0x0207AC18, 0x0207AC78
@@endroutine:
	add r13, r13, 0x10
	ldmfd r13!, r2-r6, r15
;eof