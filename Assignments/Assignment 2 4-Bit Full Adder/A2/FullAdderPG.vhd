library ieee;
use ieee.std_logic_1164.all;

Entity FullAdderGP is
	port (A, B, Cin : in std_logic;
	Sum, G, P : out std_logic);
End FullAdderGP;

Architecture behav of FullAdderGP is
begin
	G <= A and B;
	P <= A or B;
	sum <= transport (A xor B xor Cin) after 5 ns;
End behav;