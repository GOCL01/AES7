-------------------------------------------------------------------------
-- Component: tb_top_PWM.vhd
-- Short Description: Testbench for three-channel PWM
-- Institution : Applied Science University Fonty 
-- Author  : Lizeth Gonzalez Carabarin
-------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_top_PWM is
end tb_top_PWM;

architecture Behavioral of tb_top_PWM is

    ----------------------------------------------------------------------
    -- Generic values to match top_PWM
    ----------------------------------------------------------------------
    constant POWER_WIDTH1 : integer := 16;
    constant MAX_POWER1   : integer := 50000;

    constant POWER_WIDTH2 : integer := 15;
    constant MAX_POWER2   : integer := 25000;

    constant POWER_WIDTH3 : integer := 14;
    constant MAX_POWER3   : integer := 12500;

    ----------------------------------------------------------------------
    -- DUT signal declarations
    ----------------------------------------------------------------------
    signal CLK_tb  : std_logic := '0';
    signal RST_tb  : std_logic := '1';

    signal power1_tb : std_logic_vector(POWER_WIDTH1-1 downto 0) := (others => '0');
    signal power2_tb : std_logic_vector(POWER_WIDTH2-1 downto 0) := (others => '0');
    signal power3_tb : std_logic_vector(POWER_WIDTH3-1 downto 0) := (others => '0');

    signal PWMout1_tb   : std_logic;
    signal PWMdir1_tb   : std_logic;
    signal PWMerror1_tb : std_logic;

    signal PWMout2_tb   : std_logic;
    signal PWMdir2_tb   : std_logic;
    signal PWMerror2_tb : std_logic;

    signal PWMout3_tb   : std_logic;
    signal PWMdir3_tb   : std_logic;
    signal PWMerror3_tb : std_logic;

    constant CLK_PERIOD : time := 8 ns;  -- 125 MHz clock

begin

    ----------------------------------------------------------------------
    -- Instantiate DUT
    ----------------------------------------------------------------------
    DUT : entity work.top_PWM
        generic map (
            POWER_WIDTH1 => POWER_WIDTH1,
            MAX_POWER1   => MAX_POWER1,
            POWER_WIDTH2 => POWER_WIDTH2,
            MAX_POWER2   => MAX_POWER2,
            POWER_WIDTH3 => POWER_WIDTH3,
            MAX_POWER3   => MAX_POWER3
        )
        port map (
            CLK      => CLK_tb,
            RST      => RST_tb,
            power1   => power1_tb,
            power2   => power2_tb,
            power3   => power3_tb,
            PWMout1  => PWMout1_tb,
            PWMdir1  => PWMdir1_tb,
            PWMerror1=> PWMerror1_tb,
            PWMout2  => PWMout2_tb,
            PWMdir2  => PWMdir2_tb,
            PWMerror2=> PWMerror2_tb,
            PWMout3  => PWMout3_tb,
            PWMdir3  => PWMdir3_tb,
            PWMerror3=> PWMerror3_tb
        );

    ----------------------------------------------------------------------
    -- Clock process
    ----------------------------------------------------------------------
    CLK_process : process
    begin
        while true loop
            CLK_tb <= '0';
            wait for CLK_PERIOD/2;
            CLK_tb <= '1';
            wait for CLK_PERIOD/2;
        end loop;
    end process;

    ----------------------------------------------------------------------
    -- Test cases
    ----------------------------------------------------------------------
    stim_proc : process
    begin

        -- Reset pulse
        RST_tb <= '1';
        wait for 50 ns;
        RST_tb <= '0';
        wait for 100 ns;

        ---------------------------------------------------------------
        -- Test 1: All zeros
        ---------------------------------------------------------------
        power1_tb <= std_logic_vector(to_signed(0, POWER_WIDTH1));
        power2_tb <= std_logic_vector(to_signed(0, POWER_WIDTH2));
        power3_tb <= std_logic_vector(to_signed(0, POWER_WIDTH3));
        wait for 400 us;

        ---------------------------------------------------------------
        -- Test 2: Mid values
        ---------------------------------------------------------------
        power1_tb <= std_logic_vector(to_signed(---, POWER_WIDTH1));
        power2_tb <= std_logic_vector(to_signed(----, POWER_WIDTH2));
        power3_tb <= std_logic_vector(to_signed(----,  POWER_WIDTH3));
        wait for 400 us;

        ---------------------------------------------------------------
        -- Test 3: Max allowed values
        ---------------------------------------------------------------
        power1_tb <= std_logic_vector(to_signed(MAX_POWER1, POWER_WIDTH1));
        power2_tb <= std_logic_vector(to_signed(MAX_POWER2, POWER_WIDTH2));
        power3_tb <= std_logic_vector(to_signed(MAX_POWER3, POWER_WIDTH3));
        wait for 400 us;

        ---------------------------------------------------------------
        -- Test 4: Negative values
        ---------------------------------------------------------------
        power1_tb <= std_logic_vector(to_signed(----, POWER_WIDTH1));
        power2_tb <= std_logic_vector(to_signed(----,  POWER_WIDTH2));
        power3_tb <= std_logic_vector(to_signed(----,  POWER_WIDTH3));
        wait for 400 us;

        ---------------------------------------------------------------
        -- Test 5: Out-of-range values (should trigger PWMerror)
        ---------------------------------------------------------------
        power1_tb <= std_logic_vector(to_signed(----, POWER_WIDTH1)); -- > MAX_POWER1
        power2_tb <= std_logic_vector(to_signed(----, POWER_WIDTH2)); -- > MAX_POWER2
        power3_tb <= std_logic_vector(to_signed(---, POWER_WIDTH3)); -- > MAX_POWER3
        wait for 400 us;
        --- you can add more test scenarios
        wait;
    end process;

end Behavioral;
