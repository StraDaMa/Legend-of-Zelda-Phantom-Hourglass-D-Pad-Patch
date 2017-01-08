;gets keys held in r6
util_get_keys_held:
rldr r6,0x027E05F8,0x027E05F8
ldrh r6,[r6,0x00]
bx r14
util_get_keys_down:
rldr r6,0x027E05F8,0x027E05F8
ldrh r6,[r6,0x02]
bx r14
util_get_keys_up:
rldr r6,0x027E05F8,0x027E05F8
ldrh r6,[r6,0x04]
bx r14
.pool
