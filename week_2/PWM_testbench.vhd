-------------------------------------------------------------------------
-- TESTBENCH => What should be tested
--              How to perform the test
--              What validates a good test outcome
-- Component: VHDL test bench for <yourdesign>
-- Remarks  : 
-------------------------------------------------------------------------

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_STD.all;

entity PWMGEN_TB is
end entity PWMGEN_TB;

architecture BENCH of PWMGEN_TB is
-------------------------------------------
-- Signals and constants
-------------------------------------------

signal CLK       : STD_LOGIC := '0';   
signal RST       : STD_LOGIC := '0';   
signal power     : STD_LOGIC_VECTOR (15 downto 0);
signal PWMout    : STD_LOGIC;
signal PWMerror  : STD_LOGIC;
signal PWMdir    : STD_LOGIC; 

begin
-------------------------------------------
-- clock generator
-------------------------------------------  
CLK <= not CLK after 10 NS;

-------------------------------------------
-- reset generator
-------------------------------------------

POWER_process : process
variable length : integer := 16;
begin

RST <= '1';
wait for 0.1ms;
RST<='0';
wait for 0.1ms;
-- This values must be change according to your design 
POWER <= std_logic_vector(to_signed(-21000, POWER'length));
wait for 2ms;

POWER <= std_logic_vector(to_signed(-20000, POWER'length));
wait for 2ms;

POWER <= std_logic_vector(to_signed(-10000, POWER'length));
wait for 2ms;

POWER <= std_logic_vector(to_signed(-5000, POWER'length));
wait for 2ms;

POWER <= std_logic_vector(to_signed(0, POWER'length));
wait for 2ms;

POWER <= std_logic_vector(to_signed(5000, POWER'length));
wait for 2ms;

POWER <= std_logic_vector(to_signed(10000, POWER'length));
wait for 2ms;

POWER <= std_logic_vector(to_signed(20000, POWER'length));
wait for 2ms;

POWER <= std_logic_vector(to_signed(21000, POWER'length));
wait for 2ms;

wait;

end process POWER_process;

-------------------------------------------
-- Instantiate the UUT component
-------------------------------------------
UUT: entity work.PWMgen
  port map (
    CLK        => CLK,
    RST        => RST,
    power      => power,
    PWMout     => PWMout,
    PWMdir     => PWMdir,
    PWMerror   => PWMerror
  );

end architecture BENCH;
