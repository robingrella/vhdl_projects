library ieee;
use ieee.std_logic_1164.all;

entity prioritaetsdekoder_tb is 
end prioritaetsdekoder_tb;

architecture behave of prioritaetsdekoder_tb is

component prioritaetsdekoder
	port
	(
		i: in std_logic_vector(6 downto 0);
		o: out std_logic_vector(2 downto 0)
	);
end component;
signal i: std_logic_vector(6 downto 0);
signal o: std_logic_vector(2 downto 0);
begin

pr: prioritaetsdekoder port map(i => i, o=>o);

	process begin
		i<= "0000000";
		wait for 1 ns;
		
		i<= "0000001";
		wait for 1 ns;
		
		i<= "0111111";
		wait for 1 ns;
		
		i<= "0000111";
		wait for 1 ns;
		
		assert false report "Reached end of test";
		wait;
		
	end process;
	


end behave;