--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains a D Flip Flop, which can be also called a SRAM Cell. It's function is to store 
--meomry based on rising edges of the input. It has three inputs, IN(Input), CS (Chip Select), and WE (WRITE ENABLE) 
--and output which contains whatever memory has been last stored in the device. 

library ieee;
use ieee.std_logic_1164.all;

--While CS is high and WE goes from low to high, an occurance rising edge, the input will be saved 
--anytime when CS is low the component is inactive and cannot be read from or written to
entity d_flip_flop is 
	port(
		grygorczuk_in, grygorczuk_cs, grygorczuk_we: in std_logic;
		grygorczuk_output: out std_logic 
		);
end d_flip_flop;
	
architecture d_flip_flop_logic of d_flip_flop is 

--The D-Latch is used to save the data bit whenever the signal expeirnces rising edge. 
--These two latches are used to give the component the write ability. 
component d_latch is 
	port(
		grygorczuk_d, grygorczuk_c: in std_logic;
		grygorczuk_q, grygorczuk_q_not: out std_logic 
		);
end component;

--The Tri State Buffer is used to hold any output that occurs while the CS is low, if CS is high it the output will be read
--This compoent is used for the read ability. 
component tri_state_buffer is
    Port ( grygorczuk_input, grygorczuk_enable: in std_logic;  
           grygorczuk_output   : out std_logic
           );
end component;

signal grygorczuk_and, grygorczuk_not_and, grygorczuk_q_out_one, grygorczuk_q_out_two, grygorczuk_q_not_out_one, grygorczuk_q_not_out_two: std_logic;

begin

grygorczuk_and <= grygorczuk_cs and grygorczuk_we;
grygorczuk_not_and <= not grygorczuk_and;

d_latch_one: d_latch port map(grygorczuk_in, grygorczuk_not_and, grygorczuk_q_out_one, grygorczuk_q_not_out_one);
d_latch_two: d_latch port map(grygorczuk_q_out_one, grygorczuk_and, grygorczuk_q_out_two, grygorczuk_q_not_out_two);	
tri_state_buffer_one: tri_state_buffer port map(grygorczuk_q_out_two, grygorczuk_cs, grygorczuk_output);	
	
end d_flip_flop_logic;

				
