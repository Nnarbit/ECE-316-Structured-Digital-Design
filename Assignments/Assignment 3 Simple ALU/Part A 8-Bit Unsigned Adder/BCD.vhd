library ieee;
use ieee.std_logic_1164.all;

entity BCD is
	port(Din : in std_logic_vector(7 downto 0);
	D0out, D1out : out std_logic_vector(3 downto 0);
    	overflow : out std_logic);
end BCD;

architecture bhv_BCD of BCD is

component Add3 is
	port (X : in std_logic_vector(3 downto 0);
        P : out std_logic_vector(3 downto 0));
end component;

signal X1, X2, X3, X4, X5, X6, X7, P1, P2, P3, P4, P5, P6, P7 : std_logic_vector(3 downto 0);

begin

	X1(3) <= '0';
	X1(2) <= Din(7);
	X1(1) <= Din(6);
	X1(0) <= Din(5);
	Add31 : Add3 port map(X1, P1);

	X2(3) <= P1(2);
	X2(2) <= P1(1);
	X2(1) <= P1(0);
	X2(0) <= Din(4);
	Add32 : Add3 port map(X2, P2);

	X3(3) <= P2(2);
	X3(2) <= P2(1);
	X3(1) <= P2(0);
	X3(0) <= Din(3);
	Add33 : Add3 port map(X3, P3);

	X4(3) <= '0';
	X4(2) <= P1(3);
	X4(1) <= P2(3);
	X4(0) <= P3(3);
	Add34 : Add3 port map(X4, P4);

	X5(3) <= P3(2);
	X5(2) <= P3(1);
	X5(1) <= P3(0);
	X5(0) <= Din(2);
	Add35 : Add3 port map(X5, P5);

	X6(3) <= P4(2);
	X6(2) <= P4(1);
	X6(1) <= P4(0);
	X6(0) <= P5(3);
	Add36 : Add3 port map(X6, P6);

	X7(3) <= P5(2);
	X7(2) <= P5(1);
	X7(1) <= P5(0);
	X7(0) <= Din(1);
	Add37 : Add3 port map(X7, P7);

	overflow <= P6(3);
	D1out(3) <= P6(2);
	D1out(2) <= P6(1);
	D1out(1) <= P6(0);
	D1out(0) <= P7(3);

	D0out(3) <= P7(2);
	D0out(2) <= P7(1);
	D0out(1) <= P7(0);
	D0out(0) <= Din(0);
end bhv_BCD;