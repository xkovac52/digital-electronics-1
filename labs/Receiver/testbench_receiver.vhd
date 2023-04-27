----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 04/12/2023 11:04:12 AM
-- Design Name:
-- Module Name: tb_input - Behavioral
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

library ieee;
  use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity testbench_receiver is
--  Port ( );
end entity testbench_receiver;

architecture behavioral of testbench_receiver is

  constant c_clk_100mhz_period : time := 10 ns;

  signal sig_clk_100mhz : std_logic;
  signal s_rst          : std_logic;
  signal s_in           : std_logic;
  signal s_en           : std_logic;
  signal s_out          : std_logic_vector(9 downto 0);

begin

  uut_receiver : entity work.receiver
    port map (
      clk    => sig_clk_100mhz,
      rst    => s_rst,
      en     => s_en,
      input  => s_in,
      output => s_out
    );

  p_clk_gen : process is
  begin

    while now < 400 ns loop -- 40 periods of 100MHz clock

      sig_clk_100mhz <= '0';
      wait for c_clk_100mhz_period / 2;
      sig_clk_100mhz <= '1';
      wait for c_clk_100mhz_period / 2;

    end loop;

    wait;

  end process p_clk_gen;

  p_input_gen : process is
  begin

    s_in <= '0';
    wait for 10 ns;
    s_in <= '1';
    wait for 10 ns;
    s_in <= '0';
    wait for 10 ns;
    s_in <= '1';
    wait for 30 ns;
    s_in <= '0';
    wait for 10 ns;
    s_in <= '1';
    wait for 10 ns;
    s_in <= '0';
    wait for 10 ns;
    s_in <= '1';
    wait for 30 ns;
    s_in <= '0';
    wait for 10 ns;
    s_in <= '1';
    wait for 30 ns;
    s_in <= '0';
    wait;

  end process p_input_gen;

end architecture behavioral;

