library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_mux_2_to_1 is
-- Testbench has no ports
end tb_mux_2_to_1;

architecture Behavioral of tb_mux_2_to_1 is

    -- Component Declaration for the Unit Under Test (UUT)
    component mux_2_to_1
        Port ( in1 : in STD_LOGIC;
               in2 : in STD_LOGIC;
               sel : in STD_LOGIC;
               output : out STD_LOGIC);
    end component;
    
    -- Test Signals
    signal in1_tb  : STD_LOGIC := '0';
    signal in2_tb  : STD_LOGIC := '0';
    signal sel_tb  : STD_LOGIC := '0';
    signal output_tb : STD_LOGIC;
    
begin
    
    -- Instantiate the Unit Under Test (UUT)
    uut: mux_2_to_1 port map (
        in1 => in1_tb,
        in2 => in2_tb,
        sel => sel_tb,
        output => output_tb
    );
    
    -- Stimulus Process
    stim_proc: process
    begin        
        -- Test Case 1: sel = 0, in1 = 0, in2 = 0
        in1_tb <= '0';
        in2_tb <= '0';
        sel_tb <= '0';
        wait for 10 ns;
        
        -- Test Case 2: sel = 0, in1 = 1, in2 = 0
        in1_tb <= '1';
        in2_tb <= '0';
        sel_tb <= '0';
        wait for 10 ns;
        
        -- Test Case 3: sel = 1, in1 = 1, in2 = 0
        in1_tb <= '1';
        in2_tb <= '0';
        sel_tb <= '1';
        wait for 10 ns;
        
        -- Test Case 4: sel = 1, in1 = 1, in2 = 1
        in1_tb <= '1';
        in2_tb <= '1';
        sel_tb <= '1';
        wait for 10 ns;
        
        -- Test Case 5: sel = 0, in1 = 0, in2 = 1
        in1_tb <= '0';
        in2_tb <= '1';
        sel_tb <= '0';
        wait for 10 ns;
        
        -- Test Case 6: sel = 1, in1 = 0, in2 = 1
        in1_tb <= '0';
        in2_tb <= '1';
        sel_tb <= '1';
        wait for 10 ns;
        
        -- End Simulation
        wait;
    end process;
    
end Behavioral;
