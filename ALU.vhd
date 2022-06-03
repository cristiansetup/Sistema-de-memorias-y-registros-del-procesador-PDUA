-------------------------------------------------------
-- ALU
-- Cristian Durán
--	Organización de computadores
--	01-04-2022
-------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-------------------------------------------------------

ENTITY alu IS 
	GENERIC (N1:	INTEGER	:=8);
	PORT(		clk		:	IN		STD_LOGIC;
				rst		:	IN		STD_LOGIC;
				busA		:	IN		STD_LOGIC_VECTOR(N1-1 DOWNTO 0);
				busB		:	IN		STD_LOGIC_VECTOR(N1-1 DOWNTO 0);
				selop		:	IN		STD_LOGIC_VECTOR(2 DOWNTO 0);
				shamt		:	IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);
				enaf		:	IN		STD_LOGIC;
				busC		:	OUT	STD_LOGIC_VECTOR(N1-1 DOWNTO 0);
				C,N,P,Z	:	OUT	STD_LOGIC);--FLAGS
END ENTITY alu;

ARCHITECTURE ALUarch of alu IS
 
SIGNAL cout_carry			:	STD_LOGIC;					
SIGNAL result_dataa		:	STD_LOGIC_VECTOR(N1-1 DOWNTO 0);
SIGNAL a_operator			:	STD_LOGIC_VECTOR(N1-1 DOWNTO 0);
SIGNAL b_operator			:	STD_LOGIC_VECTOR(N1-1 DOWNTO 0);




Begin 
processing: ENTITY work.processing_unit		--Bloque de processing unit
port map (	dataa		=>	busA,	
				datab		=>	busB,
				selop		=>	selop,
				result	=>	result_dataa,
				cout		=>	cout_carry);


shift: ENTITY work.shift_unit						--Bloque de shift unit
port map(		shamt		=>	shamt,
					dataa		=> result_dataa,
					busC		=>	busC);




flags: ENTITY work.flag_register 				--Bloque de flag register
port map(	clk		=> clk,
				rst		=> rst,
				enaf		=> enaf,
				dataa		=> result_dataa,
				carry		=> cout_carry,
				C			=> C,
				N			=> N,
				Z			=> Z,
				P			=> P);

END ALUarch;