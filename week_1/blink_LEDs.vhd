----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- Author: GON01 
-- 
-- Create Date: 21.06.2023 11:02:51
-- Design Name: blink_LEDs.vhd
-- Module Name: blink_LEDs - Behavioral
-- Project Name: blink_LEDs
-- Target Devices: zybo z7-10
-- Description: Simple design that controls LED's based
--              inout buttons 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blink_LEDs is
Port ( BT : in std_logic_vector(3 downto 0); -- input 
       LED : out std_logic_vector(3 downto 0) -- outputs
 );
end blink_LEDs;

architecture Behavioral of blink_LEDs is

begin

LED(0) <=  BT(0); -- when button 1 is pressed, LED 1 is on
LED(1) <=  BT(1); -- when button 2 is pressed, LED 2 is on
LED(2) <=  BT(2); -- when button 3 is pressed, LED 3 is on
LED(3) <=  BT(3); -- when button 4 is pressed, LED 4 is on

end Behavioral;
