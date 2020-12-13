library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

entity ampelsteuerung is 
port(
	clk, reset: in std_logic :='0';
	output_hauptampel_gruen: out std_logic:='0';
	output_hauptampel_rot: out std_logic:='0';
	output_hauptampel_gelb: out std_logic:='0';
	output_nebenampel_gruen: out std_logic:='0';
	output_nebenampel_rot: out std_logic:='0';
	output_nebenampel_gelb: out std_logic:='0'
	);
end ampelsteuerung;

architecture behave of ampelsteuerung is
SIGNAL counter :unsigned (3 downto 0):= "0000"; 

BEGIN
   PROCESS (clk, reset)                                 -- Process der Zähler
   BEGIN
		IF rising_edge(clk) THEN
		counter <= counter +1;
		IF(counter = "0000") THEN
		output_hauptampel_gruen <= '1';
		output_hauptampel_rot <= '0';
		output_hauptampel_gelb <= '0';
		output_nebenampel_gruen <= '0';
		output_nebenampel_rot <= '1';
		output_nebenampel_gelb <= '0';
		
        ELSIF(counter = "0001") THEN
		output_hauptampel_gruen <= '1';
		output_hauptampel_rot <= '0';
		output_hauptampel_gelb <= '0';
		output_nebenampel_gruen <= '0';
		output_nebenampel_rot <= '1';
		output_nebenampel_gelb <= '0';
		
		ELSIF(counter = "0010") THEN
		output_hauptampel_gruen <= '1';
		output_hauptampel_rot <= '0';
		output_hauptampel_gelb <= '0';
		output_nebenampel_gruen <= '0';
		output_nebenampel_rot <= '1';
		output_nebenampel_gelb <= '0';
		
		ELSIF(counter = "0011") THEN
		output_hauptampel_gruen <= '1';
		output_hauptampel_rot <= '0';
		output_hauptampel_gelb <= '0';
		output_nebenampel_gruen <= '0';
		output_nebenampel_rot <= '1';
		output_nebenampel_gelb <= '0';
		
		ELSIF(counter = "0100") THEN
		output_hauptampel_gruen <= '1';
		output_hauptampel_rot <= '0';
		output_hauptampel_gelb <= '0';
		output_nebenampel_gruen <= '0';
		output_nebenampel_rot <= '1';
		output_nebenampel_gelb <= '0';
		
		ELSIF(counter = "0101") THEN
		output_hauptampel_gruen <= '1';
		output_hauptampel_rot <= '0';
		output_hauptampel_gelb <= '0';
		output_nebenampel_gruen <= '0';
		output_nebenampel_rot <= '1';
		output_nebenampel_gelb <= '0';
		
		ELSIF(counter = "0110") THEN
		output_hauptampel_gruen <= '1';
		output_hauptampel_rot <= '0';
		output_hauptampel_gelb <= '0';
		output_nebenampel_gruen <= '0';
		output_nebenampel_rot <= '1';
		output_nebenampel_gelb <= '0';
		
		ELSIF(counter = "0111") THEN
		output_hauptampel_gruen <= '0';
		output_hauptampel_rot <= '0';
		output_hauptampel_gelb <= '1';
		output_nebenampel_gruen <= '0';
		output_nebenampel_rot <= '1';
		output_nebenampel_gelb <= '0';
		
		ELSIF(counter = "1000") THEN
		output_hauptampel_gruen <= '0';
		output_hauptampel_rot <= '1';
		output_hauptampel_gelb <= '0';
		output_nebenampel_gruen <= '0';
		output_nebenampel_rot <= '1';
		output_nebenampel_gelb <= '0';
		
		ELSIF(counter = "1001") THEN
		output_hauptampel_gruen <= '0';
		output_hauptampel_rot <= '1';
		output_hauptampel_gelb <= '0';
		output_nebenampel_gruen <= '0';
		output_nebenampel_rot <= '1';
		output_nebenampel_gelb <= '1';
		
		ELSIF(counter = "1010") THEN
		output_hauptampel_gruen <= '0';
		output_hauptampel_rot <= '1';
		output_hauptampel_gelb <= '0';
		output_nebenampel_gruen <= '1';
		output_nebenampel_rot <= '0';
		output_nebenampel_gelb <= '0';
	
		ELSIF(counter = "1011") THEN
		output_hauptampel_gruen <= '0';
		output_hauptampel_rot <= '1';
		output_hauptampel_gelb <= '0';
		output_nebenampel_gruen <= '1';
		output_nebenampel_rot <= '0';
		output_nebenampel_gelb <= '0';
		
		ELSIF(counter = "1100") THEN
		output_hauptampel_gruen <= '0';
		output_hauptampel_rot <= '1';
		output_hauptampel_gelb <= '0';
		output_nebenampel_gruen <= '1';
		output_nebenampel_rot <= '0';
		output_nebenampel_gelb <= '0';
		ELSIF(counter = "1101") THEN
		output_hauptampel_gruen <= '0';
		output_hauptampel_rot <= '1';
		output_hauptampel_gelb <= '0';
		output_nebenampel_gruen <= '0';
		output_nebenampel_rot <= '0';
		output_nebenampel_gelb <= '1';
		ELSIF(counter = "1110") THEN
		output_hauptampel_gruen <= '0';
		output_hauptampel_rot <= '1';
		output_hauptampel_gelb <= '0';
		output_nebenampel_gruen <= '0';
		output_nebenampel_rot <= '1';
		output_nebenampel_gelb <= '0';
		ELSIF(counter = "1111") THEN
		output_hauptampel_gruen <= '0';
		output_hauptampel_rot <= '1';
		output_hauptampel_gelb <= '1';
		output_nebenampel_gruen <= '0';
		output_nebenampel_rot <= '1';
		output_nebenampel_gelb <= '0';
		counter <= counter +1;
		END IF;
      END IF;
   END PROCESS;

end behave;