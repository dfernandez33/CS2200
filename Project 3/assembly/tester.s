main:	lea $t0, first                        ! place value of first in $t0
        lw $t0, 0($t0)
END:    halt

first:  .fill 0x000002
second: .fill 0x000003
