library ieee;
use ieee.std_logic_1164.all;

Entity Register8Load0 is
  Port(Din : in std_logic_vector(7 downto 0);
       load, clk : in std_logic;
       Dout : out std_logic_vector(7 downto 0));
end Register8Load0;

Architecture Arch_Register8Load0 of Register8Load0 is 
  Signal storage : std_logic_vector(7 downto 0);
    begin
      process(Din, load, clk)
      begin
        if (clk'event and clk = '0' and load = '0') then
          storage <= Din;
        elsif(clk'event and clk = '1' and load = '0') then
          Dout <= storage;
        elsif(load = '1') then
          Dout <= storage;
        end if;
      end process;
    end;
