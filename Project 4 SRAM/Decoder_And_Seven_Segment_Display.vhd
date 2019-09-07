library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity decoder_and_seven_segment_display is 
	port(
		grygorczuk_input: in std_logic_vector(3 downto 0);
		grygorczuk_a, grygorczuk_b, grygorczuk_c, grygorczuk_d, grygorczuk_e, grygorczuk_f, grygorczuk_g: out std_logic 
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
				grygorczuk_data <= "0001000";
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
	
	grygorczuk_a <= grygorczuk_data(6);
	grygorczuk_b <= grygorczuk_data(5);
	grygorczuk_c <= grygorczuk_data(4);
	grygorczuk_d <= grygorczuk_data(3);
	grygorczuk_e <= grygorczuk_data(2);
	grygorczuk_f <= grygorczuk_data(1);
	grygorczuk_g <= grygorczuk_data(0);
				
end decoder_and_seven_segment_display_logic;
				