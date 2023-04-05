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

signal sig_let  : String(0 to 4) := "UUUUU";
signal c        : integer := 0;
signal toBits   : std_logic_vector(9 downto 0);

begin
    P_reader : process is
    begin
    toBits(9)<= '0'; --Zjednoduši? a odstarni? case when
    toBits(8)<= '1';
        if(dot = '1') then
        sig_let(c) <= 'T';
        c<= c+1;
        end if;
        if(dash = '1') then
        sig_let(c) <= 'C';
        c<= c+1;
        end if;
        if(rst = '1') then
        sig_let <= "UUUUU";
        c<= 0;
        end if;
        if(send = '1') then
        c<= 0;
        end if;    
  end process P_reader;
  P_convertor : process is
    begin
       case sig_let is 
            when "TCUUU" => --A
            toBits <= "0111000000";
            when "CTTTU" => --B
            toBits <= "0111000000";
            when "CTCTU" => --C
            toBits <= "0111000000";
            when "CTT" => --D
            toBits <= "0111000000";
            --------------------------
            when "TUUUU" => --E
            toBits <= "0111000000";
            when "TTCTU" => --F
            toBits <= "0111000000";
            when "CCTUU" => --G
            toBits <= "0111000000";
            when "TTTTU" => --H
            toBits <= "0111000000";
            --------------------------
            when "TCUUU" => --I
            toBits <= "0111000000";
            when "TCUUU" => --J
            toBits <= "0111000000";
            when "TCUUU" => --K
            toBits <= "0111000000";
            when "TCUUU" => --L
            toBits <= "0111000000";
            --------------------------
            when "TCUUU" => --M
            toBits <= "0111000000";
            when "TCUUU" => --N
            toBits <= "0111000000";
            when "TCUUU" => --O
            toBits <= "0111000000";
            when "TCUUU" => --P
            toBits <= "0111000000";
            --------------------------
            when "TCUUU" => --Q
            toBits <= "0111000000";
            when "TCUUU" => --R
            toBits <= "0111000000";
            when "TCUUU" => --S
            toBits <= "0111000000";
            when "TCUUU" => --T
            toBits <= "0111000000";
           --------------------------
            when "TCUUU" => --U
            toBits <= "0111000000";
            when "TCUUU" => --V
            toBits <= "0111000000";
            when "TCUUU" => --W
            toBits <= "0111000000";
            when "TCUUU" => --X
            toBits <= "0111000000";
            --------------------------
            when "TCCCC" => --Y
            toBits <= "1111111111"; 
            when "TTCCC" => --Z
            toBits <= "1111111111"; 
            when "TCCCC" => --1
            toBits <= "1111111111"; 
            when "TTCCC" => --2
            toBits <= "1111111111"; 
            --------------------------
            when "TTTCC" => --3
            toBits <= "1111111111"; 
            when "TTTTC" => --4
            toBits <= "1111111111"; 
            when "TTTTT" => --5
            toBits <= "1111111111"; 
            when "CTTTT" => --6
            --------------------------
            toBits <= "1111111111"; 
            when "CCTTT" => --7
            toBits <= "1111111111"; 
            when "CCCTT" => --8
            toBits <= "1111111111"; 
            when "CCCCT" => --9
            toBits <= "1111111111";  
            when others => --0
            toBits <= "1111111111"; 
            --------------------------
        end case;    
  end process P_convertor;
end Behavioral;
