library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

entity alu_tb is 
end alu_tb;

architecture behave of alu_tb is

component alu
port(
	SEL: in std_logic_vector(3 downto 0);
	INP_A: in signed (3 downto 0);
	INP_B: in signed (3 downto 0);
	OUT_ALU: out signed (3 downto 0)
	);
end component;

signal SEL: std_logic_vector(3 downto 0) := (others => '0');
signal INP_A: signed (3 downto 0) := (others => '0');
signal INP_B: signed (3 downto 0) := (others => '0');
signal OUT_ALU: signed (3 downto 0);
begin

alutest: alu port map(SEL => SEL, INP_A => INP_A, INP_B => INP_B, OUT_ALU => OUT_ALU);

	process begin
		INP_A <= "0001";
		INP_B <= "0100";

		SEL <= "0000";
		wait for 1 ns;
		SEL <= "0001";
		wait for 1 ns;
		SEL <= "0010";
		wait for 1 ns;
		SEL <= "0011";
		wait for 1 ns;
		SEL <= "0100";
		wait for 1 ns;
		SEL <= "0101";
		wait for 1 ns;
		SEL <= "0110";
		wait for 1 ns;
		SEL <= "0111";
		wait for 1 ns;

		assert false report "Reached end of test";
		wait;
		
	end process;
end behave;