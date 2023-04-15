library ieee;
use ieee.std_logic_1164.all;


entity Add3 is
  port (X : in std_logic_vector(3 downto 0);
        P : out std_logic_vector(3 downto 0));
end Add3;

architecture bhv_Add3 of Add3 is
begin
    P(3) <= (X(3) or (X(2) and X(1)) or (X(2) and X(0)));
    P(2) <= ((X(3) and X(0)) or (X(2) and not X(1) and not X(0)));
    P(1) <= ((X(1) and X(0)) or (not X(3) and not X(2) and X(1)) or (X(3) and not X(1) and not X(0)));
    P(0) <= ((X(3) and not X(0)) or (not X(3) and not X(2) and X(0)) or (X(2) and X(1) and not X(0)));
end bhv_Add3;