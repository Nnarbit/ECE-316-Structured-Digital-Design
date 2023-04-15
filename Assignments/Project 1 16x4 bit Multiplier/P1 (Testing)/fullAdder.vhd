library ieee;
use ieee.std_logic_1164.all;

Entity fullAdder is
	port (A, B, Cin : in std_logic;
		  Cout, Sum : out std_logic);
End fullAdder;

Architecture behav of fullAdder is
begin
	sum <= transport (A xor B xor Cin) after 5 ns;
	Cout <= transport (A and B) or ((A xor B) and Cin) after 5 ns;
End behav;
