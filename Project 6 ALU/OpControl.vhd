--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains a the address decoder, in this situation we only want to have four addresses
--so we set the input lenght to be two beacues we can have four outcomes with that. The code
--below shows that if we input 0000 the output will be 00000000000000000000000000000001 meaning the zeroth address will be active
--while all the other addresses are incative. 

library ieee;
use ieee.std_logic_1164.all;

entity OpControl is
	port(
		grygorczuk_op, grygorczuk_funt: in std_logic_vector(5 downto 0);
		ALUctr : out std_logic_vector(3 downto 0);
		RegDst, RegWr, MemWr, MemToReg, ExpOp, ALUscr, PCsrc : out std_logic
		);
	end OpControl;

	architecture OpControl_logic of OpControl is
	
 	signal CTR0, CTR1, CTR2, CTR3, CTR4, CTR5, CTR6, CTR7, CTR8, CTR9, CTR10 : std_logic_vector(3 DOWNTO 0);	
	
	begin 
	  
	CTR0 <= "0000";
	CTR1 <= "0001"; 
	CTR2 <= "0010"; 
	CTR3 <= "0011"; 
	CTR4 <= "0100"; 
	CTR5 <= "0101"; 
	CTR6 <= "0110"; 
	CTR7 <= "0111";
	CTR8 <= "1000"; 
	CTR9 <= "1001";  
	CTR10 <= "1010";  
	
	process(grygorczuk_op, grygorczuk_funt)
	  begin
           if grygorczuk_op = "000000" and grygorczuk_funt = "000000" then 
           ALUctr <= CTR0;
         elsif grygorczuk_op = "000000" and grygorczuk_funt = "000001" then 
           	ALUctr <= CTR1;
        	elsif grygorczuk_op = "000000" and grygorczuk_funt = "000010" then 
           	ALUctr <= CTR2;
       	 elsif grygorczuk_op = "000000" and grygorczuk_funt = "000011" then 
           	ALUctr <= CTR3;
  	      elsif grygorczuk_op = "000000" and grygorczuk_funt = "000100" then 
   	        ALUctr <= CTR4;
 	       elsif grygorczuk_op = "000000" and grygorczuk_funt = "000101" then 
           	ALUctr <= CTR5;
        	elsif grygorczuk_op = "000000" and grygorczuk_funt = "000110" then 
           	ALUctr <= CTR6;
        	elsif grygorczuk_op = "000000" and grygorczuk_funt = "000111" then 
            	ALUctr <= CTR7;
        	elsif grygorczuk_op = "000001" and grygorczuk_funt = "000000" then 
            	ALUctr <= CTR8;
       	 elsif grygorczuk_op = "000010" and grygorczuk_funt = "000000" then 
            	ALUctr <= CTR9;
        	elsif grygorczuk_op = "000011" and grygorczuk_funt = "000000" then 
           	ALUctr <= CTR10;
 	      end if;
	end process; 
	
	with grygorczuk_op select
		RegDst <= '0' when "000000",
		          '1' when "000001",
		          '0' when "000010",
		          '0' when "000011",
		          '1' when "000100",
							'0' when others;
							
	with grygorczuk_op select
		RegWr <= '1' when "000000",
		          '1' when "000001",
		          '1' when "000010",
		          '0' when "000011",
		          '0' when "000100",
							'0' when others;
  
  	with grygorczuk_op select
		MemWr <= '0' when "000000",
		          '0' when "000001",
		          '0' when "000010",
		          '1' when "000011",
		          '0' when "000100",
							'0' when others;
							
	 with grygorczuk_op select
		MemToReg <= '0' when "000000",
		          '0' when "000001",
		          '1' when "000010",
		          '0' when "000011",
		          '0' when "000100",
							'0' when others;
							
		with grygorczuk_op select
		ExpOp <= '0' when "000000",
		          '0' when "000001",
		          '0' when "000010",
		          '0' when "000011",
		          '0' when "000100",
							'0' when others;		
			
	with grygorczuk_op select
		ALUscr <= '0' when "000000",
		          '1' when "000001",
		          '0' when "000010",
		          '0' when "000011",
		          '0' when "000100",
							'0' when others;		
							
		with grygorczuk_op select
		PCsrc <= '0' when "000000",
		          '0' when "000001",
		          '0' when "000010",
		          '0' when "000011",
		          '1' when "000100",
							'0' when others;	
							
			
	
	end OpControl_logic;
