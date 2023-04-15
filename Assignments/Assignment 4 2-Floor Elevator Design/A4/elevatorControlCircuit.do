quit -sim
vcom elevatorControlCircuit.vhd
vsim -t ns elevatorControlCircuit
add wave -divider Inputs:
add wave N
add wave FS
add wave DC
add wave CLOCK
add wave RESET
add wave FIRE
add wave R
add wave UP
add wave DOWN
add wave DO
add wave F
add wave PS
add wave NS