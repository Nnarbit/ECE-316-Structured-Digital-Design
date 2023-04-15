library ieee;
use ieee.std_logic_1164.all;

entity display7segment is
  port (Din : in std_logic_vector(3 downto 0);
        Dout : out std_logic_vector(6 downto 0));
	--Dout : out std_logic_vector(7 downto 0));
end display7segment;

architecture bhv_display7segment of display7segment is
begin

   Dout(0) <= (Din(2) and not Din(1) and not Din(0)) or (not Din(3) and not Din(2) and not Din(1) and Din(0));
   Dout(1) <= (Din(2) and Din(1) and not Din(0)) or (Din(2) and not Din(1) and Din(0));
   Dout(2) <= not Din(2) and Din(1) and not Din(0);
   Dout(3) <= (Din(2) and not Din(1) and not Din(0)) or (Din(2) and Din(1) and Din(0)) or (not Din(3) and not Din(2) and not Din(1) and Din(0));
   Dout(4) <= (Din(2) and not Din(1)) or Din(0);
   Dout(5) <= (not Din(3) and not Din(2) and Din(0)) or (not Din(3) and not Din(2) and Din(1)) or (Din(1) and Din(0));
   Dout(6) <= (not Din(3) and not Din(2) and not Din(1)) or (Din(2) and Din(1) and Din(0));
   --SEG: process (Din)
   --begin
   --case Din is
   --when "0000" => Dout <= 16#80#;
   --when "0001" => Dout <= 16#F2#;
   --when "0010" => Dout <= 16#48#;
   --when "0011" => Dout <= 16#60#;
   --when "0100" => Dout <= 16#32#;
   --when "0101" => Dout <= 16#24#;
   --when "0110" => Dout <= 16#04#;
   --when "0111" => Dout <= 16#F0#;
   --when "1000" => Dout <= 16#00#;
   --when "1001" => Dout <= 16#20#;
   --when others => X <= "XXXXXXXX";
   --end case;
   --end process SEG;

end bhv_display7segment;