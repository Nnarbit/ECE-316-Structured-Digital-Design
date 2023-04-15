# close any existing simulations
quit -sim

# compile our VHDL file
vcom s_xor1.vhd

# start the simulation - set timescale to nanoseconds
vsim -t ns s_xor1

# add the inputs to the wave
# first add a divider with a label
add wave -divider Inputs:
add wave a b

# add the outputs to the wave
# first add a divider with a label
add wave -divider Outputs:
add wave c

# do initial run with default values - optional
# run 10 ns

# force values
force a 0, 1 10 ns -r 20 ns
force b 0, 1 20 ns -r 40 ns

# run
run 100 ns
