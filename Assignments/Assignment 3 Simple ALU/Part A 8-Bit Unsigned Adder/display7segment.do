quit -sim
vcom display7segment.vhd
vsim -t ns display7segment
add wave -divider Inputs:
add wave Din
add wave Dout

force Din 0000
run
force Din 0001
run
force Din 0010
run
force Din 0011
run
force Din 0100
run
force Din 0101
run
force Din 0110
run
force Din 0111
run
force Din 1000
run
force Din 1001
run
