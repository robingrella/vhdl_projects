library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

entity serial_parallel is 
port(
	clk, reset: in std_logic :='0';
	input_data: in std_logic;
	output_data: out std_logic_vector(3 downto 0)
	);
end serial_parallel;

architecture behave of serial_parallel is
SIGNAL shift_reg :std_logic_vector (3 downto 0):= "0000"; 

BEGIN
   PROCESS (clk, reset)                                 -- Process der Zähler
   BEGIN
		IF reset = '1' THEN
		shift_reg <= '0000';
		output_data <= shift_reg;
		ELSIF rising_edge(clk) THEN
		shift_reg(3) <= shift_reg(2);
		shift_reg(2) <= shift_reg(1);
		shift_reg(1) <= shift_reg(0);
		shift_reg(0) <= input_data;
		output_data <= shift_reg;
		END IF;
      END IF;
   END PROCESS;

end behave;