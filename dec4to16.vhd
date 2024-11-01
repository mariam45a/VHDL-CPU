LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dec4to16 IS
	PORT(w :IN STD_LOGIC_VECTOR(3 DOWNTO 0); --4 bit input vector
			En		 :IN STD_LOGIC; --enabler 
			y		 :OUT STD_LOGIC_VECTOR(15 DOWNTO 0)); --16 bit output vector
	END dec4to16;
	
	ARCHITECTURE Behaviour OF dec4to16 IS
		SIGNAL Enw: STD_logic_vector(4 DOWNTO 0);
	BEGIN
			Enw <= En & w(3)&w(2)&w(1)&w(0); --enw is a signal vector containing En, and the 4 bits of w
			WITH Enw SELECT --depending on the specific values of Enw it will set the Y vector to a specific value 
					y <= 	"0000000000000001" WHEN "10000", --0
							"0000000000000010" WHEN "10001", --1
							"0000000000000100" WHEN "10010", --2
							"0000000000001000" WHEN "10011", --3
							"0000000000010000" WHEN "10100", --4
							"0000000000100000" WHEN "10101", --5
							"0000000001000000" WHEN "10110", --6
							"0000000010000000" WHEN "10111", --7
							"0000000100000000" WHEN "11000", --9
							"0000001000000000" WHEN "11001", --10
							"0000010000000000" WHEN "11010", --11
							"0000100000000000" WHEN "11011", --12
							"0001000000000000" WHEN "11100", --13
							"0010000000000000" WHEN "11101", --14
							"0100000000000000" WHEN "11110", --15
							"1000000000000000" WHEN "11111", --16
						
							"0000000000000001" WHEN OTHERS;
		END Behaviour;