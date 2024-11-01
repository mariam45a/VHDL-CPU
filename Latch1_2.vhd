LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY latch1 IS
	PORT (D : IN STD_LOGIC_VECTOR(7 DOWNTO 0); --8 bit A input
			Resetn, Clock : IN STD_LOGIC; --1 bit clock input and 1 bit reset
			Q: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); --8 bit output
END latch1;

ARCHITECTURE Behavior OF latch1 IS
	BEGIN
	PROCESS(Resetn, Clock) --process will take resetn and clock inputs

	BEGIN

	IF Resetn = '0' THEN
	Q <= "00000000";
	ELSIF Clock'EVENT AND Clock = '1' THEN
	Q <= D;

		END IF;
	END PROCESS;
END Behavior;
