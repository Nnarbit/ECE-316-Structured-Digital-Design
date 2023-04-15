library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity elevator is
	port(N1: in std_logic; -- N Call Floor
	     N2 : in std_logic;
	     FS1 : in std_logic; -- Floor Sensor
	     FS2 : in std_logic;
	     DC : in std_logic; -- Door Close
	     CLOCK : in std_logic;
	     RESET : in std_logic;
	     FLOOR : out std_logic_vector(6 downto 0); -- 7 seg display
	     UP : out std_logic;
         DOWN : out std_logic;
	     DO : out std_logic; -- Door open
	     RESETN1 : out std_logic;
	     RESETN2 : out std_logic);
end elevator;

architecture behav of elevator is
  type state_type is (s0, s1, s2, s3, s4, s5);
  signal CS, NS : state_type; -- current state and next state
  signal NS1, NS2 : std_logic;
  begin
	Sreg: process(CLOCK, RESET)
	begin
		if RESET = '0' then
			CS <= s0;
		elsif CLOCK'event and CLOCK = '0' then
			CS <= NS;
		end if; 
	end process;
	
	C1: process(CS, N1, N2, FS1, FS2, DC)
	begin
		case CS is
			when s0 =>
				if (N2 = '1' and DC = '1') then
					NS <= s2;
					
				elsif (FS1 = '1' and N1 = '1' and DC = '1') then
					NS <= s1;
					
				else
					NS <= s0;
					
				end if;
			when s1 =>
					NS <= s0;
					
			when s2 =>
				if (FS2 = '1' and DC = '1') then
					NS <= s4;
					
				else
					NS <= s2;
					 
				end if;			
			when s3 =>
				if (N2 = '1' and DC = '1') then
					NS <= s4;
					
				elsif (N1 = '1' and DC = '1') then
					NS <= s5;
					
				else
					NS <= s3;
					
				end if; 			
			when s4 =>
					NS <= s3;
					
			when s5 =>
				if (FS1 = '1' and DC = '1') then
					NS <= s1;
					
				else
					NS <= s5;
					
				end if;
			when others =>
				null;
			end case;
		end process;

	C2: process(CS)
	begin
		if CS = s0 then 
			--NS1 <= '1';
			--NS2 <= '0';
			UP <= '0';
			DOWN <= '0';
			DO <= '0';
			FLOOR <= "1111001";
		elsif CS = s1 then
			--NS1 <= '1';
			--NS2 <= '0';
			UP <= '0';
			DOWN <= '0';
			DO <= '1';
			FLOOR <= "1111001";
		elsif CS = s2 then
			--NS1 <= '0';
			--NS2 <= '0';
			UP <= '1';
			DOWN <= '0';
			DO <= '0';
		elsif CS = s3 then
			--NS1 <= '0';
			--NS2 <= '1';
			UP <= '0';
			DOWN <= '0';
			DO <= '0';
			FLOOR <= "0100100";   
		elsif CS = s4 then
			--NS1 <= '0';
			--NS2 <= '1';
			UP <= '0';
			DOWN <= '0';
			DO <= '1';
			FLOOR <= "0100100";
		elsif CS = s5 then
			--NS1 <= '0';
			--NS2 <= '0';
			UP <= '0';
			DOWN <= '1';
			DO <= '0';
		end if;
	end process;	
end behav;