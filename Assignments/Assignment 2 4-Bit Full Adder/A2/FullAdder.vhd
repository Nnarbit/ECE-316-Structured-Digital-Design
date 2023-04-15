Entity FullAdder is
	port (X, Y, Cin : in bit;
	Cout, Sum : out bit);
End FullAdder;
Architecture behav of FullAdder is
begin
	sum <= transport (X xor Y xor Cin) after 5 ns;
	Cout <= transport (X and Y) or ((X xor Y) and Cin) after 5 ns;
End behav;
