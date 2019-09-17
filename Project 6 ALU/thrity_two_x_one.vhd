--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains a SRAM 4x1 meaning that is holds four diffrent addresses that the infromation can be stored to
--but it only holds one bit of infomration. This component takes in three inputs IN, WE, ADDRESS, and has one output Out
--IN stores one bit of infromation, WE tells the system to if we write to it, ADDRESS picks which D Flip Flop to store the
--information in or from which to read it from, it acts as the chip select for each flip flop, thanks to that an
--intresting scenario can occur, we can keep the WE on and change addresses to cause a rising edge which will save information
--to the switched to address without having to turn WE low then high. 
--And output is one bit of infromation read from one of the four D Filp Flops.


library ieee;
use ieee.std_logic_1164.all;

--IN is a one bit that we want to save, WE is one bit that tells us if we write or not
--ADDRESS is a two bit info that picks which of the four Flip Flops to look at 
--OUT takes out one bit of infromation from the Flip Flop
entity thirty_two_x_one is 
	port(
		grygorczuk_sram_in, grygorczuk_sram_we: in std_logic;
		grygorczuk_address: in std_logic_vector(4 DOWNTO 0);
		grygorczuk_sram_output: out std_logic 
		);
end thirty_two_x_one;
	
architecture thirty_two_x_one_logic of thirty_two_x_one is 

--The D Flip Flops act as storage devices that can save new infromation or can read saved information 
component d_flip_flop is 
	port(
		grygorczuk_in, grygorczuk_cs, grygorczuk_we: in std_logic;
		grygorczuk_output: out std_logic 
		);
end component;

--The address decoder converse the four bit input of the ADDRESS and allows us to pick the active SRAM Cell
component address_decoder is
	port(
		grygorczuk_word: in std_logic_vector(4 downto 0);
		grygorczuk_decoder_output : out std_logic_vector(31 downto 0)
		);
	end component;

signal grygorczuk_decoder_O, grygorczuk_O: std_logic_vector(31 downto 0);

begin

--The code bellow save the infromation to specifc cell based on the decoded ADDRESS
address_decoder_part: address_decoder port map(grygorczuk_address, grygorczuk_decoder_O);
sram_cell_loop: for i in 0 to 31 generate
d_flip_flop_part: d_flip_flop port map(grygorczuk_sram_in, grygorczuk_decoder_O(i), grygorczuk_sram_we, grygorczuk_O(i));
end generate;

--The code below picks which output to give based on the ADDRESS given 
with grygorczuk_address select
    	 grygorczuk_sram_output <= grygorczuk_O(0) when "00000",
											          grygorczuk_O(1) when "00001",
											          grygorczuk_O(2) when "00010",
											          grygorczuk_O(3) when "00011",
											          grygorczuk_O(4) when "00100",
											          grygorczuk_O(5) when "00101",
											          grygorczuk_O(6) when "00110",
											          grygorczuk_O(7) when "00111",
											          grygorczuk_O(8) when "01000",
											          grygorczuk_O(9) when "01001",
											          grygorczuk_O(10) when "01010",
											          grygorczuk_O(11) when "01011",
											          grygorczuk_O(12) when "01100",
											          grygorczuk_O(13) when "01101",
											          grygorczuk_O(14) when "01110",
											          grygorczuk_O(15) when "01111",
											          grygorczuk_O(16) when "10000",
											          grygorczuk_O(17) when "10001",
											          grygorczuk_O(18) when "10010",
											          grygorczuk_O(19) when "10011",
											          grygorczuk_O(20) when "10100",
											          grygorczuk_O(21) when "10101",
											          grygorczuk_O(22) when "10110",
											          grygorczuk_O(23) when "10111",
											          grygorczuk_O(24) when "11000",
											          grygorczuk_O(25) when "11001",
											          grygorczuk_O(26) when "11010",
											          grygorczuk_O(27) when "11011",
											          grygorczuk_O(28) when "11100",
											          grygorczuk_O(29) when "11101",
											          grygorczuk_O(30) when "11110",
											          grygorczuk_O(31) when "11111",
											          'Z' when others;
	
end thirty_two_x_one_logic;

				





