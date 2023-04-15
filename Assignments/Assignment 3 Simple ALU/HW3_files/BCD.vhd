library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity BCD is
  port (Din : in std_logic_vector(7 downto 0);
	D0out, D1out : out std_logic_vector(3 downto 0);
	Overflow : out std_logic);
end BCD;

architecture behav of BCD is
  begin
    process(Din)
    variable temp : std_logic_vector(7 downto 0);
    begin

    temp := "00000000";
    if (Din > 99) then
      overflow <= '1';
    else
      overflow <= '0';
    end if;

    for i in 7 downto 1 loop
      temp := temp(6 downto 0) & Din(i);

    if (unsigned(temp(3 downto 0)) > 4) then
      temp(3 downto 0) := std_logic_vector(unsigned(temp(3 downto 0)) + 3);
    end if;

    if (unsigned(temp(7 downto 4)) > 4) then
      temp(7 downto 4) := std_logic_vector(unsigned(temp(7 downto 4)) + 3);
    end if;
  end loop;

temp := temp(6 downto 0) & Din(0);

D0out <= temp(7 downto 4);
D1out <= temp(3 downto 0);
end process;

end behav;
