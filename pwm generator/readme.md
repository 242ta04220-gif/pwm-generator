
A parameterized Pulse Width Modulation (PWM) generator designed using Verilog HDL.

 Features

- Parameterized counter width
- Adjustable duty cycle
- Simple RTL implementation
- Active-high reset
- Simulation testbench included
- Compatible with common Verilog simulators

 Block Diagram

Clock + Reset + Duty Cycle
          |
          v
   +---------------+
   | PWM Generator |
   +---------------+
          |
          v
       PWM OUT

 Duty Cycle

For an 8-bit counter:

| Duty Cycle | Value |
|------------|-------|
| 0%         | 0     |
| 25%        | 64    |
| 50%        | 128   |
| 75%        | 192   |
| ~100%      | 255   |

PWM Frequency

The PWM frequency is approximately:

F_PWM = F_CLK / 2^COUNTER_WIDTH

For example, with an 8-bit counter and a 50 MHz clock:

F_PWM = 50 MHz / 256
      ≈ 195.3 kHz