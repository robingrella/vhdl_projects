library ieee;
use ieee.std_logic_1164.all;

entity bitmustererkennung_tb is 
end bitmustererkennung_tb;

architecture behave of bitmustererkennung_tb is

component bitmustererkennung
port(
	clk, reset, enable: in std_logic;
	i: in std_logic;
	o: out std_logic

	);
end component;

signal clk, reset: std_logic := '0';
signal i: std_logic := '0';
signal o: std_logic := '0';

begin

bit_erkennung: bitmustererkennung port map(clk => clk, reset=>reset, i => i, o => o );

	process begin
		
		clk<= '1';
		input_data <= '0';
		input_data <= '0';
		input_data <= '1';
		input_data <= '0';
		input_data <= '1';
		input_data <= '1';
		input_data <= '0';
		input_data <= '1';
		input_data <= '0';
		input_data <= '0';
		input_data <= '1';
		input_data <= '0';

		assert false report "Reached end of test";
		wait;
		
	end process;
end behave;