LIBRARY IEEE;
USE    IEEE.std_logic_1164.ALL;
USE    IEEE.numeric_std.ALL;

ENTITY four_bit_counter IS 
	PORT(     
		clk    : IN std_logic;
		enable : IN std_logic;
		count  : OUT unsigned (3 DOWN TO 0);
END ENTITY four_bit_counter;

ARCHITECTURE behave OF four_bit_counter IS
	SIGNAL current_count : unsigned (3 DOWNTO0);
	
BEGIN  
	my_comb_proc : PROCESS(current_count)
	BEGIN
		next_count <= current_count;
		IF   enable ='1' THEN
			next_count <= current_count + 1;
			AFTER 15 ns;         
		END IF;
	END PROCESS my_comb_proc;
	--   Register Function    
	my_reg_proc : PROCESS(clk) 
	BEGIN 
		IF rising_edge(clk) 
			current_count <= next_count 
			AFTER 15 ns; 
		END IF;   
	END PROCESS my_reg_proc;
	--   Output Function    
	count <= current_count;
END ARCHITECTURE behave;