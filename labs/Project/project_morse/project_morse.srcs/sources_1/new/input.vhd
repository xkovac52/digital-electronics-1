----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2023 12:01:56 PM
-- Design Name: 
-- Module Name: input - Behavioral
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

entity input is
Port (
    clk         :   in      std_logic;
    rst         :   in      std_logic;
    dot         :   in      std_logic;
    dash        :   in      std_logic;
    letter      :   out     std_logic_vector(9 downto 0)
);
end input;

architecture Behavioral of input is

signal sig_let      : std_logic_vector(9 downto 0) := "0000000000";
signal c            : integer := 0;
signal no_sig       : integer := 0;
signal sig_en_4ms   : std_logic;

begin

clk_en0 : entity work.clock_enable
    generic map (
      -- FOR SIMULATION, KEEP THIS VALUE TO 4
      -- FOR IMPLEMENTATION, CHANGE THIS VALUE TO 400,000
      -- 4      @ 4 ns
      -- 400000 @ 4 ms
      g_MAX => 4
    )
    port map (
      clk => clk,
      rst => rst,
      ce  => sig_en_4ms
    );

    P_reader : process (clk) is
    begin
    if (rising_edge(clk)) then
            if(rst = '1' or c >8) then
                if(c > 8 or no_sig > 9) then
                letter <= sig_let;
                end if;
			     sig_let <= "0000000000";
			     c<= 0;
				 no_sig<= 0;
            else            
                  if(dot = '1' and dash = '0') then
			         sig_let(9-c) <= '0';
			         sig_let(9-c-1) <= '1';
			         c<= c+2;
					 no_sig<= 0;
                  elsif(dot = '0' and dash = '1') then
			         sig_let(9-c) <= '1';
			         sig_let(9-c-1) <= '1';
			         c<= c+2;
					 no_sig<= 0;
                   else
			         no_sig<= no_sig+1;
			         end if;   
            end if;   
     end if;       
    end process P_reader;
end architecture behavioral;