LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU3 IS
	PORT (Clock : IN STD_LOGIC ;
			A : IN UNSIGNED(7 DOWNTO 0);
			Student_id: IN UNSIGNED(3 DOWNTO 0);
			OP: IN UNSIGNED(15 DOWNTO 0);
			R1: OUT UNSIGNED(3 DOWNTO 0));--Result
END ALU3;

ARCHITECTURE Behavior OF ALU3 IS
	SIGNAL Results : unsigned(3 DOWNTO 0) :=(others => '0');
	SIGNAL Reg1: unsigned(7 DOWNTO 0); 
	
	begin 
	Reg1<=A; 
	
	process (Clock, OP)
	begin 
	
		if(rising_edge (Clock)) THEN
		case OP is 
		
		WHEN "0000000000000001" =>
			Results <= "1110" ; --9>5
		
		WHEN "0000000000000010" => 
			Results <=  "1110" ; --9>0
			
		WHEN "0000000000000100" =>
			Results <= "1110"; --9>1
			
		WHEN "0000000000001000" =>
			Results <= "1110"; --9>1
			
		WHEN "0000000000010000"  =>
			Results <= "1110"; --9>8
	
		WHEN "0000000000100000" =>
			Results <= "1110"; --9=9
			
		WHEN "0000000001000000" =>
			Results <= "1110"; --9>6
			
		WHEN "0000000010000000" => 
			Results <= "1110"; --9>6
			
		WHEN OTHERS =>
		
		END CASE; 
		END IF; 
		END PROCESS; 
		
	R1 <= Results(3 DOWNTO 0);
		
END behavior;

