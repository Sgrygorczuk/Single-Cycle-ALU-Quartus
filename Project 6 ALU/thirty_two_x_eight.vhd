--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains a SRAM 4x8, meaning that we have four addresses and at each address we can store eight bits
--This input takes in five inputs, CS, WE, OE, IN, and ADDRESS, all of them work the same way they did 
--in the SRAM 32x4. 

library ieee;
use ieee.std_logic_1164.all;

entity thirty_two_x_eight is 
	port(
		grygorczuk_s_cs, grygorczuk_s_we, grygorczuk_s_oe: in std_logic;
		grygorczuk_s_in: in std_logic_vector(7 DOWNTO 0);
		grygorczuk_s_addresses: in std_logic_vector(4 DOWNTO 0);
		grygorczuk_s_output: out std_logic_vector(7 DOWNTO 0)
		);
end thirty_two_x_eight;
	
architecture thirty_two_x_eight_logic of thirty_two_x_eight is 

component thirty_two_x_four is 
	port(
		grygorczuk_cs, grygorczuk_we, grygorczuk_oe: in std_logic;
		grygorczuk_in: in std_logic_vector(3 DOWNTO 0);
		grygorczuk_addresses: in std_logic_vector(4 DOWNTO 0);
		grygorczuk_output: out std_logic_vector(3 DOWNTO 0)
		);
end component;

signal grygorczuk_split_one, grygorczuk_split_two, grygorczuk_unite_one, grygorczuk_unite_two: std_logic_vector(3 DOWNTO 0);

begin

--This loops breaks down the eight bit input and splits it into two four bit inputs that can be handled by the SRAM 32x4 
grygorczuk_split_one <= grygorczuk_s_in(3 DOWNTO 0);
grygorczuk_split_two <= grygorczuk_s_in(7 DOWNTO 4);

thirty_two_x_four_part_one: thirty_two_x_four port map(grygorczuk_s_cs, grygorczuk_s_we, grygorczuk_s_oe, grygorczuk_split_one,
                                                     grygorczuk_s_addresses, grygorczuk_unite_one);
thirty_two_x_four_part_two: thirty_two_x_four port map(grygorczuk_s_cs, grygorczuk_s_we, grygorczuk_s_oe, grygorczuk_split_two,
                                                     grygorczuk_s_addresses, grygorczuk_unite_two);

--This loops takes the four bit outputs given by the two SRAM 32x4 and combines them into one eight bit output                                 
grygorczuk_s_output(3 DOWNTO 0) <= grygorczuk_unite_one;
grygorczuk_s_output(7 DOWNTO 4) <= grygorczuk_unite_two;

end thirty_two_x_eight_logic;

				






