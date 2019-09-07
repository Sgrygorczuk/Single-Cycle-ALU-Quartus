library ieee;
use ieee.std_logic_1164.all;

entity SEVEN_SEGMENT_D2 is
	port(
		grygorczuk_sign, grygorczuk_input_z, grygorczuk_negative_flag, grygorczuk_zero_flag : in std_logic;
		grygorczuk_output_a, grygorczuk_output_b, grygorczuk_output_c, grygorczuk_output_d, grygorczuk_output_e, grygorczuk_output_f, grygorczuk_output_g : out std_logic
	);
end SEVEN_SEGMENT_D2;

architecture SEVEN_SEGMENT_D2_LOGIC of SEVEN_SEGMENT_D2 is
signal AND_0, AND_1, AND_2, OR_0, OR_1 : std_logic;

begin

AND_0 <= not grygorczuk_sign and not grygorczuk_input_z;
AND_1 <= grygorczuk_sign and grygorczuk_negative_flag;
AND_2 <= grygorczuk_sign and grygorczuk_zero_flag;
OR_0 <= AND_0 or AND_1;
OR_1 <= OR_0 or AND_2;

grygorczuk_output_a <= '1'; 
grygorczuk_output_b <= OR_1; 
grygorczuk_output_c <= OR_1; 
grygorczuk_output_d <= '1'; 
grygorczuk_output_e <= '1'; 
grygorczuk_output_f <= '1'; 
grygorczuk_output_g <= not grygorczuk_sign or grygorczuk_zero_flag; 

end SEVEN_SEGMENT_D2_LOGIC;