library ieee;
use ieee.std_logic_1164.all;

Entity Register8 is
  Port(data : in std_logic_vector(7 downto 0);
       load, clk : in std_logic;
       Q : out std_logic_vector(7 downto 0));
end Register8;

Architecture Arch_Register8 of Register8 is 
  Signal storage : std_logic_vector(7 downto 0);
    begin
      process(data, load, clk)
      begin
        if (clk'event and clk = '1' and load = '1') then
            storage <= data;
        elsif(clk'event and clk = '0')then
            Q <= storage;
        end if;
      end process;
    end;
