# digital-electronics-1
# Header 1
## *Header 2*
### **Header 3**

1. First item
2. Second item
3. Third item
4. Fourth item

[Link na VUT](https://www.vut.cz)

First | Second
------|-------
C11|C12
C21|C22

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity depun_mux_out is
Port ( in1 : in std_logic; -- mux input1
in2 : in std_logic; -- mux input2
in3 : in std_logic; -- mux input3
in4 : in std_logic; -- mux input4
sel : in std_logic_vector(1 downto 0); -- selection line
dataout : out std_logic); -- output data
end depun_mux_out;

architecture Behavioral of depun_mux_out is

begin
-- This process for mux logic
process (sel, in1, in2, in3, in4)
begin
case SEL is
when "00" => dataout <= in1;
when "01" => dataout <= in2;
when "10" => dataout <= in3;
when "11" => dataout <= in4;
when others => dataout <= '0';
end case;
end process;

end Behavioral;
```
