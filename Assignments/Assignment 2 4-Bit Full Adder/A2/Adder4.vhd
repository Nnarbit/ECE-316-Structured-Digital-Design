library ieee;
use ieee.std_logic_1164.all;

Entity Adder4 is
port (A, B : in bit_vector (3 downto 0);
	Cin : in bit;
	S : out bit_vector (3 downto 0);
	Cout : out bit);
End Adder4;

Architecture struct of Adder4 is

Component FullAdder
	port (X, Y, Cin : in bit;
	Cout, Sum : out bit);
End component;

Signal C : bit_vector(3 downto 1);

Begin
FA0 : FullAdder port map (A(0), B(0), Cin, C(1), S(0));
FA1 : FullAdder port map (A(1), B(1), C(1), C(2), S(1));
FA2 : FullAdder port map (A(2), B(2), C(2), C(3), S(2));
FA3 : FullAdder port map (A(3), B(3), C(3), Cout, S(3));

End struct;
