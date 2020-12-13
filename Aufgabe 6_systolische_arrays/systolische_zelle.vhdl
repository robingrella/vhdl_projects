library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.ALL;


entity systolische_zelle is 
port(
	clk, reset: in std_logic;
	input_left: in signed (7 downto 0);
	input_top: in signed (7 downto 0);
	output_right: out signed (7 downto 0);
	output_bottom: out signed (7 downto 0);
	cell_output: out signed (15 downto 0)
	);
end systolische_zelle;

architecture behave of systolische_zelle is

signal store_cell: signed (15 downto 0);

BEGIN
   PROCESS (clk)                               
   BEGIN
	if (clk'event and clk = '1') then
		if reset = '1' then 
			store_cell <= store_cell + (input_left * input_top);
			output_right <= input_left;
			output_bottom <= input_top;
		else 
			store_cell <= "0000000000000000";
		end if;
	END IF;
   END PROCESS;
   cell_output <= store_cell;
end behave;