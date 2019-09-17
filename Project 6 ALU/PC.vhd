--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains a SRAM 4x32, meaning that we have four addresses and at each address we can store thirty two bits
--This input takes in five inputs, CS, WE, OE, IN, and ADDRESS, all of them work the same way they did 
--in the SRAM 4x4. There are five new inputs in this component Keys 0-3 and Clear. The keys act as a choice for 
--where to store eight bit of information. Beacues of the limitation of the FPGA board inuse we can't input all thirty two bits 
--at a single time, we have to do it eight at a time, therefor each key deterimes which qudarant of the thirty two bit number will be input

--Example 
--Input    Key Pressed Output 
--11110000 0           UUUUUUUU UUUUUUUU UUUUUUUU 11110000
--00110011 1           UUUUUUUU UUUUUUUU 00110011 11110000
--11001100 2           UUUUUUUU 11001100 00110011 11110000
--00001111 3           00001111 11001100 00110011 11110000

--The process of inputting the thirty two bit number is a four step process 
--Lastly there is Clear which will set the value of the current address to zero regardless of the inputs

--Example 
--Input    Clear Pressed Output 
--11110000 0             00000000 00000000 00000000 00000000

library ieee;
use ieee.std_logic_1164.all;

entity pc_reg is 
	port(
		grygorczuk_clock: in std_logic;
		grygorczuk_pc_in: in std_logic_vector(31 DOWNTO 0);
		grygorczuk_pc_out: out std_logic_vector(31 DOWNTO 0);
		grygorczuk_address: out std_logic_vector(4 DOWNTO 0) 
		);
end pc_reg;
	
architecture pc_logic of pc_reg is 

--Allows for the storage of eight bits at a time to four addresses 
component thirty_two_x_eight is 
	port(
		grygorczuk_s_cs, grygorczuk_s_we, grygorczuk_s_oe: in std_logic;
		grygorczuk_s_in: in std_logic_vector(7 DOWNTO 0);
		grygorczuk_s_addresses: in std_logic_vector(4 DOWNTO 0);
		grygorczuk_s_output: out std_logic_vector(7 DOWNTO 0)
		);
end component;

signal grygorczuk_unite_0, grygorczuk_unite_1, grygorczuk_unite_2, grygorczuk_unite_3: std_logic_vector(7 DOWNTO 0);
signal grygorczuk_output: std_logic_vector(31 DOWNTO 0);

begin

thirty_two_x_eight_one: thirty_two_x_eight port map('1', grygorczuk_clock, '1', grygorczuk_pc_in(7 DOWNTO 0), "00000", grygorczuk_unite_0);
thirty_two_x_eight_two: thirty_two_x_eight port map('1', grygorczuk_clock, '1', grygorczuk_pc_in(15 DOWNTO 8), "00000", grygorczuk_unite_1);
thirty_two_x_eight_three: thirty_two_x_eight port map('1', grygorczuk_clock, '1', grygorczuk_pc_in(23 DOWNTO 16), "00000", grygorczuk_unite_2);
thirty_two_x_eight_four: thirty_two_x_eight port map('1', grygorczuk_clock, '1', grygorczuk_pc_in(31 DOWNTO 24), "00000", grygorczuk_unite_3);
                                                                            
--Saves all the eight bit ax and bx outputs of the SRAM 32x8 to a thirty two bit output                   
grygorczuk_output(7 DOWNTO 0) <= grygorczuk_unite_0;
grygorczuk_output(15 DOWNTO 8) <= grygorczuk_unite_1;
grygorczuk_output(23 DOWNTO 16) <= grygorczuk_unite_2;
grygorczuk_output(31 DOWNTO 24) <= grygorczuk_unite_3;

grygorczuk_pc_out <= grygorczuk_output;
grygorczuk_address <= grygorczuk_output (4 DOWNTO 0);

end pc_logic;

				












