// RUN: llvm-mc -filetype=obj -triple=x86_64-pc-linux %s -o %t
// RUN: lld -flavor gnu2 %t -o %tout
// RUN: llvm-objdump -t -d %tout | FileCheck %s
// REQUIRES: x86

.global _start
_start:
  movl $1, sym1(%rip)

.global sym1
.comm sym1,4,4

// CHECK: 12000: {{.*}} movl    $1, -4106(%rip)
// CHECK: 0000000000011000 g       .bss            00000004 sym1