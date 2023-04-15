library ieee;
use ieee.std_logic_1164.all;

entity reg8 is
       Port(Clk : in std_logic;
           Input : in  std_logic_vector (7 downto 0);
           Load : in  std_logic;
           Output : out  std_logic_vector (7 downto 0));
end reg8;
	
architecture behav of reg8 is
  signal storage : std_logic_vector(7 downto 0);

  begin
    process(Clk, Load)
    begin                                   --load and clock are active low
	if (Clk'event and Clk = '0') then
          if (Load = '0') then
	    storage <= Input;
          end if;
        end if;
      if (Clk'event and Clk = '1') then
	  Output <= storage;
	end if;
    end process;
  end;
