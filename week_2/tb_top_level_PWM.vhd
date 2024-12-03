----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.10.2022 14:45:07
-- Design Name: 
-- Module Name: TB_PWM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_top_level is
-- enable the below generic if you want to parametrized your design from the top_level
-- generic(MAX_BIT: integer:=16);
--  Port ( );
end tb_top_level;

architecture Behavioral of tb_top_level is

signal tb_POWER : STD_LOGIC_VECTOR (MAX_BIT-1 downto 0); 
signal tb_CLK : STD_LOGIC := '0';
signal tb_RST : STD_LOGIC;
signal tb_PWM_OUT : STD_LOGIC;
signal tb_PWM_DIR : STD_LOGIC;
signal tb_PWM_ERR : STD_LOGIC;
signal tb_SEL : STD_LOGIC_VECTOR (2 downto 0); 
--signal tb_POWER_int : integer range 0 to 20000;

begin

--  TODO : Change frequency to the appropiate one required in your assignment 
tb_CLK <= not tb_CLK after 10ns;
--tb_POWER <= std_logic_vector(to_signed(tb_POWER_int, 16));
process begin

    tb_RST <= '1';
    wait for 20ns;
    tb_RST <= '0';
    wait for 20 ns;

    --  TODO : Change period to the appropiate one required in your assignment 

    tb_SEL <= "000";
    wait for 400us; --(20ns * 20000 cycles)
        tb_SEL <= "001";
    wait for 400us; --(20ns * 20000 cycles)
        tb_SEL <= "010";
    wait for 400us; --(20ns * 20000 cycles)
        tb_SEL <= "1000";
    wait for 400us; --(20ns * 20000 cycles)

    -- TODO : add all combinations
  


wait;
end process;

-- TODO: Change to your ports names
UUT: entity work.top_level_PWM 
Port map ( SEL => tb_SEL, 
           CLK => tb_CLK,
           RST => tb_RST,
           PWM_OUT => tb_PWM_OUT,
           PWM_DIR => tb_PWM_DIR,
           PWM_ERR => tb_PWM_ERR);


end Behavioral;
