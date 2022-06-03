-------------------------------------------------------
-- N BIT ADDER
-- Cristian Durán
--	Organización de computadores
--	01-04-2022
-------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------------------------

ENTITY	n_bit_adder IS
	GENERIC(N1			:	INTEGER	:=8);
	PORT(	  a			:	IN		STD_LOGIC_VECTOR(N1-1 DOWNTO 0);
			  b			:	IN		STD_LOGIC_VECTOR(N1-1 DOWNTO 0);
			  cin			:	IN 	STD_LOGIC;
			  s			:	OUT	STD_LOGIC_VECTOR(N1-1 DOWNTO 0);
			  cout		:	OUT	STD_LOGIC);
			  
END ENTITY n_bit_adder;

ARCHITECTURE rtl OF n_bit_adder IS
	SIGNAL	 carry :	STD_LOGIC_VECTOR(N1-1	DOWNTO 0);
BEGIN

	adder: FOR i in N1-1	DOWNTO 0	GENERATE
		BIT0:	IF	i=0 GENERATE
					B0: ENTITY work.full_adder PORT MAP (a(i),b(i),cin,s(i),carry(i));
				END GENERATE;
		BITN:	IF i/=0 GENERATE
					BN: ENTITY work.full_adder	PORT MAP (a(i),b(i),carry(i-1),s(i),carry(i));
				END GENERATE;
			END GENERATE;
		
	
			cout <=	carry(carry'LEFT);
			
END ARCHITECTURE;