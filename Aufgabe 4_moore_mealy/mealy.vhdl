library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

entity moore is 
port(
	clk, reset, enable: in std_logic;
	i: in std_logic;
	o: out std_logic_vector (1 downto 0)
	);
end moore;

architecture behave of moore is
signal state, next_state: std_logic_vector(2 downto 0);
BEGIN
   transition_logic: PROCESS (state , i)                               
   BEGIN
	case (state) is
		when "000" =>
			if i = "1" then
				next_state <= "001";
			else
				next_state <= "100";
			end if;
		when "001" =>
		if i = "1" then
			next_state <= "011";
		else
			next_state <= "010";
		end if;
		when "010" =>
			if i = "1" then
				next_state <= "000";
			else
				next_state <= "100";
			end if;
		when "011" =>
			if i = "1" then
				next_state <= "011";
			else
				next_state <= "000";
			end if;
		when "100" =>
			if i = "1" then
				next_state <= "101";
			else
				next_state <= "100";
			end if;
		when "101" =>
			if i = "1" then
				next_state <= "000";
			else
				next_state <= "010";
			end if;
   END PROCESS;
   
   state_memory: PROCESS (clk, reset)                               
   BEGIN
   if reset = '1' then
	state <= "000";
	elsif clk'event and clk = '1' then
		if enable '1' then
		state <= next_state;
		end if;
	end if;
   END PROCESS;
   
   output_logic: PROCESS (state, i)                               
   BEGIN
	if state = "000" then
		o <= "000";
	elsif state = "001" then
		o <= "000";
	elsif state = "010" then
		if(i = '1') then
			o <= "000";
		elsif
			o<= "010";
		end if
	elsif state = "011" then
		if(i = '1') then
			o <= "001";
		elsif
			o<= "000";
		end if
	elsif state = "100" then
		if(i = '1') then
			o <= "000";
		elsif
			o<= "001";
		end if
	elsif state = "101" then
		if(i = '1') then
			o <= "001";
		elsif
			o<= "000";
		end if
	end if;
   END PROCESS;
end behave;