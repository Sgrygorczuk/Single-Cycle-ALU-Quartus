--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains a SRAM 4x4, meaning that we have four addresses and at each address we can store four bits
--This input takes in five inputs, CS, WE, OE, IN, and ADDRESS, all of them work the same way they did 
--in the SRAM 4x1, the only new input is OE (Output Enable) which adds an extra buffer between the output of the SRAM 4x1 and 
--the output of the component. The output gives out a four bit output.

library ieee;
use ieee.std_logic_1164.all;

entity sram_four_x_four is 
	port(
		grygorczuk_cs, grygorczuk_we, grygorczuk_oe: in std_logic;
		grygorczuk_in: in std_logic_vector(3 DOWNTO 0);
		grygorczuk_addresses: in std_logic_vector(1 DOWNTO 0);
		grygorczuk_output: out std_logic_vector(3 DOWNTO 0)
		);
end sram_four_x_four;
	
architecture sram_four_x_four_logic of sram_four_x_four is 

--The SRAM 4x1 is used to save and store a single bit of memory 
component sram_four_x_one is 
	port(
		grygorczuk_sram_in, grygorczuk_sram_we: in std_logic;
		grygorczuk_address: in std_logic_vector(1 DOWNTO 0);
		grygorczuk_sram_output: out std_logic 
		);
end component;

--The Tri State Buffer is used to hold the output infromation between the output of each SRAM 4x1 and the output of component
component tri_state_buffer is
    Port ( grygorczuk_input, grygorczuk_enable: in std_logic;  
           grygorczuk_output   : out std_logic
           );
end component;

signal grygorczuk_and_one, grygorczuk_and_two: std_logic;
signal grygorczuk_OUT: std_logic_vector(3 DOWNTO 0);

begin
  
grygorczuk_and_one <= grygorczuk_we and grygorczuk_cs;
grygorczuk_and_two <= grygorczuk_oe and grygorczuk_cs;

--The for loop bellow attaches each of the SRAM 4x1 to indiviudal Tri State Buffers 
sram_cell_loop: for i in 0 to 3 generate
sram_four_x_one_part: sram_four_x_one port map(grygorczuk_in(i), grygorczuk_and_one, grygorczuk_addresses, grygorczuk_OUT(i));
tri_state_buffer_part: tri_state_buffer port map(grygorczuk_OUT(i), grygorczuk_and_two, grygorczuk_output(i));
end generate;

end sram_four_x_four_logic;

				




