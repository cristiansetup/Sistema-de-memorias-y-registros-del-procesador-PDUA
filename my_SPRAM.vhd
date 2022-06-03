LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY my_SPRAM IS
	GENERIC(	DATA_WIDTH	:	integer:=8;
				ADDR_WIDTH	:	integer:=3);
	PORT(		clk			:	IN		STD_LOGIC;
				wr_rdn		:	IN		STD_LOGIC;
				addr			:	IN		STD_LOGIC_VECTOR(DATA_WIDTH-1	DOWNTO 0);
				w_data		:	IN		STD_LOGIC_VECTOR(DATA_WIDTH-1	DOWNTO 0);
				r_data		:	OUT	STD_LOGIC_VECTOR(DATA_WIDTH-1	DOWNTO 0)
		 );
END ENTITY;

ARCHITECTURE rtl OF my_SPRAM	IS
	TYPE mem_type	IS ARRAY (0 TO 2**ADDR_WIDTH-1)	OF	STD_LOGIC_VECTOR(DATA_WIDTH-1	DOWNTO 0);
	SIGNAL ram	: mem_type;
	SIGNAL addr_reg	:	STD_LOGIC_VECTOR(DATA_WIDTH-1	DOWNTO 0);
BEGIN 

	write_process:	PROCESS(clk)
	BEGIN
		IF(rising_edge(clk)) THEN
			IF (wr_rdn = '1')	THEN
				 ram(to_integer(unsigned(addr)))<=w_data;
			END IF;
			addr_reg	<=	addr;
		END IF;
	END PROCESS;
	
	r_data <=	ram(to_integer(unsigned(addr_reg)));

END ARCHITECTURE;	
	