library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

entity moore is 
port(
	clk, reset, enable: in std_logic;
	i: in std_logic;
	o: out std_logic
	);
end moore;

architecture behave of moore is
signal state, next_state: std_logic_vector(3 downto 0);
BEGIN
   transition_logic: PROCESS (state , i)                               
   BEGIN
	case (state) is
		when "0000" =>
			if( i = '0') then
				next_state = "0110";
			elsif
				next_state = "0001";
			end if;
		when "0001" =>
			if( i = '0') then
				next_state = "0010";
			elsif
				next_state = "0100";
			end if;
		when "0010" =>
			if( i = '0') then
				next_state = "1000";
			elsif
				next_state = "0000";
			end if;
		when "0011" =>
			if( i = '0') then
				next_state = "0000";
			elsif
				next_state = "1000";
			end if;
		when "0100" =>
			if( i = '0') then
				next_state = "0000";
			elsif
				next_state = "0101";
			end if;
		when "0101" =>
			if( i = '0') then
				next_state = "0000";
			elsif
				next_state = "0101";
			end if;
		when "0110" =>
			if( i = '0') then
				next_state = "0111";
			elsif
				next_state = "1001";
			end if;
		when "0111" =>
			if( i = '0') then
				next_state = "0111";
			elsif
				next_state = "1001";
			end if;
		when "1000" =>
			if( i = '0') then
				next_state = "0111";
			elsif
				next_state = "1001";
			end if;
		when "1001" =>
			next_state = "0011";
	end case;
   END PROCESS;
   
   state_memory: PROCESS (clk, reset)                               
   BEGIN
   if reset = '1' then
	state <= "0000";
	elsif clk'event and clk = '1' then
		if enable '1' then
		state <= next_state;
		end if;
	end if;
   END PROCESS;
   
   output_logic: PROCESS (state)                               
   BEGIN
	case (state) is
		when "0000" =>
			o<= "00";
		when "0001" =>
			o<= "00";
		when "0010" =>
			o<= "00";
		when "0011" =>
			o<= "01";
		when "0100" =>
			o<= "00";
		when "0101" =>
			o<= "01";
		when "0110" =>
			o<= "00";
		when "0111" =>
			o<= "01";
		when "1000" =>
			o<= "10";
		when "1001" =>
			o<= "00";
	end case;
   END PROCESS;
end behave;