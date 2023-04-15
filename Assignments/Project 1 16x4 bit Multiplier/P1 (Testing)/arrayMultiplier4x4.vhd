library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

Entity arrayMultiplier4x4 is
	--generic (N : integer := 4);
	port (X, Y : in std_logic_vector(3 downto 0);
		  P: out std_logic_vector(7 downto 0));
End arrayMultiplier4x4;

Architecture behav of arrayMultiplier4x4 is

	Component fullAdder is
	port (A, B, Cin : in std_logic;
		  Cout, Sum : out std_logic);
	End component;	

	Component halfAdder is
	port (A, B: in std_logic;
		  Cout, Sum : out std_logic);
	End component;	
	
	signal HA11, HA12, FA21, FA22, FA31, FA32, HA41, HA42: std_logic;
	signal HA51, FA61, FA71, FA81 : std_logic;
	signal HA91, FA101, FA111, FA121 : std_logic;
	signal C10, C11, C12, C13, C20, C21, C22, C23, C30, C31, C32 : std_logic;
	signal S10, S11, S12, S13, S20, S21, S22, S23 : std_logic;
	signal P0, P1, P2, P3, P4, P5, P6, P7 : std_logic;

begin

	P0 <= X(0) AND Y(0);
	P(0) <= P0;

	-- necessary, provides error otherwise
	HA11 <= X(1) AND Y(0); HA12 <= X(0) AND Y(1);
	FA21 <= (X(2) AND Y(0)); FA22 <= X(1) AND Y(1);
	FA31 <= X(3) AND Y(0); FA32 <= X(2) AND Y(1);
	HA41 <= X(3) AND Y(1); HA42 <= '0';

	HA51 <= X(0) AND Y(2);
	FA61 <= X(1) AND Y(2);
	FA71 <= X(2) AND Y(2);
	FA81 <= X(3) AND Y(2);

	HA91 <= X(0) AND Y(3);
	FA101 <= X(1) AND Y(3);
	FA111 <= X(2) AND Y(3);
	FA121 <= X(3) AND Y(3);
	
	HAS10 : halfAdder port map (HA11, HA12, C10, P1);
	FAS11 : fullAdder port map (FA21, FA22, C10, C11, S11);
	FAS12 : fullAdder port map (FA31, FA32, C11, C12, S12);
	HAS13 : halfAdder port map (HA41, HA42, C13, S13);
	
	HAS20 : halfAdder port map (HA51, S11, C20, P2);
	FAS21 : fullAdder port map (FA61, S12, C21, C20, S21);
	FAS22 : fullAdder port map (FA71, S13, C22, C21, S22);
	FAS23 : fullAdder port map (FA81, C13, C23, C22, S23);

	HAS30 : halfAdder port map (HA91, S21, C30, P3);
	FAS31 : fullAdder port map (FA101, S22, C31, C30, P4);
	FAS32 : fullAdder port map (FA111, S23, C32, C31, P5);
	FAS33 : fullAdder port map (FA121, C23, P7, C32, P6);

	P(1) <= P1;
	P(2) <= P2;
	P(3) <= P3;
	P(4) <= P4;
	P(5) <= P5;
	P(6) <= P6;
	P(7) <= P7;
	
End behav;