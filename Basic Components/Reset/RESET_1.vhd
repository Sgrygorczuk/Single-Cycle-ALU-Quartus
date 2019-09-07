library ieee;
use ieee.std_logic_1164.all;

entity RESET_1 is
	port(
		grygorczuk_input_0, grygorczuk_input_1, grygorczuk_input_2, grygorczuk_input_3 : in std_logic;
		grygorczuk_output_0, grygorczuk_output_1, grygorczuk_output_2,  grygorczuk_output_3: out std_logic
	);
end RESET_1;

architecture RESET_LOGIC of RESET_1 is
signal AND_0, AND_1,OR_0, AND_2, AND_3, OR_1 : std_logic;

begin

AND_0 <= grygorczuk_input_1 and not grygorczuk_input_3;
AND_1 <= not grygorczuk_input_1 and grygorczuk_input_2 and grygorczuk_input_3;
OR_0 <= AND_0 or AND_1;

AND_2 <= grygorczuk_input_2 and not grygorczuk_input_3;
AND_3 <= grygorczuk_input_1 and grygorczuk_input_2;
OR_1 <= AND_2 or AND_3;

grygorczuk_output_0 <= grygorczuk_input_0;
grygorczuk_output_1 <= OR_0;
grygorczuk_output_2 <= OR_1;
grygorczuk_output_3 <= grygorczuk_input_3;

end RESET_LOGIC;