quit -sim
vcom Adder4.vhd
vsim -t ns Adder4
add wave -divider Inputs:
add wave A
add wave B
add wave Cin
add wave S
add wave Cout