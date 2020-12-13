library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.ALL;


entity systolisches_array is 
port(
	clk, reset: in std_logic;
	in_a0: in signed (7 downto 0);
	in_a1: in signed (7 downto 0);
	in_a2: in signed (7 downto 0);
	in_b0: in signed (7 downto 0);
	in_b1: in signed (7 downto 0);
	in_b2: in signed (7 downto 0);
	out_c00: out signed (15 downto 0);
	out_c01: out signed (15 downto 0);
	out_c02: out signed (15 downto 0);
	out_c10: out signed (15 downto 0);
	out_c11: out signed (15 downto 0);
	out_c12: out signed (15 downto 0);
	out_c20: out signed (15 downto 0);
	out_c21: out signed (15 downto 0);
	out_c22: out signed (15 downto 0)
	);
end systolisches_array;

architecture behave of systolisches_array is

component systolische_zelle is
port(
	clk, reset: in std_logic;
	input_left: in signed (7 downto 0);
	input_top: in signed (7 downto 0);
	output_right: out signed (7 downto 0);
	output_bottom: out signed (7 downto 0);
	cell_output: out signed (15 downto 0)
	);
end component;

signal c00_right, c00_bottom, c01_right, c01_bottom, c02_right, c02_bottom: signed (7 downto 0);
signal c10_right, c10_bottom, c11_right, c11_bottom, c12_right, c12_bottom: signed (7 downto 0);
signal c20_right, c20_bottom, c21_right, c21_bottom, c22_right, c22_bottom: signed (7 downto 0);

BEGIN

	zelle00: systolische_zelle
	port map (clk, reset, in_a0, in_b0, c00_right, c00_bottom, out_c00);
	
	zelle01: systolische_zelle
	port map (clk, reset, c00_right, in_b1, c01_right, c01_bottom, out_c01);
	
	zelle02: systolische_zelle
	port map (clk, reset, c01_right, in_b2, c02_right, c02_bottom, out_c02);
	
	zelle10: systolische_zelle
	port map (clk, reset, in_a1, c00_bottom, c10_right, c10_bottom, out_c10);
	
	zelle11: systolische_zelle
	port map (clk, reset, c10_right, c01_bottom, c11_right, c11_bottom, out_c11);
	
	zelle12: systolische_zelle
	port map (clk, reset, c11_right, c02_bottom, c12_right, c12_bottom, out_c12);
	
	zelle20: systolische_zelle
	port map (clk, reset, in_a2, c10_bottom, c20_right, c20_bottom, out_c20);
	
	zelle21: systolische_zelle
	port map (clk, reset, c20_right, c11_bottom, c21_right, c21_bottom, out_c21);
	
	zelle22: systolische_zelle
	port map (clk, reset, c21_right, c12_bottom, c22_right, c22_bottom, out_c22);

end behave;