LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MAR IS
	GENERIC	(MAX_WIDTH		:	INTEGER	:=8);
	PORT		(clk				:	IN		STD_LOGIC;
				 rst				:	IN		STD_LOGIC;
				 mar_en			:	IN		STD_LOGIC;
				 d					:	IN 	STD_LOGIC_VECTOR(MAX_WIDTH-1	DOWNTO 0);
				 mar_q			:	OUT	STD_LOGIC_VECTOR(MAX_WIDTH-1	DOWNTO 0));
END ENTITY;

ARCHITECTURE rtl of MAR is
BEGIN


	dff:	PROCESS(clk,rst, d)
	BEGIN
		IF(rst='1') THEN
			mar_q<=(OTHERS	=>	'0');
		ELSIF	(rising_edge(clk)) THEN
			IF	(mar_en = '1') THEN
				mar_q <= d;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE;