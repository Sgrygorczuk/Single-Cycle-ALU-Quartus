library ieee;
use ieee.std_logic_1164.all;

entity decoder_switch is
	port(
		grygorczuk_word: in std_logic_vector(1 downto 0);
		grygorczuk_decoder_output : out std_logic_vector(3 downto 0)
		);
	end decoder_switch;
	
	architecture decoder_switch_logic of decoder_switch is
	
	begin
	
	with grygorczuk_word select
		grygorczuk_decoder_output <= "0001" when "00",
											  "0010" when "01",
											  "0100" when "10",
											  "1000" when "11",
											  "0000" when others;
	
	end decoder_switch_logic;