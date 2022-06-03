LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY IR IS
	GENERIC	(MAX_WIDTH		:	INTEGER	:=8);
	PORT		(clk				:	IN		STD_LOGIC;
				 rst				:	IN		STD_LOGIC;
				 ir_en			:	IN		STD_LOGIC;
				 d					:	IN 	STD_LOGIC_VECTOR(MAX_WIDTH-1	DOWNTO 0);
				 ir_q				:	OUT	STD_LOGIC_VECTOR(MAX_WIDTH-1	DOWNTO 0));
END ENTITY;

ARCHITECTURE rtl of IR is
BEGIN


	dff:	PROCESS(clk,rst, d)
	BEGIN
		IF(rst='1') THEN
			ir_q<=(OTHERS	=>	'0');
		ELSIF	(rising_edge(clk)) THEN
			IF	(ir_en = '1') THEN
				ir_q <= d;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE;