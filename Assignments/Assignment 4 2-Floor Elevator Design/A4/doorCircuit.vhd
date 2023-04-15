library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity doorCircuit is
    port(
        DO, FIRE, CLOCK : in std_logic; --fire and floor one, otherwise remain closed as it travels down
        FS : in std_logic_vector (2 downto 1);
        DC : out std_logic
    );
end doorCircuit;

architecture bhv of doorCircuit is

begin       
    process begin
	wait until falling_edge(CLOCK);
        if DO = '1' and FIRE = '1' then
            if FS = "01" then
                DC <= '0';
            else
                DC <= '1';
            end if;
        elsif DO = '1' then
            wait for 10 sec;
            DC <= '1';
        end if;
    end process;
end bhv;