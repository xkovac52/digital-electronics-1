--------------------------------------------------
--
-- Example of basic gates in VHDL.
-- TerosHDL, EDA Playground
--
-- Copyright (c) 2019 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
--------------------------------------------------

library ieee; -- Standard library
  -- Package for data type and logic operations
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

--------------------------------------------------
-- Entity declaration for basic gates
--------------------------------------------------

entity receiver is
  port (
    clk    : in    std_logic;
    rst    : in    std_logic;
    input  : in    std_logic;
    en     : in    std_logic;
    output : out   std_logic_vector(9 downto 0)
  );
end entity receiver;

--------------------------------------------------
-- Architecture body for basic gates
--------------------------------------------------
-- shift_left

architecture behavioral of receiver is

  signal sig_out    : std_logic_vector(9 downto 0) := "0000000000";
  signal sig_tmp    : std_logic_vector(9 downto 0) := "0000000000";
  signal sig_check  : std_logic_vector(2 downto 0) := "000";
  signal counter    : integer                      := 0;
  signal sig_en_4ms : std_logic;

begin

  p_reader : process (clk) is
  begin

    if (rising_edge(clk)) then
      if (en = '1') then
        if (counter > 4) then
          sig_tmp <= sig_out;
          sig_out <= "0000000000";
          counter <= 0;
        end if;

        sig_check <= sig_check(1 downto 0) & input;
        report "Checker is: " & std_logic'image(sig_check(2)) & std_logic'image(sig_check(1)) & std_logic'image(sig_check(0));
        report "Math is:" & integer'image(9 - counter * 2);
        report "Math is:" & integer'image(8 - counter * 2);
        report "Out is: " & std_logic'image(sig_out(9)) & std_logic'image(sig_out(8)) & std_logic'image(sig_out(7)) & std_logic'image(sig_out(6)) & std_logic'image(sig_out(5)) & std_logic'image(sig_out(4)) & std_logic'image(sig_out(3)) & std_logic'image(sig_out(2)) & std_logic'image(sig_out(1)) & std_logic'image(sig_out(0));

        case sig_check is

          when "010" =>

            report "In 010";
            sig_out(9 - counter * 2) <= '0';
            sig_out(8 - counter * 2) <= '1';
            counter                  <= counter + 1;

          when "111" =>

            report "In 111";
            sig_out(9 - counter * 2) <= '1';
            sig_out(8 - counter * 2) <= '1';
            counter                  <= counter + 1;

          when "000" =>

            report "In 000";
            sig_tmp <= sig_out;
            sig_out <= "0000000000";
            counter <= 0;

          when others =>

        end case;

      end if;
    end if;

  end process p_reader;

  output <= sig_tmp;

end architecture behavioral;
