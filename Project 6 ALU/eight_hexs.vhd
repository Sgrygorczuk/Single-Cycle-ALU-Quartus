--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains a eight seven segment displays given thrity two bit input. 

library ieee;
use ieee.std_logic_1164.all;

entity eight_hexs is 
	port(
		grygorczuk_in: in std_logic_vector(31 DOWNTO 0);
		grygorczuk_out0: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out1: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out2: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out3: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out4: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out5: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out6: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out7: out std_logic_vector(6 DOWNTO 0)
		);
end eight_hexs;
	
architecture eight_hexs_logic of eight_hexs is 

component decoder_and_seven_segment_display is 
	port(
		grygorczuk_input: in std_logic_vector(3 downto 0);
		grygorczuk_outs: out std_logic_vector(6 downto 0)
		);
end component;

signal grygorczuk_k0, grygorczuk_k1, grygorczuk_k2, grygorczuk_k3 : std_logic;
signal grygorczuk_split_0, grygorczuk_split_1, grygorczuk_split_2, grygorczuk_split_3: std_logic_vector(3 DOWNTO 0);
signal grygorczuk_split_4, grygorczuk_split_5, grygorczuk_split_6, grygorczuk_split_7: std_logic_vector(3 DOWNTO 0);

begin

--This loop breaks down the thirty two bit input into eight four bit inputs that will go into each seven segment display
split_loop: for i in 0 to 3 generate
grygorczuk_split_0(i) <= grygorczuk_in(i);
grygorczuk_split_1(i) <= grygorczuk_in(4+i);
grygorczuk_split_2(i) <= grygorczuk_in(8+i);
grygorczuk_split_3(i) <= grygorczuk_in(12+i);
grygorczuk_split_4(i) <= grygorczuk_in(16+i);
grygorczuk_split_5(i) <= grygorczuk_in(20+i);
grygorczuk_split_6(i) <= grygorczuk_in(24+i);
grygorczuk_split_7(i) <= grygorczuk_in(28+i);
end generate;

decoder_and_seven_segment_display_0: decoder_and_seven_segment_display port map(grygorczuk_split_0, grygorczuk_out0);
decoder_and_seven_segment_display_1: decoder_and_seven_segment_display port map(grygorczuk_split_1, grygorczuk_out1);
decoder_and_seven_segment_display_2: decoder_and_seven_segment_display port map(grygorczuk_split_2, grygorczuk_out2);
decoder_and_seven_segment_display_3: decoder_and_seven_segment_display port map(grygorczuk_split_3, grygorczuk_out3);
decoder_and_seven_segment_display_4: decoder_and_seven_segment_display port map(grygorczuk_split_4, grygorczuk_out4);
decoder_and_seven_segment_display_5: decoder_and_seven_segment_display port map(grygorczuk_split_5, grygorczuk_out5);
decoder_and_seven_segment_display_6: decoder_and_seven_segment_display port map(grygorczuk_split_6, grygorczuk_out6);
decoder_and_seven_segment_display_7: decoder_and_seven_segment_display port map(grygorczuk_split_7, grygorczuk_out7);
                                                     

end eight_hexs_logic;

				









