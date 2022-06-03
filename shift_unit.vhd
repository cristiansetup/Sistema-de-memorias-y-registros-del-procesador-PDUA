-------------------------------------------------------
-- Shift unit
-- Cristian Durán
--	Organización de computadores
--	01-04-2022
-------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------------------

ENTITY shift_unit IS
	GENERIC	(N1	:	INTEGER	:=8);
	PORT	(	 shamt	:IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
				 dataa	:IN  STD_LOGIC_VECTOR(N1-1 DOWNTO 0);
				 busC		:OUT STD_LOGIC_VECTOR(N1-1 DOWNTO 0));
END ENTITY;

ARCHITECTURE rtl OF shift_unit IS
BEGIN 

	busC	<=	  dataa								 WHEN  	shamt = "00"	ELSE  --dataa 
				  '0' & dataa(N1-1 DOWNTO 1)	 WHEN		shamt = "01"	ELSE  --Desplazamiento derecha
				  dataa(N1-2 DOWNTO 0) & '0'   WHEN  	shamt = "10"	ELSE	--Desplazamiento izquierda
				  (OTHERS => '0');														--Nulo
				  
END ARCHITECTURE;