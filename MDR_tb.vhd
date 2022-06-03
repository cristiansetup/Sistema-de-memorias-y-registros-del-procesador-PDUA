-------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY MDR_tb IS
END ENTITY;
-------------------------------------------------------
ARCHITECTURE testbench OF MDR_tb IS
-------------------------------------------------------
	SIGNAL	clk_tb							:	STD_LOGIC;
	SIGNAL	rst_tb							:	STD_LOGIC;
	SIGNAL	mdr_en_tb						:	STD_LOGIC;
	SIGNAL	mdr_alu_n_tb					:	STD_LOGIC;
	SIGNAL	bus_alu_tb						:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	bus_data_out_tb				:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	bus_c_tb							:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	DATA_EX_in_tb					:	STD_LOGIC_VECTOR(7 DOWNTO 0);
-------------------------------------------------------

BEGIN

	DUT: ENTITY work.MDR
	PORT MAP(		clk					=>	clk_tb,
						rst					=> rst_tb,
						mdr_en				=> mdr_en_tb,
						mdr_alu_n			=> mdr_alu_n_tb,
						bus_alu				=> bus_alu_tb,
						bus_data_out		=> bus_data_out_tb,
						bus_c					=> bus_c_tb,
						DATA_EX_in			=> DATA_EX_in_tb);
	
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
	rst_tb				<=	'1';
	mdr_en_tb			<=	'1';
	mdr_alu_n_tb		<= '0';
	bus_alu_tb			<= "01010101";
	DATA_EX_in_tb		<= "11110000";
	WAIT FOR 50 ns;

	--Test vector 2--
	rst_tb				<=	'1';
	mdr_en_tb			<=	'1';
	mdr_alu_n_tb		<= '0';
	bus_alu_tb			<= "01010101";
	DATA_EX_in_tb		<= "11110000";
	WAIT FOR 50 ns;	
	
	--Test vector 3--
	rst_tb				<=	'1';
	mdr_en_tb			<=	'1';
	mdr_alu_n_tb		<= '0';
	bus_alu_tb			<= "01010101";
	DATA_EX_in_tb		<= "11110000";
	WAIT FOR 50 ns;
	
	--Test vector 4--
	rst_tb				<=	'0';
	mdr_en_tb			<=	'1';
	mdr_alu_n_tb		<= '0';
	bus_alu_tb			<= "01010101";
	DATA_EX_in_tb		<= "11110000";
	WAIT FOR 50 ns;
	
	--Test vector 5--
	rst_tb				<=	'0';
	mdr_en_tb			<=	'1';
	mdr_alu_n_tb		<= '1';
	bus_alu_tb			<= "11100011";
	DATA_EX_in_tb		<= "00011100";
	WAIT FOR 50 ns;
	
	--Test vector 6--
	rst_tb				<=	'0';
	mdr_en_tb			<=	'0';
	mdr_alu_n_tb		<= '1';
	bus_alu_tb			<= "11100011";
	DATA_EX_in_tb		<= "00011100";
	WAIT FOR 50 ns;
	
	--Test vector 7--
	rst_tb				<=	'1';
	mdr_en_tb			<=	'1';
	mdr_alu_n_tb		<= '1';
	bus_alu_tb			<= "11100011";
	DATA_EX_in_tb		<= "00011100";
	WAIT FOR 50 ns;
	
	--Test vector 8--
	rst_tb				<=	'0';
	mdr_en_tb			<=	'1';
	mdr_alu_n_tb		<= '0';
	bus_alu_tb			<= "11100011";
	DATA_EX_in_tb		<= "00011100";
	WAIT FOR 50 ns;

	
	
	
   END PROCESS signal_generation;
END ARCHITECTURE;
	