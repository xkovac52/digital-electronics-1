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
    rst         :   in    std_logic;
    dot         :   in    std_logic;
    dash        :   in    std_logic;
    send        :   in    std_logic;
    letter      :   out std_logic_vector(9 downto 0)
);

end input;

architecture Behavioral of input is

signal sig_let  : std_logic_vector(9 downto 0);
signal c        : integer := 0;

begin
    P_reader : process is
    begin
    toBits(9)<= '0'; --Zjednoduši? a odstarni? case when
    toBits(8)<= '1';
		if(c > 4) then
			c = 0;
			sig_let <= "0000000000";
		end if;
        if(dot = '1') then
			sig_let(9-c) <= '0';
			sig_let(9-c-1) <= '1';
			c<= c+2;
        end if;
        if(dash = '1') then
			sig_let(9-c) <= '1';
			sig_let(9-c-1) <= '1';
			c<= c+2;
        end if;
        if(rst = '1') then
			sig_let <= "0000000000";
			c<= 0;
        end if;
        if(send = '1') then
			letter <= sig_let;
        end if;    
  end process P_reader;
end Behavioral;
