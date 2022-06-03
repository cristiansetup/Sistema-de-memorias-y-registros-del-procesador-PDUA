-------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY mov_acc_DPTR IS
END ENTITY;
-------------------------------------------------------
ARCHITECTURE testbench OF mov_acc_DPTR IS
-------------------------------------------------------
	SIGNAL	clk_tb							:	STD_LOGIC;
	SIGNAL	rst_tb							:	STD_LOGIC;
	SIGNAL	selop_tb							:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL	shamt_tb							:	STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL	ir_en_tb							:	STD_LOGIC;
	SIGNAL	wr_rdn_tb						:	STD_LOGIC;
	SIGNAL	mdr_en_tb						:	STD_LOGIC;
	SIGNAL	mdr_alu_n_tb					:	STD_LOGIC;
	SIGNAL	mar_en_tb						:	STD_LOGIC;
	SIGNAL	enaf_tb							:	STD_LOGIC;
	SIGNAL	bank_wr_en_tb					:	STD_LOGIC;
	SIGNAL	BusC_addr_tb					:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL	BusB_addr_tb					:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL	ir_q_tb							:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	C_tb								:	STD_LOGIC;
	SIGNAL	N_tb								:	STD_LOGIC;
	SIGNAL	P_tb								:	STD_LOGIC;
	SIGNAL	Z_tb								:	STD_LOGIC;
-------------------------------------------------------


BEGIN

	DUT: ENTITY work.PDUA
	PORT MAP(		clk				=>	clk_tb,
						rst				=> rst_tb,
						selop				=> selop_tb,
						shamt				=> shamt_tb,
						ir_en				=>	ir_en_tb,
						wr_rdn			=> wr_rdn_tb,
						mdr_en			=> mdr_en_tb,
						mdr_alu_n		=> mdr_alu_n_tb,
						mar_en			=> mar_en_tb,
						enaf				=> enaf_tb,
						bank_wr_en		=> bank_wr_en_tb,
						BusC_addr		=> BusC_addr_tb,
						BusB_addr		=> BusB_addr_tb,
						ir_q				=> ir_q_tb,
						C					=> C_tb,
						N					=> N_tb,
						P					=> P_tb,
						Z					=> Z_tb);
	
		clock: process
	BEGIN
		clk_tb <= '0';
		WAIT FOR 10 ns;
		
		clk_tb <= '1';
		WAIT FOR 10 ns;

	END PROCESS;
	signal_generation: PROCESS		
	
	BEGIN
	
			--Test vector DPTR--
	rst_tb				<=	'0';
	--	Banco de registro--
	bank_wr_en_tb		<=	'1';
	BusC_addr_tb		<=	"010";

	--		ALU	--
	selop_tb				<=	"000";
	shamt_tb				<= "00";
	enaf_tb				<=	'0';
	--		IR		--
	ir_en_tb				<=	'0';
	--		MAR	--
	mar_en_tb			<=	'1';
	--		RAM	--
	wr_rdn_tb			<= '1';
	--		MDR	--
	mdr_en_tb			<=	'1';
	mdr_alu_n_tb		<=	'1';
	
	WAIT FOR 50 ns;
	
		rst_tb				<=	'0';
	--	Banco de registro--
	bank_wr_en_tb		<=	'1';
	BusC_addr_tb		<=	"010";

	--		ALU	--
	selop_tb				<=	"000";
	shamt_tb				<= "00";
	enaf_tb				<=	'0';
	--		IR		--
	ir_en_tb				<=	'0';
	--		MAR	--
	mar_en_tb			<=	'1';
	--		RAM	--
	wr_rdn_tb			<= '1';
	--		MDR	--
	mdr_en_tb			<=	'1';
	mdr_alu_n_tb		<=	'1';
	
	WAIT FOR 50 ns;
		rst_tb				<=	'0';
	--	Banco de registro--
	bank_wr_en_tb		<=	'1';
	BusC_addr_tb		<=	"010";

	--		ALU	--
	selop_tb				<=	"000";
	shamt_tb				<= "00";
	enaf_tb				<=	'0';
	--		IR		--
	ir_en_tb				<=	'0';
	--		MAR	--
	mar_en_tb			<=	'1';
	--		RAM	--
	wr_rdn_tb			<= '1';
	--		MDR	--
	mdr_en_tb			<=	'1';
	mdr_alu_n_tb		<=	'1';
	
	WAIT FOR 50 ns;
	
			-- MOV ACC, [DPTR] --
	
		--Test vector 6--
	rst_tb				<=	'0';
	
	bank_wr_en_tb		<=	'0';
	BusB_addr_tb		<=	"010";
	
	selop_tb				<=	"000";
	shamt_tb				<= "00";
	enaf_tb				<=	'0';
	
	ir_en_tb				<=	'0';
	
	mar_en_tb			<=	'1';

	wr_rdn_tb			<= '0';
	
	mdr_en_tb			<=	'0';
	mdr_alu_n_tb		<=	'0';
	
	WAIT FOR 50 ns;
	
	
	
	rst_tb				<=	'0';
	
	bank_wr_en_tb		<=	'1';
	BusC_addr_tb		<=	"111";
	BusB_addr_tb		<=	"010";
	
	selop_tb				<=	"000";
	shamt_tb				<= "00";
	enaf_tb				<=	'0';
	
	ir_en_tb				<=	'0';
	
	mar_en_tb			<=	'0';

	wr_rdn_tb			<= '0';
	
	mdr_en_tb			<=	'0';
	mdr_alu_n_tb		<=	'0';
	
	WAIT FOR 50 ns;
	
	
		   END PROCESS signal_generation;
END ARCHITECTURE;