--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains a the build for a half adder it will add two one bit inputs and give out a output and carryout.
--When one of the inputs is high the output will be high, if both are high then carry out will be high, otherwise its low. 

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
	