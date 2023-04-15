library ieee;
use ieee.std_logic_1164.all;

Entity sevenSegmentDisp is --Active Low on DE1-SOC board
      port (Din : in std_logic_vector(3 downto 0);
      Dout : out std_logic_vector(6 downto 0));
End sevenSegmentDisp;

Architecture behav of sevenSegmentDisp is
begin
      -- top
      Dout(0) <= (Din(2) and not Din(1) and not Din(0)) or (not Din(3) and not Din(2) and not Din(1) and Din(0));
      -- top right
      Dout(1) <= (Din(2) and Din(1) and not Din(0)) or (Din(2) and not Din(1) and Din(0));
      -- bottom right
      Dout(2) <= not Din(2) and Din(1) and not Din(0);
      -- bottom
      Dout(3) <= (Din(2) and not Din(1) and not Din(0)) or (Din(2) and Din(1) and Din(0)) or (not Din(3) and not Din(2) and not Din(1) and Din(0));
      -- bottom left
      Dout(4) <= (Din(2) and not Din(1)) or Din(0);
      -- top left
      Dout(5) <= (not Din(3) and not Din(2) and Din(0)) or (not Din(3) and not Din(2) and Din(1)) or (Din(1) and Din(0));
      -- middle
      Dout(6) <= (not Din(3) and not Din(2) and not Din(1)) or (Din(2) and Din(1) and Din(0));

End behav;