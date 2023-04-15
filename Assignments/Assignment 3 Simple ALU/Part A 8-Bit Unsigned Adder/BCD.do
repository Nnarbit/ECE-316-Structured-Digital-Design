quit -sim
vcom BCD.vhd
vsim -t ns BCD
add wave -divider Inputs:
add wave Din
add wave D0out
add wave D1out
add wave overflow