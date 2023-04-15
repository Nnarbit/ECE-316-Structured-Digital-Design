library ieee;
use ieee.std_logic_1164.all;

entity tristate_buffer14to16 is
  port(input : in std_logic_vector(13 downto 0);
       enable : in std_logic;
       output : out std_logic_vector(15 downto 0));
end tristate_buffer14to16;

architecture arch_tristate_buffer14to16 of tristate_buffer14to16 is
  begin
    process(input,enable)
      begin
        if(enable = '1')then
           output(13 downto 0) <= input;
           output(15 downto 14) <= "00";
        else
           output <= "ZZZZZZZZZZZZZZZZ";
        end if;
      end process;
end;
