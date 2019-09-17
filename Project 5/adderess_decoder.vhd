--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains a the address decoder, in this situation we only want to have four addresses
--so we set the input lenght to be two beacues we can have four outcomes with that. The code
--below shows that if we input 00 the output will be 0001 meaning the zeroth address will be active
--while all the other addresses are incative. 

library ieee;
use ieee.std_logic_1164.all;

entity address_decoder is
	port(
		grygorczuk_word: in std_logic_vector(1 downto 0);
		grygorczuk_decoder_output : out std_logic_vector(3 downto 0)
		);
	end address_decoder;
	
	architecture address_decoder_logic of address_decoder is
	
	begin
	
	with grygorczuk_word select
		grygorczuk_decoder_output <= "0001" when "00",
											  "0010" when "01",
											  "0100" when "10",
											  "1000" when "11",
											  "0000" when others;
	
	end address_decoder_logic;