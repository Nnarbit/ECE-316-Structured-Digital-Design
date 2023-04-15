library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity accumulator24bit is
    Port ( clk : in  std_logic;
           data_in : in  std_logic_vector (23 downto 0);
           load, shift4, add : in  std_logic;
           data_out : out  std_logic_vector (23 downto 0));
end accumulator24bit;

architecture Bhv of accumulator24bit is
  signal internal_register : std_logic_vector (23 downto 0);
begin
  process (clk, load, shift4, add)
  begin
    if (clk'event and clk = '1') then
      if (load = '1') then
        internal_register <= data_in;
      end if;
      if (shift4 = '1') then 
        internal_register <= "0000" & data_in(19 downto 0);
      end if;
      if (add = '1') then 
        internal_register(23 downto 16) <= data_in(23 downto 16);
      end if;
    end if;
    if (clk'event and clk = '0') then
      data_out <= internal_register;
    end if;
  end process;
end Bhv;
