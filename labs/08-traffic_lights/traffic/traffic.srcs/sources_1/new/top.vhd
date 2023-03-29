----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2023 11:43:45 AM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           LED16_R : out STD_LOGIC;
           LED16_G : out STD_LOGIC;
           LED16_B : out STD_LOGIC;
           LED17_R : out STD_LOGIC;
           LED17_G : out STD_LOGIC;
           LED17_B : out STD_LOGIC;
           LED     : out std_logic_vector(15 downto 0);
           BTNU : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           BTNC : in STD_LOGIC);
end top;

architecture behavioral of top is

begin
    ------------------------------------------------------
    -- Instance (copy) of tlc entity
    tlc : entity work.tlc
        port map(
            clk => CLK100MHZ,
            rst => BTNC,
            spd_but => BTNU,
            car_W => BTNL,
            car_S => BTNR,
            south(2) => LED16_R,
            -- MAP OTHER RGB LEDS (SOUTH and WEST) HERE
            south(1) => LED16_G,
            south(0) => LED16_B,
            west(2) => LED17_R,
            west(1) => LED17_G,
            west(0) => LED17_B,
            Delay_show(4) => LED(4),
            Delay_show(3) => LED(3),
            Delay_show(2) => LED(2),
            Delay_show(1) => LED(1),
            Delay_show(0) => LED(0)
        );

end architecture behavioral;
