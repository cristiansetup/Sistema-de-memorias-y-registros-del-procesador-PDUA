LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MDR IS
	GENERIC	(MAX_WIDTH		:	INTEGER	:=8);
	PORT		(clk				:	IN		STD_LOGIC;
				 rst				:	IN		STD_LOGIC;
				 mdr_en			:	IN		STD_LOGIC;
				 mdr_alu_n		:	IN		STD_LOGIC;
				 bus_alu			:	IN 	STD_LOGIC_VECTOR(MAX_WIDTH-1	DOWNTO 0);
				 bus_data_out	:	OUT	STD_LOGIC_VECTOR(MAX_WIDTH-1	DOWNTO 0);
				 bus_c			:	OUT	STD_LOGIC_VECTOR(MAX_WIDTH-1	DOWNTO 0);
				 DATA_EX_in		:	IN 	STD_LOGIC_VECTOR(MAX_WIDTH-1	DOWNTO 0));
END ENTITY;

ARCHITECTURE rtl of MDR is

SIGNAL q_signal		:	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);

Begin 
REG_1_processing: ENTITY work.REG_1		
port map (	clk			=>	clk,	
				rst			=>	rst,
				mdr_en		=>	mdr_en,
				DATA_EX_in	=>	DATA_EX_in,
				q				=>	q_signal);

Reg_2_processing: ENTITY work.REG_2		
port map (	clk				=>	clk,	
				rst				=>	rst,
				mdr_en			=>	mdr_en,
				bus_alu			=>	bus_alu,
				q					=>	bus_data_out);
				
MUX_processing: ENTITY work.mux2_1_process		
port map (	bus_alu			=>	bus_alu,	
				q					=>	q_signal,
				mdr_alu_n		=>	mdr_alu_n,
				bus_c				=>	bus_c);
				

	
END rtl;