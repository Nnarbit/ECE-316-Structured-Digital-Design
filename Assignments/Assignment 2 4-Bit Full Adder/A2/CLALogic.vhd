library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLALogic is
	port(G, P : in std_logic_vector(3 downto 0);
	Cin : in std_logic;
	Cs : out std_logic_vector(4 downto 1));
end CLAlogic;

architecture bhv_CLAlogic of CLAlogic is
begin
	Cs(1) <= transport (G(0) or (P(0) and Cin)) after 5 ns;
	Cs(2) <= transport (G(1) or (P(1) and G(0)) or (P(1) and P(0) and Cin)) after 5 ns;
	Cs(3) <= transport (G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and Cin)) after 5 ns;
	Cs(4) <= transport (G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) and G(0)) or (P(3) and P(2) and P(1) and P(0) and Cin)) after 5 ns;
end bhv_CLAlogic;