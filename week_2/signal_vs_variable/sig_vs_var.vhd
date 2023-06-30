----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- Author: GON01 
-- 
-- Create Date: 21.06.2023 11:02:51
-- Design Name: sig_vs_var.vhd
-- Module Name: sig_vs_var - Behavioral
-- Project Name: sig_vs_var
-- Target Devices: zybo z7-10
-- Description: Simple example to observe the difference between signals and 
--              and variables
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sig_vs_var is
Port ( CLK : in STD_LOGIC;
       A : in STD_LOGIC_VECTOR(5 downto 0);
       OUTPUT :  out STD_LOGIC_VECTOR(5 downto 0));
end sig_vs_var;

architecture Behavioral of sig_vs_var is
signal B, C : STD_LOGIC_VECTOR(5 downto 0);
begin

process(CLK)
    Variable TEMP : STD_LOGIC_VECTOR(5 downto 0);
    begin
        if (rising_edge(clk)) then
            TEMP := A;
            B <= A;
            C <= TEMP;
            --NEXTP <= TEMP(5) & TEMP(4 downto 0);
            OUTPUT <= C;
        end if;

end process;


end Behavioral;
