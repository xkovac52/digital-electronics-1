----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2023 11:45:33 AM
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
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC);
end top;

architecture Behavioral of top is

begin

--------------------------------------------------------------------
  -- Instance (copy) of hex_7seg entity
  --------------------------------------------------------------------

  hex2seg : entity work.hex_7seg
    port map (
      blank  => BTNC,
      hex    => SW,
      seg(6) => CA,
      seg(5) => CB,
      seg(4) => CC,
      seg(3) => CD,
      seg(2) => CE,
      seg(1) => CF,
      seg(0) => CG
    );

  -- Connect one common anode to 3.3V
  AN <= b"0111_1111";

  -- Display input value on LEDs
  LED(3 downto 0) <= SW;

--------------------------------------------------------------------
-- Experiments on your own: LED(7:4) indicators

-- Turn LED(4) on if input value is equal to 0, ie "0000"
-- LED(4) <= WRITE YOUR CODE HERE

-- Turn LED(5) on if input value is greater than "1001", ie 10, 11, 12, ...
-- LED(5) <= WRITE YOUR CODE HERE

-- Turn LED(6) on if input value is odd, ie 1, 3, 5, ...
-- LED(6) <= WRITE YOUR CODE HERE

-- Turn LED(7) on if input value is a power of two, ie 1, 2, 4, or 8
-- LED(7) <= WRITE YOUR CODE HERE

with SW select          --0 to 3--
    LED(7 downto 4) <=  "0001" when "0000", --1
                        "1100" when "0001", --12/C
                        "1000" when "0010",	--8
                        "0100" when "0011",	--4
                        --4 to 7--
                        "1000" when "0100",	--8
                        "0100" when "0101",	--4
                        "0000" when "0110",	--0
                        "0100" when "0111",	--4
                        --8 to 11
                        "1000" when "1000",	--8
                        "0100" when "1001",	--4
                        "0010" when "1010",	--2
                        "0110" when "1011",	--6
                        --12 to 15
                        "0010" when "1100",	--2
                        "0110" when "1101",	--6
                        "0010" when "1110",	--2
                        "0110" when others;	--6

end architecture Behavioral;
