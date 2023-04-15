quit -sim
vcom Adder8.vhd
vsim -t ns Adder8
add wave -divider Inputs:
add wave A
add wave B
add wave Cin
add wave Sum
add wave Cout