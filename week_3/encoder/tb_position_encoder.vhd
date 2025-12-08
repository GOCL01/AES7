-------------------------------------------------------------------------
-- Component: tb_position_encoder
-- Description: Testbench for a Quadrature encoder with state machine 
-- Author: GOCL01
-- Company : Applied Science University Fontys
-------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_position_encoder is
-- Testbench has no ports
end entity;

architecture sim of tb_position_encoder is
constant length : integer := 16;
    -- Component declaration
    component position_encoder
        generic(length : integer);
        port(
            clk        : in  std_logic;
            A          : in  std_logic;
            B          : in  std_logic;
            rst        : in  std_logic;
            position   : out std_logic_vector(length-1 downto 0);
            enc_error  : out std_logic
        );
    end component;

    -- Signals to connect to DUT
    signal clk        : std_logic := '0';
    signal rst        : std_logic := '0';
    signal A, B       : std_logic := '0';
    signal position   : std_logic_vector(length-1 downto 0);
    signal enc_error  : std_logic;

    -- Clock period
    constant CLK_PERIOD : time := 8 ns;  -- 125 MHz that corresponds to Zybo-10

begin

 
    -- Instantiate DUT
    
    DUT: position_encoder
        generic map(length=>length)
        port map (
            clk       => clk,
            rst       => rst,
            A         => A,
            B         => B,
            position  => position,
            enc_error => enc_error
        );


    -- Clock generation (125MHz)

    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

 
    -- Stimulus process


    stim_proc: process
        variable count : integer;
    begin
        -- Apply reset
        rst <= '1';
        wait for 2*CLK_PERIOD;
        rst <= '0';
        wait for CLK_PERIOD;


        -- Count up from min to max
        -- The maximum value here is 128, notice that you MUST modify this value 
        -- according to a range that fits into your counter length, e.g. 
        -- if your counter length = 8, it means it can reach up to -/+128. considering 
        -- your bit sign.

        for count in 0 to 128 loop
            -- Generate quadrature signals (simplified CW)
            case count mod 4 is
                when 0 => A <= '0'; B <= '0';
                when 1 => A <= '0'; B <= '1';
                when 2 => A <= '1'; B <= '1';
                when others => A <= '1'; B <= '0';
            end case;

            wait for CLK_PERIOD;
        end loop;


        -- Count down from max to min

        for count in 0 to 256 loop

            -- Generate quadrature signals (simplified CCW)
            case count mod 4 is
                when 0 => A <= '0'; B <= '0';
                when 1 => A <= '1'; B <= '0';
                when 2 => A <= '1'; B <= '1';
                when others => A <= '0'; B <= '1';
            end case;

            wait for CLK_PERIOD;
        end loop;

        -- Stop simulation

        wait;
    end process;


end architecture sim;
