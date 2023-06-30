----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- Author: GON01 
-- 
-- Create Date: 21.06.2023 11:02:51
-- Design Name: signed_adder_8bits.vhd
-- Module Name: signed_adder_8bits - Behavioral
-- Project Name: signed_adder_8bits
-- Target Devices: zybo z7-10
-- Description: Simple design that performs an unsigned 
--              addition of two 8-bit length numbers 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity signed_adder_8bits is
    Port ( in1 : in STD_LOGIC_VECTOR (7 downto 0);
           in2 : in STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (8 downto 0));
end signed_adder_8bits;

architecture Behavioral of signed_adder_8bits is
signal output_s : integer range -255 to 255;
begin

output_s <= to_integer(signed(in1)) + to_integer(signed(in2));
output <= std_logic_vector(to_signed(output_s, 9));

end Behavioral;
