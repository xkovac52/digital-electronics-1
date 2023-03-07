# Lab 5: INSERT_YOUR_FIRSTNAME INSERT_YOUR_LASTNAME

## Pre-Lab preparation

1. Write characteristic equations and complete truth tables for D, JK, T flip-flops where `q(n)` represents main output value before the clock edge and `q(n+1)` represents output value after the clock edge.

   ![Characteristic equations](images/eq_flip_flops.png)
<!--
https://editor.codecogs.com/
\begin{align*}
    q_{n+1}^D =&~D \\
    q_{n+1}^{JK} =&~J\cdot\overline{q_{n}} + \overline{K}\cdot q_{n}\\
    q_{n+1}^T =&~T\cdot\overline{q_{n}} + \overline{T}\cdot q_{n}\\
\end{align*}
-->

   **D-type FF**
   | **clk** | **d** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ↑ | 0 | 0 | 0 | `q(n+1)` has the same level as `d` |
   | ↑ | 0 | 1 | 0 | `q(n+1)` has the same level as `d` |
   | ↑ | 1 | 0 | 1 | `q(n+1)` has the same level as `d` |
   | ↑ | 1 | 1 | 1 | `q(n+1)` has the same level as `d` |

   **JK-type FF**
   | **clk** | **j** | **k** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-: | :-- |
   | ↑ | 0 | 0 | 0 | 0 | Output did not change |
   | ↑ | 0 | 0 | 1 | 1 | Output did not change |
   | ↑ | 0 | 1 | 0 | 0 | Output got reset |
   | ↑ | 0 | 1 | 1 | 0 | Output got reset  |
   | ↑ | 1 | 0 | 0 | 1 | Output got set  |
   | ↑ | 1 | 0 | 1 | 1 | Output got set  |
   | ↑ | 1 | 1 | 0 | 1 | Output got toggled |
   | ↑ | 1 | 1 | 1 | 0 | Output got toggled |

   **T-type FF**
   | **clk** | **t** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ↑ | 0 | 0 | 0 | Output did not change |
   | ↑ | 0 | 1 | 1 | Output did not change |
   | ↑ | 1 | 0 | 1 | Output got inverted |
   | ↑ | 1 | 1 | 0 | Output got inverted |

<a name="part1"></a>


### D & T Flip-flops

1. Screenshot with simulated time waveforms. Try to simulate both D- and T-type flip-flops in a single testbench with a maximum duration of 200 ns, including reset. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![your figure]()

### JK Flip-flop

1. Listing of VHDL architecture for JK-type flip-flop. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture Behavioral of jk_ff_rst is

    -- WRITE YOUR CODE HERE

    -- Output ports are permanently connected to local signal
    q     <= sig_q;
    q_bar <= not sig_q;
end architecture Behavioral;
```

### Shift register

1. Image of `top` level schematic of the 4-bit shift register. Use four D-type flip-flops and connect them properly. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   ![your figure]()