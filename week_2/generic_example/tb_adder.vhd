----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29-11-2023
-- Design Name: tb_adder_2bits
-- Module Name: tb_adder_2bits - Behavioral
-- Project Name: generic_adder
-- Target Devices: zybo z7-10
-- Tool Versions: 2020.2
-- Description: testbench for top_level.vhd

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_adder is
--  Port ( );
end tb_adder;

architecture Behavioral of tb_adder is

constant data_length : integer := 16;
constant max : integer := ((2**data_length)/2)-1; -- calculation on the max positive value represented by # bits = data_length

signal tb_in1, tb_in2 : STD_LOGIC_VECTOR(data_length-1 downto 0);
signal tb_output : STD_LOGIC_VECTOR(data_length downto 0);

begin

ADDER_TEST : process begin
tb_in1 <= std_logic_vector(to_signed(200,data_length));
tb_in2 <= std_logic_vector(to_signed(-230,data_length));
wait for 10 ns;
tb_in1 <= std_logic_vector(to_signed(-100,data_length));
tb_in2 <= std_logic_vector(to_signed(-150,data_length));
wait for 10 ns;
tb_in1 <= std_logic_vector(to_signed(127,data_length));
tb_in2 <= std_logic_vector(to_signed(127,data_length));
wait for 10 ns;
wait;
end process;

DUT: entity work.top_level
generic map(data_length => data_length,
            max => max)
port map(in_1 => tb_in1,
         in_2 => tb_in2,
         output => tb_output);

end Behavioral;
