----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- Author: GON01 
-- 
-- Create Date: 21.06.2023 11:02:51
-- Design Name: top_level.vhd
-- Module Name: top_level - Behavioral
-- Project Name: top_level
-- Target Devices: zybo z7-10
-- Description: top_level example that make use of
--              generic map
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

entity top_level is
    generic(data_length : integer := 16; 
            max : integer:= ((2**16)/2)-1 -- calculation on the max positive value represented by 16 bits
            );    
    Port ( in_1 : in STD_LOGIC_VECTOR (data_length-1 downto 0);
           in_2 : in STD_LOGIC_VECTOR (data_length-1 downto 0);
           output : out STD_LOGIC_VECTOR (data_length downto 0)
           
           );
end top_level;

architecture Behavioral of top_level is

begin

ADDER1 : entity work.adder 
-- generic map overwrites the defined generic values within adder
generic map(length => data_length,
            max    => max)
port    map(in1    => in_1,
            in2    => in_2,
            output => output);

          
end Behavioral;
