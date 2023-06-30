----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- Author: GON01 
-- 
-- Create Date: 21.06.2023 11:02:51
-- Design Name: tb_adder.vhd
-- Module Name: tb_adder - Behavioral
-- Project Name: tb_adder
-- Target Devices: zybo z7-10
-- Description: testbench for signed_adder_8bits.vhd
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

entity tb_adder is
--  Port ( );
end tb_adder;

architecture Behavioral of tb_adder is
signal tb_in1, tb_in2 : std_logic_vector(7 downto 0);
signal tb_output : std_logic_vector(8 downto 0);


begin

TEST: process begin
tb_in1 <= std_logic_vector(to_signed(1,8));
tb_in2 <= std_logic_vector(to_signed(-1,8));
wait for 10 ns;
tb_in1 <= std_logic_vector(to_signed(-100,8));
tb_in2 <= std_logic_vector(to_signed(-1,8));
wait for 10 ns;
tb_in1 <= std_logic_vector(to_signed(127,8));
tb_in2 <= std_logic_vector(to_signed(127,8));
wait for 10 ns;
wait;
end process;


UUT : entity work.signed_adder_8bits 
port map(in1 => tb_in1,
         in2 => tb_in2,
         output => tb_output);


end Behavioral;
