--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains a the address decoder, in this situation we only want to have four addresses
--so we set the input lenght to be two beacues we can have four outcomes with that. The code
--below shows that if we input 0000 the output will be 00000000000000000000000000000001 meaning the zeroth address will be active
--while all the other addresses are incative. 

library ieee;
use ieee.std_logic_1164.all;

entity address_decoder is
	port(
		grygorczuk_word: in std_logic_vector(4 downto 0);
		grygorczuk_decoder_output : out std_logic_vector(31 downto 0)
		);
	end address_decoder;
	
	architecture address_decoder_logic of address_decoder is
	
	begin 
	
	with grygorczuk_word select
		grygorczuk_decoder_output <= "00000000000000000000000000000001" when "00000",
											  "00000000000000000000000000000010" when "00001",
											  "00000000000000000000000000000100" when "00010",
											  "00000000000000000000000000001000" when "00011",
											  "00000000000000000000000000010000" when "00100",
											  "00000000000000000000000000100000" when "00101",
											  "00000000000000000000000001000000" when "00110",
											  "00000000000000000000000010000000" when "00111",
											  "00000000000000000000000100000000" when "01000",
											  "00000000000000000000001000000000" when "01001",
											  "00000000000000000000010000000000" when "01010",
											  "00000000000000000000100000000000" when "01011",
											  "00000000000000000001000000000000" when "01100",
											  "00000000000000000010000000000000" when "01101",
											  "00000000000000000100000000000000" when "01110",
											  "00000000000000001000000000000000" when "01111",
											  "00000000000000010000000000000000" when "10000",
											  "00000000000000100000000000000000" when "10001",
											  "00000000000001000000000000000000" when "10010",
											  "00000000000010000000000000000000" when "10011",
											  "00000000000100000000000000000000" when "10100",
											  "00000000001000000000000000000000" when "10101",
											  "00000000010000000000000000000000" when "10110",
											  "00000000100000000000000000000000" when "10111",
											  "00000001000000000000000000000000" when "11000",
											  "00000010000000000000000000000000" when "11001",
											  "00000100000000000000000000000000" when "11010",
											  "00001000000000000000000000000000" when "11011",
											  "00010000000000000000000000000000" when "11100",
											  "00100000000000000000000000000000" when "11101",
											  "01000000000000000000000000000000" when "11110",
											  "10000000000000000000000000000000" when "11111",
											  "00000000000000000000000000000000" when others;
	
	end address_decoder_logic;