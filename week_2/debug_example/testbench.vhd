library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Testbench is
end Testbench;

architecture Behavioral of Testbench is
    -- Component declaration for the unit under test (UUT)
    component TwoAddersMultiplier
        Port (
            A1, B1, A2, B2 : in std_logic_vector(7 downto 0);
            P : out std_logic_vector(15 downto 0)
        );
    end component;

    -- Signals for connecting to UUT
    signal A1, B1, A2, B2 : std_logic_vector(7 downto 0);
    signal P : std_logic_vector(15 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: TwoAddersMultiplier
        Port map (
            A1 => A1,
            B1 => B1,
            A2 => A2,
            B2 => B2,
            P => P
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test Case 1: Add 3 + 5 and 2 + 6, multiply results
        A1 <= "00000011";  -- 3
        B1 <= "00000101";  -- 5
        A2 <= "00000010";  -- 2
        B2 <= "00000110";  -- 6
        wait for 10 ns;

        -- Test Case 2: Add 10 + 20 and 15 + 25, multiply results
        A1 <= "00001010";  -- 10
        B1 <= "00010100";  -- 20
        A2 <= "00001111";  -- 15
        B2 <= "00011001";  -- 25
        wait for 10 ns;

        -- Test Case 3: Add 0 + 0 and 0 + 0, multiply results
        A1 <= "00000000";  -- 0
        B1 <= "00000000";  -- 0
        A2 <= "00000000";  -- 0
        B2 <= "00000000";  -- 0
        wait for 10 ns;

        -- Test Case 4: Add maximum values, multiply results
        A1 <= "11111111";  -- 255
        B1 <= "11111111";  -- 255
        A2 <= "11111111";  -- 255
        B2 <= "11111111";  -- 255
        wait for 10 ns;

        -- Stop simulation
        wait;
    end process;

end Behavioral;
