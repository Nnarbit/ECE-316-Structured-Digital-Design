quit -sim
vcom BCD.vhd
vsim -t ns BCD
add wave -divider Inputs:
add wave Din
add wave Dout
add wave overflow