# Test file for "Lab02_introToAVR"


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0x01
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n


# Add tests below
test "All Empty => PORTD: 0x00"
setPINA 0x00
setPINB 0x00
setPINC 0x00
continue 5
expectPORTD 0x00
checkResult

#00111100
test "Balanced-Under => PORTD: 0x3C"
setPINA 0x14
setPINB 0x14
setPINC 0x14
continue 5
expectPORTD 0x3C
checkResult

#10 1111 1101
test "Balanced-Over => PORTD: 0xFD"
setPINA 0xFF
setPINB 0xFF
setPINC 0xFF
continue 5
expectPORTD 0xFD
checkResult

#1000 1110
test "Unbalanced-Under => PORTD: 0x8E"
setPINA 0x8C
setPINB 0x00
setPINC 0x00
continue 5
expectPORTD 0x8E
checkResult

#1 0001 1011
test "Unbalanced-Over => PORTD: 0x1B"
setPINA 0x8C
setPINB 0x8C
setPINC 0x00
continue 5
expectPORTD 0x1B
checkResult

test "PINA: 0x30, PINB: 0x30, PINC: 0x30 => PORTD: 0x91"
setPINA 0x30
setPINB 0x30
setPINC 0x30
continue 5
expectPORTD 0x91
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
