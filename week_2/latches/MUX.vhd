----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.11.2024 11:55:46
-- Design Name: MUX.vhd
-- Module Name: MUX - Behavioral
-- Project Name: 
-- Target Devices: Zynq-Z7
-- Tool Versions: Vivado 2022.2
-- Description: Simple example to demonstrate designs that can contain spurious latches
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
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

entity MUX is
 Port ( SEL : in STD_LOGIC_VECTOR(1 downto 0);
        A,B,C : in STD_LOGIC_VECTOR(1 downto 0);
        output : out STD_LOGIC_VECTOR(1 downto 0));
end MUX;

architecture Behavioral of MUX is

begin

process(A,B,C,SEL) begin
	if SEL = "00" then 
		output <= A;
	elsif SEL = "01" then
		output <= B;
	elsif SEL = "10" then 
		output <= C;

	end if;
end process;

end Behavioral;
