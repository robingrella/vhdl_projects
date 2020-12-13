library ieee;
use ieee.std_logic_1164.all;

entity eins_aus_n_dekoder_tb is 
end eins_aus_n_dekoder_tb;

architecture behave of eins_aus_n_dekoder_tb is

component eins_aus_n_dekoder
port(
	i: in std_logic_vector(2 downto 0);
	o: out std_logic_vector(4 downto 0)
	);
end component;

signal i: std_logic_vector(2 downto 0);
signal o: std_logic_vector(4 downto 0);
begin

einsausndek: eins_aus_n_dekoder port map(i => i, o=>o);

	process begin
		i<= "000";
		wait for 1 ns;
		
		i<= "001";
		wait for 1 ns;
		
		i<= "011";
		wait for 1 ns;
		
		i<= "111";
		wait for 1 ns;
		
		assert false report "Reached end of test";
		wait;
		
	end process;
	


end behave;