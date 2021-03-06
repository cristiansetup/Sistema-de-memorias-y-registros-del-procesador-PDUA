LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY REG_1 IS
	GENERIC	(MAX_WIDTH		:	INTEGER	:=8);
	PORT		(clk			:	IN		STD_LOGIC;
				 rst			:	IN		STD_LOGIC;
				 mdr_en		:	IN		STD_LOGIC;
				 DATA_EX_in	:	IN 	STD_LOGIC_VECTOR(MAX_WIDTH-1	DOWNTO 0);
				 q				:	OUT	STD_LOGIC_VECTOR(MAX_WIDTH-1	DOWNTO 0));
END ENTITY;

ARCHITECTURE rtl of REG_1 is
BEGIN


	dff:	PROCESS(clk,rst, DATA_EX_in)
	BEGIN
		IF(rst='1') THEN
			q<=(OTHERS	=>	'0');
		ELSIF	(rising_edge(clk)) THEN
			IF	(mdr_en = '1') THEN
				q <= DATA_EX_in;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE;