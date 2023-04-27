----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 04/12/2023 11:32:30 AM
-- Design Name:
-- Module Name: topHEX_7seg - Behavioral
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

entity tophex_7seg is
  port (
    ca        : out   std_logic;
    cb        : out   std_logic;
    cc        : out   std_logic;
    cd        : out   std_logic;
    ce        : out   std_logic;
    cf        : out   std_logic;
    cg        : out   std_logic;
    an        : out   std_logic_vector(7 downto 0);
    btnc      : in    std_logic;
    clk100mhz : in    std_logic;
    btnl      : in    std_logic;
    btnr      : in    std_logic;
    led       : in    std_logic
  );
end entity tophex_7seg;

architecture behavioral of tophex_7seg is

  signal sig_en       : std_logic;
  signal sig_en_25    : std_logic;
  signal sig_7segment : std_logic_vector(9 downto 0);

begin

  hex2seg : entity work.hex_7seg

    port map (
      blank  => btnc,
      hex    => sig_7segment,
      seg(6) => ca,
      seg(5) => cb,
      seg(4) => cc,
      seg(3) => cd,
      seg(2) => ce,
      seg(1) => cf,
      seg(0) => cg
    );

  input : entity work.receiver
    port map (
      clk    => clk100mhz,
      rst    => btnc,
      en     => sig_en,
      input  => led,
      output => sig_7segment
    );

  clk_en0 : entity work.clock_enable
    generic map (
      -- FOR SIMULATION, KEEP THIS VALUE TO 4
      -- FOR IMPLEMENTATION, CHANGE THIS VALUE TO 400,000
      -- 4      @ 4 ns
      -- 400000 @ 4 ms
      g_max => 25000000
    )
    port map (
      clk => clk100mhz,
      rst => btnc,
      ce  => sig_en
    );

  an <= b"1111_1110";

end architecture behavioral;
