----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- Author: GON01 
-- 
-- Create Date: 21.06.2023 11:02:51
-- Design Name: counter.vhd
-- Module Name: counter - Behavioral
-- Project Name: counter
-- Target Devices: zybo z7-10
-- Description: incremental counter that increases by 1. Result is stored in a 8-bit output
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
Port ( 
       CLK : IN STD_LOGIC;
       RESET : IN STD_LOGIC;
       count : IN STD_LOGIC;
       RESULT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
end counter;

architecture Behavioral of counter is
SIGNAL Q : STD_LOGIC_VECTOR(7 DOWNTO 0);
begin
Counter: process (Clk, Reset)
  variable Increment: integer := 1;
begin 
  if Reset = '0' then
	Q <=  (others => '0');
	--RESULT <=  (others => '0');
  elsif rising_edge(Clk) then
    if Count = '1' then 
      Q <= Q + Increment;
      --RESULT <= Q;
    end if; 
  end if; 
end process;


end Behavioral;
