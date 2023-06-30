----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- Author: GON01 
-- 
-- Create Date: 21.06.2023 11:02:51
-- Design Name: fcn_ans_pkg.vhd
-- Module Name: fcn_ans_pkg - Behavioral
-- Project Name: fcn_ans_pkg
-- Target Devices: zybo z7-10
-- Description: Simple example that makes use of packages
----------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use work.myPackage.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fcn_ans_pkg is
    generic ( N: integer := 2);
    port (x, y : in unsigned(N-1 downto 0);
            s : out unsigned (N-1 downto 0)
        );
end fcn_ans_pkg;
architecture arch of fcn_ans_pkg is

begin   
    
    s <= sum2num(a=>x, b=>y); 

end architecture;

