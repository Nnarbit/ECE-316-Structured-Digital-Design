library ieee;
use ieee.std_logic_1164.all;

Entity halfAdder is
	port (A, B : in std_logic;
	      Cout, Sum : out std_logic);
End halfAdder;

Architecture behav of halfAdder is
begin
	sum <= transport (A xor B) after 5 ns;
	Cout <= transport (A and B) after 5 ns;
End behav;
