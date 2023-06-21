----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- Author: GON01 
-- 
-- Create Date: 21.06.2023 11:02:51
-- Design Name: blink_LEDs.vhd
-- Module Name: blink_LEDs - Behavioral
-- Project Name: blink_LEDs
-- Target Devices: zybo z7-10
-- Description: Simple design that control LED's based
--              buttons 
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

entity blink_LEDs is
Port ( BT : in std_logic_vector(3 downto 0); -- input 
       LED : out std_logic_vector(3 downto 0) -- outputs
 );
end blink_LEDs;

architecture Behavioral of blink_LEDs is

begin

LED(0) <=  BT(0);
LED(1) <=  BT(1);
LED(2) <=  BT(2);
LED(3) <=  BT(3);

end Behavioral;
