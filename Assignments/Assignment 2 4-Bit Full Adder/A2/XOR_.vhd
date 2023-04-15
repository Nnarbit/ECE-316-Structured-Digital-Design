library ieee;
use ieee.std_logic_1164.all;

entity s_xor1 is
	port( a,b : in std_logic;
		c : out std_logic);
end s_xor1;

architecture df_s_xor1 of s_xor1 is
begin
	--c <= ((not a) and b) or (a and (not b)); -- no delay
	 c <= ((not a) and b) or (a and (not b)) after 5 ns; -- inertial delay
	-- c <=  transport ((not a) and b) or (a and (not b)) after 30 ns; -- transport delay
end df_s_xor1;
