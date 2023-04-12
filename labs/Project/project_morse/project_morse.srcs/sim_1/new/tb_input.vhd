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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_input is
--  Port ( );
end tb_input;

architecture Behavioral of tb_input is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    signal sig_clk_100mhz : std_logic;
    signal s_rst    :   std_logic;
    signal s_dot    :   std_logic;
    signal s_dash   :   std_logic;
    signal s_letter :   std_logic_vector(9 downto 0);
    
begin

 uut_input : entity work.input
    port map (
        clk => sig_clk_100mhz,
        rst => s_rst,
        dot => s_dot,
        dash => s_dash,
        letter => s_letter
    );

p_clk_gen : process is
  begin

    while now < 400 ns loop -- 40 periods of 100MHz clock

      sig_clk_100mhz <= '0';
      wait for c_CLK_100MHZ_PERIOD / 2;
      sig_clk_100mhz <= '1';
      wait for c_CLK_100MHZ_PERIOD / 2;

    end loop;
    wait;

  end process p_clk_gen;

  p_input_gen : process is
  begin
        s_dot   <= '1';
        s_dash  <= '0';
        wait for 10 ns;
        s_dot   <= '0';
        s_dash  <= '1';
        wait for 10 ns;
        s_dot   <= '1';
        s_dash  <= '0';
        wait for 10 ns;
        s_dot   <= '0';
        s_dash  <= '1';
        wait for 10 ns;
        s_dot   <= '0';
        s_dash  <= '1';
        wait for 10 ns;
  end process p_input_gen;

end Behavioral;
