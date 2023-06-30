----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- Author: GON01 
-- 
-- Create Date: 21.06.2023 11:02:51
-- Design Name: myPackage.vhd
-- Module Name: myPackage - Behavioral
-- Project Name: myPackage
-- Target Devices: zybo z7-10
-- Description: Example on package creation
----------------------------------------------------------------------------------



library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package myPackage is
    -- contant value to add 1 i.e. num1 + 1 
    constant N : integer := 2;
    
    -- add two number i.e. num1 + num2
    function sum2num(signal a: in unsigned(N-1 downto 0); 
                            signal b: in unsigned(N-1 downto 0))
                            return unsigned ; --is variable sum : unsigned(N-1 downto 0);
                            
end package;

package body myPackage is
    
function sum2num(
		          signal a: in unsigned(N-1 downto 0); 
                   signal b: in unsigned(N-1 downto 0)
                )
	return unsigned is variable sum : unsigned(N-1 downto 0);
          begin
          sum := a + b;
          return sum;
end sum2num; -- function ends

end myPackage;
