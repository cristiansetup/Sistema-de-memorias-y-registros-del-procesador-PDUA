-------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY MAR_tb IS
END ENTITY;
-------------------------------------------------------
ARCHITECTURE testbench OF MAR_tb IS
-------------------------------------------------------
	SIGNAL	clk_tb		:	STD_LOGIC;
	SIGNAL	rst_tb		:	STD_LOGIC;
	SIGNAL	mar_en_tb	:	STD_LOGIC;
	SIGNAL	d_tb			:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	mar_q_tb		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
-------------------------------------------------------
BEGIN

	DUT: ENTITY work.MAR
	PORT MAP(		clk			=>	clk_tb,
						rst			=> rst_tb,
						mar_en		=> mar_en_tb,
						d				=> d_tb,
						mar_q			=> mar_q_tb);
	
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
	rst_tb			<=	'1';
	mar_en_tb		<=	'1';
	d_tb				<= "01010101";
	WAIT FOR 50 ns;

	--Vectores de prueba--
  
	--Test vector 2--
	rst_tb			<=	'1';
	mar_en_tb		<=	'1';
	d_tb				<= "01010101";
	WAIT FOR 50 ns;

	--Vectores de prueba--
  
	--Test vector 3--
	rst_tb			<=	'1';
	mar_en_tb		<=	'1';
	d_tb				<= "01010101";
	WAIT FOR 50 ns;

	--Vectores de prueba--
  
	--Test vector 4--
	rst_tb			<=	'0';
	mar_en_tb		<=	'1';
	d_tb				<= "01010101";
	WAIT FOR 50 ns;
	
	--Vectores de prueba--
  
	--Test vector 5--
	rst_tb			<=	'0';
	mar_en_tb		<=	'1';
	d_tb				<= "11111111";
	WAIT FOR 50 ns;
	
	--Test vector 6--
	rst_tb			<=	'0';
	mar_en_tb		<=	'1';
	d_tb				<= "00000000";
	WAIT FOR 50 ns;

	--Test vector 7--
	rst_tb			<=	'0';
	mar_en_tb		<=	'0';
	d_tb				<= "11111111";
	WAIT FOR 50 ns;
	
	--Test vector 8--
	rst_tb			<=	'1';
	mar_en_tb		<=	'0';
	d_tb				<= "11111111";
	WAIT FOR 50 ns;
	
	--Test vector 9--
	rst_tb			<=	'0';
	mar_en_tb		<=	'0';
	d_tb				<= "00001111";
	WAIT FOR 50 ns;
	

						
						
   END PROCESS signal_generation;
END ARCHITECTURE;	