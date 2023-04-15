quit -sim
vcom multiplier.vhd
vsim -t ns multiplier
add wave -divider Inputs:
add wave Din
add wave Start
add wave LoadA_LSB
add wave LoadA_MSB
add wave LoadB
add wave CLOCK
add wave dout0
add wave dout1
add wave dout2
add wave dout3
add wave dout4
add wave dout5
add wave dout6
add wave Done
add wave Overflow
