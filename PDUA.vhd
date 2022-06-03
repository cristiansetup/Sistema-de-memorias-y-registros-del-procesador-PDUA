-------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-------------------------------------------------------

ENTITY PDUA IS 
	GENERIC(MAX_WIDTH		:	integer	:=8;
			  DATA_WIDTH	:	integer	:=8;
			  ADDR_WIDTH	:	integer	:=2;
			  N1				:	INTEGER	:=8);
	PORT(		clk			:	IN		STD_LOGIC;
				rst			:	IN		STD_LOGIC;
				selop			:	IN		STD_LOGIC_VECTOR(2 DOWNTO 0);
				shamt			:	IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);
				ir_en			:	IN		STD_LOGIC;
				wr_rdn		:	IN		STD_LOGIC;
				mdr_en		:	IN		STD_LOGIC;
				mdr_alu_n	:	IN		STD_LOGIC;
				mar_en		:	IN		STD_LOGIC;
				enaf			:	IN		STD_LOGIC;
				bank_wr_en	: 	IN 	STD_LOGIC;
				BusB_addr	: 	IN		std_logic_vector(2 downto 0);
				BusC_addr	:	IN 	std_logic_vector(2 downto 0);
				ir_q			:	OUT	STD_LOGIC_VECTOR(MAX_WIDTH-1	DOWNTO 0);
				C,N,P,Z		:	OUT	STD_LOGIC);--FLAGS
END ENTITY PDUA;

ARCHITECTURE rtl of PDUA is

SIGNAL bus_alu					:	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
SIGNAL bus_A_signal			:	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
SIGNAL bus_B_signal			:	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
SIGNAL bus_C_signal			:	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
SIGNAL address_bus			:	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
SIGNAL BUS_DATA_IN			:	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);
SIGNAL BUS_ALU_C				:	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);	
SIGNAL BUS_Data_out_RAM		:	STD_LOGIC_VECTOR(MAX_WIDTH-1 DOWNTO 0);	

Begin 
		
banco_processing:	ENTITY work.banco	
port map (	CLK 			=>	clk,	
				RESET_n		=>	rst,
				BUSA			=>	bus_A_signal,
				BUSB			=>	bus_B_signal,
				BUSC			=> bus_C_signal,
				bank_wr_en	=>	bank_wr_en,
            BusB_addr	=>	BusB_addr,
				BusC_addr	=> BusC_addr);	
		
IR_processing:	ENTITY work.IR
port map (	clk 			=>	clk,	
				rst			=>	rst,
				ir_en			=>	ir_en,
				d				=> bus_C_signal,
				ir_q			=>	ir_q);
	
MAR_processing:	ENTITY work.MAR
port map (	clk 			=>	clk,	
				rst			=>	rst,
				mar_en		=>	mar_en,
				d				=> bus_C_signal,
				mar_q			=>	address_bus);
			
MDR_processing:	ENTITY work.MDR
port map (	clk 			  =>	clk,	
				rst			  =>	rst,
				mdr_en		  =>	mdr_en,
				mdr_alu_n	  =>	mdr_alu_n,
				DATA_EX_in	  =>  BUS_DATA_IN,
				bus_alu       =>	BUS_ALU_C,
				bus_Data_out  =>  BUS_Data_out_RAM,	
				bus_C			  =>	bus_c_signal);
				
my_SPRAM_processing:	ENTITY work.my_SPRAM
port map (	clk 			  =>	clk,	
				wr_rdn		  =>	wr_rdn,
				addr		  	  =>	address_bus,
				w_data		  =>	bus_Data_out_RAM,
				r_data		  =>  BUS_DATA_IN);	
ALU_processing: ENTITY work.ALU		
port map (	clk			=>	clk,	
				rst			=>	rst,
				busA			=>	bus_A_signal,
				busB			=>	bus_B_signal,
				selop			=> selop,
				shamt			=> shamt,
				enaf			=>	enaf,
				busC			=>	BUS_ALU_C,
				C				=>	C,
				N				=> N,
				P				=> P,
				Z				=> Z);		
				

END rtl;