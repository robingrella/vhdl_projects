library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.ALL;


entity alu is 
port(
	SEL: in std_logic_vector(3 downto 0);
	INP_A: in signed (3 downto 0);
	INP_B: in signed (3 downto 0);
	OUT_ALU: out signed (3 downto 0)
	);
end alu;

architecture behave of alu is
BEGIN
   PROCESS (SEL, INP_A , INP_B)                               
   BEGIN
	case SEL is
	when "0000" =>
	OUT_ALU <= INP_A + INP_B;
	when "0001" =>
	OUT_ALU <= INP_A - INP_B;
	when "0010" =>
	OUT_ALU <= INP_A + 1;
	when "0011" =>
	OUT_ALU <= INP_A - 1;
	when "0100" =>
	OUT_ALU <= INP_A and INP_B;
	when "0101" =>
	OUT_ALU <= INP_A or INP_B;
	when "0110" =>
	OUT_ALU <= not INP_A;
	when "0111" =>
	OUT_ALU <= INP_A xor INP_B;
	when others => 
	OUT_ALU <= INP_A + INP_B;
	end case;
   END PROCESS;
end behave;