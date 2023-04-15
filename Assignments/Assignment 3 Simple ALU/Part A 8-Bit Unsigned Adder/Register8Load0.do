quit -sim
vcom Register8Load0.vhd
vsim -t ns Register8Load0
add wave -divider Inputs:
add wave Din
add wave load
add wave clk
add wave Dout
