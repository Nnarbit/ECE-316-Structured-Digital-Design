library ieee;
use ieee.std_logic_1164.all;

entity adder8 is
	port (A, B : in std_logic_vector(7 downto 0);
		Cin : in std_logic;
		S : out std_logic_vector(7 downto 0);
		Cout : out std_logic);
end Adder8;

Architecture bhv of adder8 is 
Component adder4
	port (A, B : in std_logic_vector(3 downto 0);
		Cin : in std_logic;
		S : out std_logic_vector(3 downto 0);
		Cout : out std_logic);
end component;

Signal C : std_logic;

begin
	A41: adder4 port map(A(3 downto 0), B(3 downto 0), Cin, S(3 downto 0), C);
	A42: adder4 port map(A(7 downto 4), B(7 downto 4), C, S(7 downto 4), Cout);
end bhv;
