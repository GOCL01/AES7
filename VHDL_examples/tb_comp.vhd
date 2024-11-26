-- Testbench for Comparator
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_comparator is
-- Testbench has no ports
end tb_comparator;

architecture Behavioral of tb_comparator is



    -- Signals to connect to the UUT
    signal A  : std_logic_vector(7 downto 0);
    signal B  : std_logic_vector(7 downto 0);
    signal EQ : std_logic;

begin

    -- Instantiate the comparator (UUT)
    uut: entity work.comp
        port map (
            A  => A,
            B  => B,
            EQ => EQ
        );

    -- Test process
    stim_proc: process
    begin
        -- Test Case 1: A = 5, B = 3
        A <= "01010101"; -- 5 in binary
        B <= "00110000"; -- 3 in binary
        wait for 10 ns;

        -- Test Case 2: A = 2, B = 7
        A <= "00101111"; -- 2 in binary
        B <= "01110101"; -- 7 in binary
        wait for 10 ns;

        -- Test Case 3: A = 4, B = 4
        A <= "11111111"; -- 4 in binary
        B <= "11111111"; -- 4 in binary
        wait for 10 ns;
        
        -- Test Case 3: A = 4, B = 4
        A <= "00000000"; -- 4 in binary
        B <= "00000000"; -- 4 in binary
        wait for 10 ns;



        -- End simulation
        wait;
    end process;

end Behavioral;
