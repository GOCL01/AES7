-------------------------------------------------------------------------
-- Institution : Applied Science University Fontys
-- Subject : AES7
-- Department : Mechatronics
-- Author: Lizeth Gonzalez Carabarin
-------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_PWM is
-- Testbenches have no ports
end tb_PWM;

architecture Behavioral of tb_PWM is

    -- Component declaration
    component PWM
        Port (  
            CLK      : in  STD_LOGIC;   
            RST      : in  STD_LOGIC;   
            power    : in  STD_LOGIC_VECTOR (31 downto 0); --Fix your corresponding bit length
            PWMout   : out STD_LOGIC;
            PWMdir   : out STD_LOGIC;
            PWMerror : out STD_LOGIC
        );           
    end component;

    -- Signals to connect to DUT
    signal CLK_tb      : std_logic := '0';
    signal RST_tb      : std_logic := '1';
    signal power_tb    : std_logic_vector(31 downto 0) := (others => '0');
    signal PWMout_tb   : std_logic;
    signal PWMdir_tb   : std_logic;
    signal PWMerror_tb : std_logic;

    -- Clock period
    constant CLK_PERIOD : time := 8 ns;  -- 125 MHz clock

begin

    -- Instantiate DUT
    DUT: PWM
        port map(
            CLK      => CLK_tb,
            RST      => RST_tb,
            power    => power_tb,
            PWMout   => PWMout_tb,
            PWMdir   => PWMdir_tb,
            PWMerror => PWMerror_tb
        );

    -- Clock generation
    CLK_process :process
    begin
        while true loop
            CLK_tb <= '0';
            wait for CLK_PERIOD/2;
            CLK_tb <= '1';
            wait for CLK_PERIOD/2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Apply reset
        RST_tb <= '1';
        wait for 50 ns;
        RST_tb <= '0';
        wait for 50 ns;

        -- Test 1: Zero power
        power_tb <= std_logic_vector(to_signed(0, 32));
        wait for 800 us;

        -- Test 2: Positive power in range
        power_tb <= std_logic_vector(to_signed(10000, 32));
        wait for 800 us;

        -- Test 3: Maximum positive power (you need to input POWER value)
        power_tb <= std_logic_vector(to_signed(----, 32));
        wait for 800 us;

        -- Test 4: Out-of-range positive power (should trigger PWMerror)
        power_tb <= std_logic_vector(to_signed(----, 32));
        wait for 800 us;

        -- Test 5: Negative power in range (you need to input POWER value)
        power_tb <= std_logic_vector(to_signed(-----, 32));
        wait for 800 us;

        -- Test 6: Out-of-range negative power (should trigger PWMerror)
        power_tb <= std_logic_vector(to_signed(-----, 32));
        wait for 800 us;

        -- Test 7 : Feel free to add more vector tests

        -- Stop simulation
        wait;
    end process;

end Behavioral;
