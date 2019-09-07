library ieee;
use ieee.std_logic_1164.all;

entity FULL_ADDER is
	port(
		grygorczuk_input_3, grygorczuk_input_4, grygorczuk_carry_in: in std_logic;
		grygorczuk_output, grygorczuk_carry_out_2 : out std_logic
	);
end FULL_ADDER;

architecture FULL_ADDER_LOGIC of FULL_ADDER is
signal HALF_ADDER_OUTPUT_1,HALF_ADDER_OUTPUT_2, HALF_ADDER_CARRY_OUT_1, HALF_ADDER_CARRY_OUT_2 : std_logic;
component HALF_ADDER
port 
	(
		grygorczuk_input_1, grygorczuk_input_2 : in std_logic;
		grygorczuk_output, grygorczuk_carry_out : out std_logic
	);
end component;

begin
HALF_ADDER_1: HALF_ADDER port map(grygorczuk_input_3, grygorczuk_input_4, HALF_ADDER_OUTPUT_1, HALF_ADDER_CARRY_OUT_1);
HALF_ADDER_2: HALF_ADDER port map(grygorczuk_carry_in, HALF_ADDER_OUTPUT_1, HALF_ADDER_OUTPUT_2, HALF_ADDER_CARRY_OUT_2);
grygorczuk_output <= HALF_ADDER_OUTPUT_2;
grygorczuk_carry_out_2 <= HALF_ADDER_CARRY_OUT_1 or HAlF_ADDER_CARRY_OUT_2;
end FULL_ADDER_LOGIC;
	