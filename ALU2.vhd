LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU2 IS
	PORT (Clock : IN STD_LOGIC ;
			A ,B : IN UNSIGNED(7 DOWNTO 0);
			OP: IN UNSIGNED(15 DOWNTO 0);
			neg: OUT STD_LOGIC;
			R1: OUT UNSIGNED(3 DOWNTO 0);--first 4bits of 8bits Result
			R2: OUT UNSIGNED(3 DOWNTO 0));--later 4bits of 8bits Result
END ALU2;

ARCHITECTURE Behavior OF ALU2 IS
	SIGNAL Reg1, Reg2, Result: UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL Reg4: UNSIGNED(0 TO 7);
	SIGNAL Reg5: UNSIGNED(0 TO 3);

BEGIN
	Reg1 <= A;
	Reg2 <= B;
	PROCESS (Clock,OP,A,B)
	
	BEGIN
	IF (rising_edge(Clock)) THEN
		CASE OP IS
			WHEN "0000000000000001" => --Function 1: Replace the odd bits of A with the odd bits of B
				Result(7) <= Reg2(7); --odd bit of A (replace)
				Result(6) <= Reg1(6); 
				Result(5) <= Reg2(5); --odd bit of A (replace)
				Result(4) <= Reg1(4); 
				Result(3) <= Reg2(3); --odd bit of A (replace)
				Result(2) <= Reg1(2);
				Result(1) <= Reg2(1); --odd bit of A (replace)
				Result(0) <= Reg1(0);
			
			WHEN "0000000000000010"  => --function 2: Result of NANDing A and B
				neg <= '0';
				Result <= (Reg1 NAND Reg2);
			
			WHEN "0000000000000100" =>--Function 3: Summation of A and B and decrease by 5
				Result<= (Reg1+Reg2)-5;
				if(Result<0) then 
					neg<='1';
				else
					neg<='0';
				end if;
			
			WHEN "0000000000001000" =>--Function 4: Produce the 2's complement of B
				neg <= '0';
				Result <= (NOT(Reg2)+1); --inverts vector B and adds 1
			
			WHEN "0000000000010000" =>--Function 5: Invert the even bits of B
				neg <= '0';
				Result(7) <= Reg2(7);
				Result(6) <= NOT(Reg2(6)); --even bit, invert
				Result(5) <= Reg2(5);
				Result(4) <= NOT(Reg2(4)); --even bit, invert
				Result(3) <= Reg2(3);
				Result(2) <= NOT(Reg2(2)); --even bit, invert
				Result(1) <= Reg2(1);
				Result(0) <= NOT(Reg2(0)); --even bit, invert
			
			WHEN "0000000000100000" =>--Function 6: Shift A to the left by 2 bits, input bit=1 (SHL)
				neg <= '0';
				Result<= shift_left(Reg1, 2);
			
			WHEN "0000000001000000" =>--Function 7: Produce null on the output 
				neg<='0';
				Result<=null; 
			
			WHEN "0000000010000000" =>--Function 8: Produce 2's complement of A
				neg <= '0';
				Result <= (NOT (Reg1))+1;
			
			WHEN "0000000100000000" =>--Function 9: Rotate B to the right by 2 bits (ROR)
				neg <= '0';
				Result <= rotate_right(Reg2, 2);
			
			WHEN OTHERS =>-- Don't care
			
			END CASE;
		END IF;
	END PROCESS;
	
	R1 <= Result(3 DOWNTO 0);
	R2 <= Result(7 DOWNTO 4);

END Behavior;