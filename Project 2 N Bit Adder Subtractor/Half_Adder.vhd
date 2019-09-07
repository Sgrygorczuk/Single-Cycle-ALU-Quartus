library ieee;
use ieee.std_logic_1164.all;

entity HALF_ADDER is
	port(
		grygorczuk_input_1, grygorczuk_input_2 : in std_logic;
		grygorczuk_output, grygorczuk_carry_out : out std_logic
	);
end HALF_ADDER;

architecture HALF_ADDER_LOGIC of HALF_ADDER is
begin
	grygorczuk_output <= grygorczuk_input_1 xor grygorczuk_input_2;
	grygorczuk_carry_out <= grygorczuk_input_1 and grygorczuk_input_2;
end HALF_ADDER_LOGIC;
	