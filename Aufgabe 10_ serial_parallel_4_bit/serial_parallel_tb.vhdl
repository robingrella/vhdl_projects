library ieee;
use ieee.std_logic_1164.all;

entity serial_parallel_tb is 
end serial_parallel_tb;

architecture behave of serial_parallel_tb is

component serial_parallel
port(
	clk, reset: in std_logic :='0';
	input_data: in std_logic;
	output_data: out std_logic_vector(3 downto 0)

	);
end component;

signal clk, reset: std_logic := '0';
signal input_data: std_logic := '0';
signal output_data: std_logic_vector := '0000';

begin

sepa: serial_parallel port map(clk => clk, reset=>reset, input_data => input_data, output_data => output_data );

	process begin
		
		clk<= '1';
		input_data <= '0';
		input_data <= '0';
		input_data <= '1';
		input_data <= '0';
		input_data <= '1';

		assert false report "Reached end of test";
		wait;
		
	end process;
end behave;