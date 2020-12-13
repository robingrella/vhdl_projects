library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

entity bitmustererkennung is 
port(
	clk, reset, enable: in std_logic;
	i: in std_logic;
	o: out std_logic
	);
end bitmustererkennung;

architecture behave of bitmustererkennung is
signal state, next_state: std_logic_vector(1 downto 0);
BEGIN
   transition_logic: PROCESS (state , i)                               
   BEGIN
	case (state) is
		when "00" =>
			if i = "1" then
				next_state <= "01";
			else
				next_state <= "00";
			end if;
		when "01" =>
			if i = "1" then
				next_state <= "01";
			else
				next_state <= "10";
			end if;
		when "10" =>
			if i = "1" then
				next_state <= "00";
			else
				next_state <= "00";
			end if;
	end case;
   END PROCESS;
   
   state_memory: PROCESS (clk, reset)                               
   BEGIN
   if reset = '1' then
	state <= "00";
	elsif clk'event and clk = '1' then
		if enable '1' then
		state <= next_state;
		end if;
	end if;
   END PROCESS;
   
   output_logic: PROCESS (state, i)                               
   BEGIN
	if state = "00" then
		o <= "0";
	elsif state = "01" then
		o <= "0";
	elsif state = "10" then
		if(i = '1') then
			o <= "1";
		elsif
			o<= "0";
		end if
	end if;
   END PROCESS;
end behave;