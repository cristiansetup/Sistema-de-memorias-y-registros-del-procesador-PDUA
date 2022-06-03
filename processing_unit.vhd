-------------------------------------------------------
-- Processing unit
-- Cristian Durán
--	Organización de computadores
--	01-04-2022
-------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
-------------------------------------------------------

ENTITY processing_unit IS
	GENERIC(N1			:	INTEGER	:=8);
	PORT(	  dataa		:	IN		STD_LOGIC_VECTOR(N1-1 DOWNTO 0);
			  datab		:	IN		STD_LOGIC_VECTOR(N1-1 DOWNTO 0);
			  selop		:	IN 	STD_LOGIC_VECTOR(2   DOWNTO 0);
			  result		:	OUT	STD_LOGIC_VECTOR(N1-1 DOWNTO 0);
			  cout		:	OUT	STD_LOGIC);
			  
END ENTITY processing_unit;

ARCHITECTURE rtl OF processing_unit IS
	
	CONSTANT ONE			:	STD_LOGIC_VECTOR(N1-1	DOWNTO 0) 	:=std_logic_vector(to_unsigned(1,N1)); --Vector de unos
	CONSTANT ZEROS			:	STD_LOGIC_VECTOR(N1-1 DOWNTO 0) 		:=(OTHERS=>'0');								--Vector de ceros
	
	SIGNAL	not_b			:	STD_LOGIC_VECTOR(N1-1 DOWNTO 0);		--NOT B
	SIGNAL	a_and_b		:	STD_LOGIC_VECTOR(N1-1 DOWNTO 0);		--A AND B
	SIGNAL	a_or_b		:	STD_LOGIC_VECTOR(N1-1 DOWNTO 0);		--A OR B
	SIGNAL	a_xor_b		:	STD_LOGIC_VECTOR(N1-1 DOWNTO 0);		--A XOR B
	SIGNAL	a_plus_b		:	STD_LOGIC_VECTOR(N1-1 DOWNTO 0);		--A + B
	SIGNAL	b_plus_one	:	STD_LOGIC_VECTOR(N1-1 DOWNTO 0);		--B + 1
	SIGNAL	neg_b			:	STD_LOGIC_VECTOR(N1-1 DOWNTO 0);		--NOT B + 1
	SIGNAL	C_sel			:	STD_LOGIC_VECTOR(1 DOWNTO 0);			--Selop
	SIGNAL	C_add, c_plus1, c_negB	:	STD_LOGIC;

BEGIN


	not_b		<= NOT(datab);			--NOT B
	a_and_b	<=	dataa AND datab;  --A AND B
	a_or_b	<=	dataa	OR datab;	--A OR B
	a_xor_b	<=	dataa	XOR datab;	--A XOR B

		
	AplusB:	ENTITY work.add_sub	--ADD SUB
	GENERIC MAP(N1			=>	N1)
	PORT MAP(	a			=>	dataa,
					b			=>	datab,
					addn_sub	=>	'0',
					s			=>	a_plus_b,
					cout		=>	c_add);

	Bplus1:	ENTITY work.add_sub	--ADD SUB
	GENERIC MAP(N1			=>	N1)
	PORT MAP(	a			=>	datab,
					b			=>	ONE,
					addn_sub	=>	'0',
					s			=>	b_plus_one,
					cout		=>	c_plus1);
					
	negB:		ENTITY work.add_sub	--ADD SUB
	GENERIC MAP(N1			=>	N1)
	PORT MAP(	a			=>	ZEROS,
					b			=>	datab,
					addn_sub	=>	'1',
					s			=>	neg_b,
					cout		=>	c_negB);
					
	WITH selop SELECT
		result	<=	datab			WHEN	"000",	 --B
						not_b			WHEN	"001",	-- NOT B	
						a_and_b		WHEN	"010",	-- A AND B
						a_or_b		WHEN	"011",	-- A OR B
						a_xor_b		WHEN	"100",	-- A XOR B
						a_plus_b		WHEN	"101",	-- A + B
						b_plus_one	WHEN	"110",	--	B + 1
						neg_b			WHEN	OTHERS;	-- NEG B
	c_sel	<=	selop(1 DOWNTO 0);
	WITH c_sel SELECT
		cout		<=	c_add			WHEN	"01",
						c_plus1		WHEN	"10",
						c_negB		WHEN	"11",
						'0'			WHEN	OTHERS;
END ARCHITECTURE;