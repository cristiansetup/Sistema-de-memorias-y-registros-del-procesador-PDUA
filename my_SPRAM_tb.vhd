-------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY my_SPRAM_tb IS
END ENTITY;
-------------------------------------------------------
ARCHITECTURE testbench OF my_SPRAM_tb IS
-------------------------------------------------------
	SIGNAL	clk_tb				:	STD_LOGIC;
	SIGNAL	wr_rdn_tb			:	STD_LOGIC;
	SIGNAL	addr_tb				:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	w_data_tb			:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	r_data_tb			:	STD_LOGIC_VECTOR(7 DOWNTO 0);
-------------------------------------------------------


BEGIN

	DUT: ENTITY work.my_SPRAM
	PORT MAP(		clk				=>	clk_tb,
						wr_rdn			=> wr_rdn_tb,
						addr				=> addr_tb,
						w_data			=> w_data_tb,
						r_data			=>	r_data_tb);
	
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
	wr_rdn_tb			<=	'1';
	addr_tb				<=	"00000011";
	w_data_tb			<= "00110011";
	WAIT FOR 50 ns;

	--Test vector 2--
	wr_rdn_tb			<=	'0';
	addr_tb				<=	"00000001";
	w_data_tb			<= "00110010";
	WAIT FOR 50 ns;	
	
	--Test vector 3--
	wr_rdn_tb			<=	'1';
	addr_tb				<=	"00000001";
	w_data_tb			<= "10110010";
	WAIT FOR 50 ns;
	
	--Test vector 4--
	wr_rdn_tb			<=	'0';
	addr_tb				<=	"00000111";
	w_data_tb			<= "00110011";
	WAIT FOR 50 ns;
	
	--Test vector 5--
	wr_rdn_tb			<=	'1';
	addr_tb				<=	"00000101";
	w_data_tb			<= "00111011";
	WAIT FOR 50 ns;
	
	--Test vector 6--
	wr_rdn_tb			<=	'1';
	addr_tb				<=	"00000010";
	w_data_tb			<= "00000000";
	WAIT FOR 50 ns;
	
	
	   END PROCESS signal_generation;
END ARCHITECTURE;