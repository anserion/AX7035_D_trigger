LIBRARY ieee; USE ieee.std_logic_1164.ALL;
ENTITY tb_D_trigger IS
END tb_D_trigger;
 
ARCHITECTURE behavior OF tb_D_trigger IS 
   COMPONENT D_trigger 
   PORT(KEY1,KEY2: in std_logic; LED1,LED2: out std_logic);
   END COMPONENT;
   --Inputs
   signal KEY1,KEY2: std_logic := '0';
 	--Outputs
   signal LED1,LED2: std_logic;
BEGIN
   uut: D_trigger PORT MAP (KEY1,KEY2,LED1,LED2);

   tb_proc: process
   begin		
	  WAIT FOR 100ns;
	  KEY2<='1'; KEY1<='1'; WAIT FOR 100ns;
	  KEY2<='0'; KEY1<='0'; WAIT FOR 100ns;
	  KEY2<='1'; KEY1<='0'; WAIT FOR 100ns;
     KEY2<='0'; KEY1<='1'; WAIT;
   end process;
END;