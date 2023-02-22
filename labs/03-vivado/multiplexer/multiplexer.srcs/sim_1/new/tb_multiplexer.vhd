----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2023 12:13:09 PM
-- Design Name: 
-- Module Name: tb_multiplexer - Behavioral
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

entity tb_multiplexer is
--  Port ( );
end tb_multiplexer;

architecture Behavioral of tb_multiplexer is
        signal s_d           :   std_logic_vector(3 - 1 downto 0);
        signal s_c           :   std_logic_vector(3 - 1 downto 0);
        signal s_b           :   std_logic_vector(3 - 1 downto 0);
        signal s_a           :   std_logic_vector(3 - 1 downto 0);
        signal s_sel         :   std_logic_vector(2 - 1 downto 0);
        signal s_f           :   std_logic_vector(3 - 1 downto 0);
begin

 uut_multiplexer : entity work.multiplexer
        port map(
                d_i => s_d,
                c_i => s_c,
                b_i => s_b,
                a_i => s_a,
                sel_i => s_sel,
                f_o => s_f
        );

 p_stimulus : process is
  begin

    -- Report a note at the beginning of stimulus process
    report "Stimulus process started";
    
    s_d <= "111";
    s_c <= "011";
    s_b <= "001";
    s_a <= "000";
    s_sel <= "00";
    wait for 100 ns;
    s_sel <= "01";
    wait for 100 ns;
    s_sel <= "10";
    wait for 100 ns;
    s_sel <= "11";
    wait for 100 ns;
    
    report "Stimulus process finished";

    wait; -- Data generation process is suspended forever

  end process p_stimulus;

end Behavioral;
