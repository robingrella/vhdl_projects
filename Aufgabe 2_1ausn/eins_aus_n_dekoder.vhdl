library ieee;
use ieee.std_logic_1164.all;

entity eins_aus_n_dekoder is 
port(
	i: in std_logic_vector(2 downto 0);
	o: out std_logic_vector(4 downto 0)
	);
end eins_aus_n_dekoder;

architecture behave of eins_aus_n_dekoder is
begin
with i select
o<= "00001" when "000",
	"00010" when "001",
	"00100" when "010",
	"01000" when "011",
	"10000" when "100",
	"00000" when others;
end behave;