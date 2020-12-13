library ieee;
use ieee.std_logic_1164.all;

entity ampelsteuerung_tb is 
end ampelsteuerung_tb;

architecture behave of ampelsteuerung_tb is

component ampelsteuerung
port(
	clk, reset: in std_logic := '0';
	output_hauptampel_gruen: out std_logic:= '0';
	output_hauptampel_rot: out std_logic:= '0';
	output_hauptampel_gelb: out std_logic:= '0';
	output_nebenampel_gruen: out std_logic:= '0';
	output_nebenampel_rot: out std_logic:= '0';
	output_nebenampel_gelb: out std_logic:= '0'
	);
end component;

signal clk, reset: std_logic := '0';
signal output_hauptampel_gruen: std_logic := '0';
signal output_hauptampel_rot: std_logic := '0';
signal output_hauptampel_gelb: std_logic := '0';
signal output_nebenampel_gruen: std_logic := '0';
signal output_nebenampel_rot: std_logic := '0';
signal output_nebenampel_gelb: std_logic := '0';
begin

ampel: ampelsteuerung port map(clk => clk, reset=>reset, output_hauptampel_gruen => output_hauptampel_gruen, output_hauptampel_rot => output_hauptampel_rot, output_hauptampel_gelb => output_hauptampel_gelb, output_nebenampel_gruen => output_nebenampel_gruen, output_nebenampel_rot => output_nebenampel_rot, output_nebenampel_gelb => output_nebenampel_gelb);

	process begin
		
		clk<= '1';
		FOR i IN 0 TO 64 LOOP
		
		IF (clk ='1') THEN
		wait for 500000000 ns;
		clk<= '0';
		ELSIF (clk ='0') THEN
		wait for 500000000 ns;
		clk<= '1';
		END IF;

		END LOOP;

		assert false report "Reached end of test";
		wait;
		
	end process;
end behave;