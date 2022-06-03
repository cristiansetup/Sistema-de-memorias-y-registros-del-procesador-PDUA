LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY mux2_1_process IS
	PORT(		bus_alu			:	IN 	STD_LOGIC_VECTOR(7	DOWNTO 0);
				q					:	IN 	STD_LOGIC_VECTOR(7	DOWNTO 0);
				mdr_alu_n		:	IN		STD_LOGIC;
				bus_c				:	OUT	STD_LOGIC_VECTOR(7	DOWNTO 0));
END ENTITY mux2_1_process;

ARCHITECTURE	behaviour OF mux2_1_process IS
BEGIN

		mux_process: PROCESS	(bus_alu,q,mdr_alu_n)
		BEGIN
			IF	(mdr_alu_n='0') THEN
				bus_c<=bus_alu;
			ELSE
				bus_c<=q;
			END IF;
		END PROCESS	mux_process;
		
END ARCHITECTURE behaviour;