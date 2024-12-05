----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- 
-- Create Date: 26.06.2023
-- Design Name: Adder_Unsigned.vhd
-- Module Name: Adder_Unsigned - Behavioral
-- Project Name: Adder_Unsigned
-- Target Devices: zybo z7-10
-- Description: Addition of two unsigned numbers 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Adder_Unsigned is
generic (length_in  : integer := 32;   -- input length
         length_out : integer := 32 ); -- output length
port (
FirstValue  : in std_logic_vector( length_in - 1  downto 0); 
SecondValue : in std_logic_vector(length_in - 1 downto 0);
Sum         : out std_logic_vector(length_out - 1 downto 0)
);
end Adder_Unsigned;

architecture rtl of Adder_Unsigned is

begin

Sum <= std_logic_vector(resize(unsigned(FirstValue),length_out)+resize(unsigned(SecondValue),length_out));
-- resize function : this function is found in the numeric_std package and works on unsigned and signed values.

end rtl;
