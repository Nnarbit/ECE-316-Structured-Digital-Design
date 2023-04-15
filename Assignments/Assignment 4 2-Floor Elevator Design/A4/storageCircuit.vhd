library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity storageCircuit is
    port (
        FB, CALL, R, CLOCK : in std_logic;
        N : out std_logic
    );
end storageCircuit;

architecture bhv of storageCircuit is

begin
    process begin
        wait until falling_edge(CLOCK);
        if R = '1' then
            N <= '0';
        elsif FB = '1' or CALL = '1' then
            N <= '1';
        end if;
    end process;
end bhv;