--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains a a four bit to seven segement display decoder, it turns and four bit input into fifteen hex characters. 
--The way the FPGA board is set up is that 0 is on and 1 is off. Below is the seven bit info to character dispalyed on the 
--seven segment display 

--when "0000" => "0000001"; 0
--when "0001" => "1001111"; 1
--when "0010" => "0010010"; 2
--when "0011" => "0000110"; 3
--when "0100" => "1001100"; 4
--when "0101" => "0100100"; 5
--when "0110" => "0100000"; 6
--when "0111" => "0001111"; 7
--when "1000" => "0000000"; 8 
--when "1001" => "0001100"; 9 
--when "1010" => "0001000"; a 
--when "1011" => "1100000"; b
--when "1100" => "0110001"; c 
--when "1101" => "1000010"; d 
--when "1110" => "0110000"; e 
--when "1111" => "0111000"; f 
--when others => "1111111"; BLANK


library ieee;
use ieee.std_logic_1164.all;

entity decoder_and_seven_segment_display is 
	port(
		grygorczuk_input: in std_logic_vector(3 downto 0);
		grygorczuk_outs: out std_logic_vector(6 downto 0)
		);
end decoder_and_seven_segment_display;
	
architecture decoder_and_seven_segment_display_logic of decoder_and_seven_segment_display is 

signal grygorczuk_data : std_logic_vector(6 downto 0);

begin 

	process (grygorczuk_input)
		begin
			case grygorczuk_input is 
			when "0000" =>
				grygorczuk_data <= "0000001";
			when "0001" =>
				grygorczuk_data <= "1001111";
			when "0010" =>
				grygorczuk_data <= "0010010";
			when "0011" =>
				grygorczuk_data <= "0000110";
			when "0100" =>
				grygorczuk_data <= "1001100";
			when "0101" =>
				grygorczuk_data <= "0100100";
			when "0110" =>
				grygorczuk_data <= "0100000";
			when "0111" =>
				grygorczuk_data <= "0001111";
			when "1000" =>
				grygorczuk_data <= "0000000";
			when "1001" =>
				grygorczuk_data <= "0001100";
			when "1010" =>
				grygorczuk_data <= "0001000";
			when "1011" =>
				grygorczuk_data <= "1100000";
			when "1100" =>
				grygorczuk_data <= "0110001";
			when "1101" =>
				grygorczuk_data <= "1000010";
			when "1110" =>
				grygorczuk_data <= "0110000";
			when "1111" =>
				grygorczuk_data <= "0111000";
			when others =>
				grygorczuk_data <= "1111111";
		end case;
	end process;
	
	grygorczuk_outs(6) <= grygorczuk_data(6);
	grygorczuk_outs(5) <= grygorczuk_data(5);
	grygorczuk_outs(4) <= grygorczuk_data(4);
	grygorczuk_outs(3) <= grygorczuk_data(3);
	grygorczuk_outs(2) <= grygorczuk_data(2);
	grygorczuk_outs(1) <= grygorczuk_data(1);
	grygorczuk_outs(0) <= grygorczuk_data(0);
				
end decoder_and_seven_segment_display_logic;
				