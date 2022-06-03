-------------------------------------------------------
-- Flag register
-- Cristian Durán
--	Organización de computadores
--	01-04-2022
-------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------------------

ENTITY flag_register IS
	GENERIC(	N1			:	INTEGER	:=8);
	PORT(		clk		:	IN		STD_LOGIC;
				rst		:	IN		STD_LOGIC;
				enaf		:	IN		STD_LOGIC;
				dataa		:	IN		STD_LOGIC_VECTOR(N1-1 DOWNTO 0);
				carry		:	IN		STD_LOGIC;
				C,N,Z,P	:	OUT	STD_LOGIC); --Flags
END ENTITY flag_register;

ARCHITECTURE rtl OF flag_register IS

	CONSTANT ZEROS 		:	STD_LOGIC_VECTOR(N1-1 DOWNTO 0) := (OTHERS	=> '0');
	SIGNAL zero_flag		:	STD_LOGIC;
	

BEGIN
	zero_flag <= '1' WHEN dataa = ZEROS ELSE '0';
	
	PROCESS (clk,rst)
	BEGIN	

		IF(rst =	'1') THEN																																		--Reset
			C <=	'0';
			N <=	'0';
			Z <=	'0';
			P <=	'0';
		ELSIF (rising_edge(clk)) THEN
			IF	(enaf='1') THEN
				N <=	dataa(7);																																	--Flag negative
				C <=	carry;																																		--Flag Carry
				P <=	not (dataa(7) xor dataa(6) xor dataa(5) xor dataa(4) xor dataa(3) XOR dataa(2) XOR dataa(1) XOR dataa(0));	--Flag parity
				IF (zero_flag = '1') THEN																														--Flag zero
					Z<='1';
				ELSE
					Z<='0';
				END IF;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE;