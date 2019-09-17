--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains a SRAM 4x8, meaning that we have four addresses and at each address we can store eight bits
--This input takes in five inputs, CS, WE, OE, IN, and ADDRESS, all of them work the same way they did 
--in the SRAM 32x4. 

library ieee;
use ieee.std_logic_1164.all;

entity dual_x_eight is 
	port(
		grygorczuk_s_cs, grygorczuk_s_we, grygorczuk_s_oe: in std_logic;
		grygorczuk_s_in: in std_logic_vector(7 DOWNTO 0);
		grygorczuk_s_d, grygorczuk_s_t, grygorczuk_s_s: in std_logic_vector(4 DOWNTO 0);
		grygorczuk_s_output_t, grygorczuk_s_output_s: out std_logic_vector(7 DOWNTO 0)
		);
end dual_x_eight;
	
architecture dual_x_eight_logic of dual_x_eight is 

component dual_x_four is 
	port(
		grygorczuk_cs, grygorczuk_we, grygorczuk_oe: in std_logic;
		grygorczuk_in: in std_logic_vector(3 DOWNTO 0);
		grygorczuk_d, grygorczuk_t, grygorczuk_s: in std_logic_vector(4 DOWNTO 0);
		grygorczuk_output_t, grygorczuk_output_s: out std_logic_vector(3 DOWNTO 0)
		);
end component;

signal grygorczuk_unite_one_t, grygorczuk_unite_two_t, grygorczuk_unite_one_s, grygorczuk_unite_two_s: std_logic_vector(3 DOWNTO 0);

begin

dual_x_four_p1: dual_x_four port map(grygorczuk_s_cs, grygorczuk_s_we, grygorczuk_s_oe, grygorczuk_s_in(3 DOWNTO 0),
                                                     grygorczuk_s_d, grygorczuk_s_t, grygorczuk_s_s, grygorczuk_unite_one_t, grygorczuk_unite_one_s);
dual_x_four_p2: dual_x_four port map(grygorczuk_s_cs, grygorczuk_s_we, grygorczuk_s_oe, grygorczuk_s_in(7 DOWNTO 4),
                                                     grygorczuk_s_d, grygorczuk_s_t, grygorczuk_s_s, grygorczuk_unite_two_t, grygorczuk_unite_two_s);

--This loops takes the four bit outputs given by the two SRAM 32x4 and combines them into one eight bit output                                 
grygorczuk_s_output_t(3 DOWNTO 0) <= grygorczuk_unite_one_t;
grygorczuk_s_output_t(7 DOWNTO 4) <= grygorczuk_unite_two_t;

grygorczuk_s_output_s(3 DOWNTO 0) <= grygorczuk_unite_one_s;
grygorczuk_s_output_s(7 DOWNTO 4) <= grygorczuk_unite_two_s;

end dual_x_eight_logic;

				








