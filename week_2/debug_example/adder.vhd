library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder is
    Port (
        A, B : in std_logic_vector(7 downto 0); -- 8-bit inputs
        S : out std_logic_vector(7 downto 0)   -- 8-bit sum output
    );
end Adder;

architecture Behavioral of Adder is
begin
    S <= (unsigned(A) + unsigned(B));
end Behavioral;
