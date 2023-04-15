library ieee;
use ieee.std_logic_1164.all;

entity controller is
	port (Start, clk : in std_logic; 
		Load, Add, Shift4, Done : out std_logic);

end controller;

Architecture struct of controller is

	type state_type is (initial, s_load, add1, shift1, add2, shift2, add3, shift3, add4, s_shift4, s_done);
	signal next_state, present_state : state_type;

begin

	Accumulator: process(clk)
	begin
		--if Start = '0' then
		--present_state <= initial;
		--elsif clk'event and clk='1' then
		present_state <= next_state;
		--end if;
	end process;

	C1: process(present_state, Start)
	begin
		case present_state is

			when initial =>
			if (Start = '1') then
				next_state <= s_load;
			else
				next_state <= initial;
			end if;

			when s_load =>
			if (Start = '0') then
				next_state <= add1;
			else
				next_state <= s_load;
			end if;

			when add1 =>
				next_state <= shift1;

			when shift1 =>
				next_state <= add2;

			when add2 =>
				next_state <= shift2;

			when shift2 =>
				next_state <= add3;

			when add3 =>
				next_state <= shift3;

			when shift3 =>
				next_state <= add4;

			when add4 =>
				next_state <= s_shift4;

			when s_shift4 =>
				next_state <= s_done;

			when s_done =>
			if (Start = '0') then
				next_state <= initial;
			else
				next_state <= s_done;
			end if;

			when others =>
			null;
		end case;
	end process;

	C2: process(present_state)
	begin
		if present_state = initial then
		Load <= '0'; Add <= '0'; Shift4 <= '0'; Done <= '0';

		elsif present_state = s_load then
		Load <= '1'; Add <= '0'; Shift4 <= '0'; Done <= '0';

		elsif present_state = add1 then
		Load <= '0'; Add <= '1'; Shift4 <= '0'; Done <= '0';

		elsif present_state = shift1 then
		Load <= '0'; Add <= '0'; Shift4 <= '1'; Done <= '0';

		elsif present_state = add2 then
		Load <= '0'; Add <= '1'; Shift4 <= '0'; Done <= '0';

		elsif present_state = shift2 then
		Load <= '0'; Add <= '0'; Shift4 <= '1'; Done <= '0';

		elsif present_state = add3 then
		Load <= '0'; Add <= '1'; Shift4 <= '0'; Done <= '0';

		elsif present_state = shift3 then
		Load <= '0'; Add <= '0'; Shift4 <= '1'; Done <= '0';

		elsif present_state = add4 then
		Load <= '0'; Add <= '1'; Shift4 <= '0'; Done <= '0';

		elsif present_state = s_shift4 then
		Load <= '0'; Add <= '0'; Shift4 <= '1'; Done <= '0';

		elsif present_state = s_done then
		Load <= '0'; Add <= '0'; Shift4 <= '0'; Done <= '1';
		end if;
	end process;
end struct;