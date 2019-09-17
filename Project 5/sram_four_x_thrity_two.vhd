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

entity sram_four_x_thirty_two is 
	port(
		grygorczuk_cs, grygorczuk_we, grygorczuk_oe: in std_logic;
		grygorczuk_key_0, grygorczuk_key_1, grygorczuk_key_2, grygorczuk_key_3, grygorczuk_clear: in std_logic;
		grygorczuk_in: in std_logic_vector(7 DOWNTO 0);
		grygorczuk_addresses: in std_logic_vector(1 DOWNTO 0);
		grygorczuk_output: out std_logic_vector(31 DOWNTO 0)
		);
end sram_four_x_thirty_two;
	
architecture sram_four_x_thirty_two_logic of sram_four_x_thirty_two is 

--Allows for the storage of eight bits at a time to four addresses 
component sram_four_x_eight is 
	port(
		grygorczuk_s_cs, grygorczuk_s_we, grygorczuk_s_oe: in std_logic;
		grygorczuk_s_in: in std_logic_vector(7 DOWNTO 0);
		grygorczuk_s_addresses: in std_logic_vector(1 DOWNTO 0);
		grygorczuk_s_output: out std_logic_vector(7 DOWNTO 0)
		);
end component;

signal grygorczuk_unite_0, grygorczuk_unite_1, grygorczuk_unite_2, grygorczuk_unite_3: std_logic_vector(7 DOWNTO 0);
signal grygorczuk_k0, grygorczuk_k1, grygorczuk_k2, grygorczuk_k3 : std_logic;
signal grygorczuk_input: std_logic_vector(7 DOWNTO 0);

begin
  
with grygorczuk_clear select
		grygorczuk_input <= grygorczuk_in when '0',
											  "00000000" when '1',
											  "00000000" when others;

--The keys are negated beacues the board is set to have the buttons in 1 when unpressed and 0 when pressed
--If clear is pressed all buttons are turned on
grygorczuk_k0 <= (grygorczuk_we and not grygorczuk_key_0) or grygorczuk_clear;
grygorczuk_k1 <= (grygorczuk_we and not grygorczuk_key_1) or grygorczuk_clear;
grygorczuk_k2 <= (grygorczuk_we and not grygorczuk_key_2) or grygorczuk_clear;
grygorczuk_k3 <= (grygorczuk_we and not grygorczuk_key_3) or grygorczuk_clear;

sram_four_x_eight_one: sram_four_x_eight port map(grygorczuk_cs, grygorczuk_k0, grygorczuk_oe, grygorczuk_input,
                                                     grygorczuk_addresses, grygorczuk_unite_0);
sram_four_x_eight_two: sram_four_x_eight port map(grygorczuk_cs, grygorczuk_k1, grygorczuk_oe, grygorczuk_input,
                                                     grygorczuk_addresses, grygorczuk_unite_1);
sram_four_x_eight_three: sram_four_x_eight port map(grygorczuk_cs, grygorczuk_k2, grygorczuk_oe, grygorczuk_input,
                                                     grygorczuk_addresses, grygorczuk_unite_2);
sram_four_x_eight_four: sram_four_x_eight port map(grygorczuk_cs, grygorczuk_k3, grygorczuk_oe, grygorczuk_input,
                                                     grygorczuk_addresses, grygorczuk_unite_3);
                                
--Saves all the eight bit outputs of the SRAM 4x8 to a thirty two bit output                   
grygorczuk_output(7 DOWNTO 0) <= grygorczuk_unite_0;
grygorczuk_output(15 DOWNTO 8) <= grygorczuk_unite_1;
grygorczuk_output(23 DOWNTO 16) <= grygorczuk_unite_2;
grygorczuk_output(31 DOWNTO 24) <= grygorczuk_unite_3;

end sram_four_x_thirty_two_logic;

				







