quit -sim
vcom mux4bus8.vhd
vsim -t ns mux4bus8
add wave -divider Inputs:
add wave A
add wave B
add wave C
add wave D
add wave sel
add wave X