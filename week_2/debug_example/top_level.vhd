library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Entity declaration
entity TwoAddersMultiplier is
    Port (
        A1, B1, A2, B2 : in std_logic_vector(7 downto 0); 
        P : out std_logic_vector(7 downto 0)           
    );
end TwoAddersMultiplier;

-- Architecture
architecture Behavioral of TwoAddersMultiplier is

    -- Internal signals
    signal Sum1, Sum2 : std_logic_vector(6 downto 0);  -- Outputs of the adders
    signal Product : std_logic_vector(7 downto 0);    -- Output of the multiplier

begin

    -- Instantiate Adder1
    Adder1: entity Adder
        Port map (
            A => A1,
            B => B1,
            S => Sum1
        );

    -- Instantiate Adder2
    Adder1: entity Adder
        Port map (
            A => A2
            B => B2
            S => Sum2
        );

    -- Instantiate Multiplier
    Multiplier: entity work.Multiplier
        Port map (
            A <=  Sum1,
            B <= Sum2,
            P <= Product
        );

    -- Assign output
    P <= Product;

end Behavioral;
