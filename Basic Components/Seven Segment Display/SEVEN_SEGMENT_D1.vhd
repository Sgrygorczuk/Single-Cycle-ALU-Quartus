library ieee;
use ieee.std_logic_1164.all;

entity SEVEN_SEGMENT_D1 is
	port(
		grygorczuk_input_3, grygorczuk_input_2, grygorczuk_input_1, grygorczuk_input_0 : in std_logic;
		grygorczuk_output_a, grygorczuk_output_b, grygorczuk_output_c, grygorczuk_output_d, grygorczuk_output_e, grygorczuk_output_f, grygorczuk_output_g : out std_logic
	);
end SEVEN_SEGMENT_D1;

architecture SEVEN_SEGMENT_D1_LOGIC of SEVEN_SEGMENT_D1 is
signal AND_0, AND_1, A, AND_2, AND_3, B, C, AND_4, AND_5, AND_6, D, AND_7, AND_8, AND_9, E, AND_10, AND_11, AND_12, F, AND_13, AND_14, G: std_logic;

begin

AND_0 <= not grygorczuk_input_3 and grygorczuk_input_2 and not grygorczuk_input_0;
AND_1 <= not grygorczuk_input_3 and not grygorczuk_input_2 and not grygorczuk_input_1 and grygorczuk_input_0;
A <= AND_0 or AND_1;

AND_2 <= not grygorczuk_input_3 and grygorczuk_input_2 and not grygorczuk_input_1 and grygorczuk_input_0; 
AND_3 <= not grygorczuk_input_3 and grygorczuk_input_2 and grygorczuk_input_1 and not grygorczuk_input_0;
B <= AND_2 or AND_3; 

C <= not grygorczuk_input_3 and not grygorczuk_input_2 and grygorczuk_input_1 and not grygorczuk_input_0;

AND_4 <= not grygorczuk_input_2 and not grygorczuk_input_1 and grygorczuk_input_0;
AND_5 <= not grygorczuk_input_3 and grygorczuk_input_2 and not grygorczuk_input_1 and not grygorczuk_input_0;
AND_6 <= not grygorczuk_input_3 and grygorczuk_input_2 and grygorczuk_input_1 and grygorczuk_input_0;
D <= AND_4 or AND_5 or AND_6;

AND_7 <= not grygorczuk_input_3 and grygorczuk_input_0;
AND_8 <= not grygorczuk_input_2 and not grygorczuk_input_1 and grygorczuk_input_0; 
AND_9 <= not grygorczuk_input_3 and grygorczuk_input_2 and not grygorczuk_input_1;
E <= AND_7 or AND_8 or AND_9;

AND_10 <= not grygorczuk_input_3 and not grygorczuk_input_2 and grygorczuk_input_0;
AND_11 <= not grygorczuk_input_3 and not grygorczuk_input_2 and grygorczuk_input_1;
AND_12 <= not grygorczuk_input_3 and grygorczuk_input_1 and grygorczuk_input_0;
F <= AND_10 or AND_11 or AND_12;

AND_13 <= not grygorczuk_input_3 and not grygorczuk_input_2 and not grygorczuk_input_1;
AND_14 <= not grygorczuk_input_3 and grygorczuk_input_2 and grygorczuk_input_1 and grygorczuk_input_0;
G <= AND_13 or AND_14;

grygorczuk_output_a <= A; 
grygorczuk_output_b <= B; 
grygorczuk_output_c <= C; 
grygorczuk_output_d <= D; 
grygorczuk_output_e <= E; 
grygorczuk_output_f <= F; 
grygorczuk_output_g <= G; 

end SEVEN_SEGMENT_D1_LOGIC;