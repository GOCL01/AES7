----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- Author: GON01 
-- 
-- Create Date: 21.06.2023 11:02:51
-- Design Name: tb_sig_vs_var.vhd
-- Module Name: tb_sig_vs_var - Behavioral
-- Project Name: tb_sig_vs_var
-- Target Devices: zybo z7-10
-- Description: Testbench for sig_vs_var.tb
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

entity tb_sig_vs_var is
--  Port ( );
end tb_sig_vs_var;

architecture Behavioral of tb_sig_vs_var is
signal tb_CLK :  STD_LOGIC := '0';
signal tb_A : STD_LOGIC_VECTOR(5 downto 0);
signal tb_OUTPUT :  STD_LOGIC_VECTOR(5 downto 0);

begin

tb_CLK <= not tb_CLK after 20ns;

process begin

tb_A <= "100001";
wait for 5ns;
tb_A <= "111111";
wait;
end process;


UUT : entity work.sig_vs_var
Port map ( CLK => tb_CLK,
       A => tb_A,
       OUTPUT => tb_OUTPUT);


end Behavioral;
