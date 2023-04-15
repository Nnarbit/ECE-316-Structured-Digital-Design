quit -sim
vcom SimpleALU.vhd
vsim -t ns SimpleALU
add wave -divider Inputs:
add wave Din
add wave Opr
add wave LoadX
add wave LoadY
add wave CLK
add wave Dout1
add wave Dout0
add wave Overflow

