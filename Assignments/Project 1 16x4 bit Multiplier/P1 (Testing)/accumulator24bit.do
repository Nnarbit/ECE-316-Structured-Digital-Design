quit -sim
vcom accumulator24bit.vhd
vsim -t ns accumulator24bit
add wave -divider Inputs:
add wave clk
add wave data_in
add wave load
add wave shift4
add wave add
add wave data_out