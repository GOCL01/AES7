library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity mul is
generic( length : integer);
  port(
    clk : in std_logic;
    a   : in std_logic_vector(length-1 downto 0);
    b   : in std_logic_vector(length-1 downto 0);
    checker : out std_logic;
    out_mul   : out std_logic_vector(2*length-1 downto 0)
  );
end mul;

architecture IMP of mul is
signal s_out_mul :std_logic_vector(2*length-1 downto 0);
begin
  process (clk)
  begin
    if rising_edge(clk) then
      s_out_mul <= a * b;
      if s_out_mul = std_logic_vector(to_signed(0,out_mul'length)) then 
        checker <= '1';
      else
        checker <= '0';
      end if;
    end if;
  end process;
 out_mul <= s_out_mul;
end IMP;
