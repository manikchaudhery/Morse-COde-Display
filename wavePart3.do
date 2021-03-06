vlib work

vlog mux8to1.v
vlog RateDivider.v
vlog rotatingRegister12Bits.v
vlog morseCodeDisplay.v

vsim morseCodeDisplay

log {/*}
add wave {/*}

# Reset
force {letterSelect} 011
force {ParallelLoadn} 0
force {Reset} 0
force {Clock} 0 0ns, 1 {5ns} -r 10ns
force {simReset} 1
run 10ns

# Load G
force {letterSelect} 110
force {ParallelLoadn} 0
force {Reset} 1
force {Clock} 0 0ns, 1 {5ns} -r 10ns
force {simReset} 0
run 10ns

# Displays G
force {letterSelect} 110
force {ParallelLoadn} 1
force {Reset} 1
force {Clock} 0 0ns, 1 {5ns} -r 10ns
force {simReset} 0
run 80ns

# Load H
force {letterSelect} 111
force {ParallelLoadn} 0
force {Reset} 1
force {Clock} 0 0ns, 1 {5ns} -r 10ns
force {simReset} 0
run 10ns

# Displays H
force {letterSelect} 111
force {ParallelLoadn} 1
force {Reset} 1
force {Clock} 0 0ns, 1 {5ns} -r 10ns
force {simReset} 0
run 80ns