library ieee;
use ieee.std_logic_1164.all;

entity CLAAdder is
	port(A, B : in std_logic_vector(3 downto 0);
	Cin : in std_logic;
	Sum : out std_logic_vector(3 downto 0);
	Cout : out std_logic);
end CLAAdder;

architecture bhv_CLAAdder of CLAAdder is

component FullAdderGP is
	port (A, B, Cin : in std_logic;
	Sum, G, P : out std_logic);
end component;

component CLALogic is
	port(G, P : in std_logic_vector(3 downto 0);
	Cin : in std_logic;
	Cs : out std_logic_vector(4 downto 1));
end component;

signal Gs, Ps : std_logic_vector(3 downto 0);
signal Css : std_logic_vector(4 downto 1);

begin
FAGP0 : FullAdderGP port map (A(0), B(0), Cin, Sum(0), Gs(0), Ps(0));
FAGP1 : FullAdderGP port map (A(1), B(1), Css(1) , Sum(1), Gs(1), Ps(1));
FAGP2 : FullAdderGP port map (A(2), B(2), Css(2), Sum(2), Gs(2), Ps(2));
FAGP3 : FullAdderGP port map (A(3), B(3), Css(3), Sum(3), Gs(3), Ps(3));
CLAL0 : CLALogic port map (Gs, Ps, Cin, Css);

Cout <= Css(4);
end bhv_CLAAdder;