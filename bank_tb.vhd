-------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY banco_tb IS
END ENTITY;
-------------------------------------------------------
ARCHITECTURE testbench OF banco_tb IS
-------------------------------------------------------
	SIGNAL	CLK_tb				:	STD_LOGIC;
	SIGNAL	RESET_n_tb			:	STD_LOGIC;
	SIGNAL	bank_wr_en_tb					:	STD_LOGIC;
	SIGNAL	BusC_addr_tb					:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL	BusB_addr_tb					:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL	BUSC_tb				:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	BUSA_tb				:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	BUSB_tb				:	STD_LOGIC_VECTOR(7 DOWNTO 0);
-------------------------------------------------------

BEGIN

	DUT: ENTITY work.banco
	PORT MAP(		CLK				=>	CLK_tb,
						RESET_n			=> RESET_n_tb,
						bank_wr_en		=> bank_wr_en_tb,
						BusC_addr					=> BusC_addr_tb,
						BusB_addr					=> BusB_addr_tb,
						busC				=> busC_tb,
						busA				=> busA_tb,
						busB				=> busB_tb);
	
		clock: process
	BEGIN
		clk_tb <= '1';
		WAIT FOR 10 ns;
		
		clk_tb <= '0';
		WAIT FOR 10 ns;

	END PROCESS;
	signal_generation: PROCESS		
	
	BEGIN
	
	--Vectores de prueba--
  
	--Test vector 1--
	RESET_n_tb				<=	'1';
	bank_wr_en_tb						<=	'0';
	BusC_addr_tb						<= "011";
	BusB_addr_tb						<= "011";
	BUSC_tb					<= "11110000";
	WAIT FOR 50 ns;
	
	--Test vector 2--
	RESET_n_tb				<=	'1';
	bank_wr_en_tb						<=	'0';
	BusC_addr_tb						<= "011";
	BusB_addr_tb						<= "011";
	BUSC_tb					<= "11110000";
	WAIT FOR 50 ns;
	
	--Test vector 3--
	RESET_n_tb				<=	'1';
	bank_wr_en_tb						<=	'0';
	BusC_addr_tb						<= "011";
	BusB_addr_tb						<= "011";
	BUSC_tb					<= "11110000";
	WAIT FOR 50 ns;
	
	--Test vector 4--
	RESET_n_tb				<=	'0';
	bank_wr_en_tb						<=	'1';
	BusC_addr_tb						<= "111";
	BusB_addr_tb						<= "011";
	BUSC_tb					<= "11110000";
	WAIT FOR 50 ns;
	
	--Test vector 5--
	RESET_n_tb				<=	'0';
	bank_wr_en_tb						<=	'1';
	BusC_addr_tb						<= "111";
	BusB_addr_tb						<= "011";
	BUSC_tb					<= "11110001";
	WAIT FOR 50 ns;
	
	--Test vector 6--
	RESET_n_tb				<=	'0';
	bank_wr_en_tb						<=	'1';
	BusB_addr_tb						<= "111";
	WAIT FOR 50 ns;

	--Test vector 7--
	RESET_n_tb				<=	'0';
	bank_wr_en_tb						<=	'1';
	BusC_addr_tb						<= "000";
	BusB_addr_tb						<= "111";
	BUSC_tb					<= "11110011";
	WAIT FOR 50 ns;

	--Test vector 8--
	RESET_n_tb				<=	'0';
	bank_wr_en_tb						<=	'1';
	BusC_addr_tb						<= "001";
	BusB_addr_tb						<= "000";
	BUSC_tb					<= "11110101";
	WAIT FOR 50 ns;	

	--Test vector 9--
	RESET_n_tb				<=	'0';
	bank_wr_en_tb						<=	'1';
	BusC_addr_tb						<= "010";
	BusB_addr_tb						<= "001";
	BUSC_tb					<= "11010101";
	WAIT FOR 50 ns;

	--Test vector 10--
	RESET_n_tb				<=	'0';
	bank_wr_en_tb						<=	'1';
	BusC_addr_tb						<= "011";
	BusB_addr_tb						<= "010";
	BUSC_tb					<= "10010101";
	WAIT FOR 50 ns;

	--Test vector 11--
	RESET_n_tb				<=	'0';
	bank_wr_en_tb						<=	'1';
	BusC_addr_tb						<= "101";
	BusB_addr_tb						<= "011";
	BUSC_tb					<= "10110101";
	WAIT FOR 50 ns;	

	--Test vector 12--
	RESET_n_tb				<=	'0';
	bank_wr_en_tb						<=	'1';
	BusC_addr_tb						<= "101";
	BusB_addr_tb						<= "100";
	BUSC_tb					<= "10110101";
	WAIT FOR 50 ns;
	
	--Test vector 13--
	RESET_n_tb				<=	'0';
	bank_wr_en_tb						<=	'1';
	BusC_addr_tb						<= "111";
	BusB_addr_tb						<= "101";
	BUSC_tb					<= "10111101";
	WAIT FOR 50 ns;
	
	--Test vector 14--
	RESET_n_tb				<=	'0';
	bank_wr_en_tb						<=	'1';
	BusC_addr_tb						<= "111";
	BusB_addr_tb						<= "110";
	BUSC_tb					<= "11111101";
	WAIT FOR 50 ns;
	
	--Test vector 15--
	RESET_n_tb				<=	'0';
	bank_wr_en_tb						<=	'1';
	BusC_addr_tb						<= "111";
	BusB_addr_tb						<= "111";
	BUSC_tb					<= "11111111";
	WAIT FOR 50 ns;

		
   END PROCESS signal_generation;
END ARCHITECTURE;