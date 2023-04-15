library ieee;
use ieee.std_logic_1164.all;

entity mux_4to1_8bitBus_top is
  port(sel : in std_logic_vector(1 downto 0);
       A, B, C, D: in std_logic_vector(7 downto 0);
       X : out std_logic_vector(7 downto 0));
end mux_4to1_8bitBus_top;

architecture arch_mux_4to1_8bitBus_top of mux_4to1_8bitBus_top is
begin
  MUX: process (sel, A, B, C, D)
  begin
    case sel is
         when "00" => X <= A;
         when "01" => X <= B;
         when "10" => X <= C;
         when "11" => X <= D;
         when others => X <= "XXXXXXXX";
    end case;
  end process MUX;
end arch_mux_4to1_8bitBus_top;