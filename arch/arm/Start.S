ldr r0, =dtb
ldr r1, =kernel
b main

.global load_kernel
load_kernel:
bx r4