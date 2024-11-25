library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Multiplier is
    Port (
        A, B : in std_logic_vector(7 downto 0);  -- 8-bit inputs
        P : out std_logic_vector(7 downto 0)   
    );
end Multiplier;

architecture Behavioral of Multiplier is
begin
    P <= std_logic_vector(unsigned(A) * unsigned(B));
end Behavioral;
