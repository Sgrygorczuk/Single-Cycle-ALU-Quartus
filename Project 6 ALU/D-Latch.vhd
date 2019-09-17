--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains a basic D-Latch. A D-Latch stores one bit of memory when 
--based on if the input of the clock is high or low. 

library ieee;
use ieee.std_logic_1164.all;

--The D-Latch has two inputs, D and C, and two outputs Q and Q'
--When C is low Q and Q' stay the same no matter what D is 
--When C is high and D is low Q = 9 and Q' = 1
--When C is high and D is low Q = 1 and Q' = 0
entity d_latch is 
	port(
		grygorczuk_d, grygorczuk_c: in std_logic;
		grygorczuk_q, grygorczuk_q_not: out std_logic 
		);
end d_latch;
	
architecture d_latch_logic of d_latch is 

signal grygorczuk_nand_one, grygorczuk_nand_two, grygorczuk_QQ, grygorczuk_QQ_not: std_logic;

begin
grygorczuk_nand_one <= grygorczuk_d nand grygorczuk_c;
grygorczuk_nand_two <= not grygorczuk_d nand grygorczuk_c;
				
grygorczuk_QQ <= grygorczuk_nand_one nand grygorczuk_QQ_not;
grygorczuk_QQ_not <= grygorczuk_nand_two nand grygorczuk_QQ;

grygorczuk_q <= grygorczuk_QQ;
grygorczuk_q_not <= grygorczuk_QQ_not;
				
end d_latch_logic;
				