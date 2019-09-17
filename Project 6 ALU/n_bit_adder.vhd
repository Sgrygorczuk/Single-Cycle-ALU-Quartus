library ieee;
use ieee.std_logic_1164.all;

entity N_BIT_ADDER is
  generic(
    n: integer := 32
      );
	port(
		grygorczuk_subtract: in std_logic;
		grygorczuk_carry_x, grygorczuk_carry_y: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_overflow_flag, grygorczuk_negative_flag, grygorczuk_zero_flag, grygorczuk_carry_out_flag: out std_logic;
		grygorczuk_o: out std_logic_vector(n-1 DOWNTO 0)
	);
end N_BIT_ADDER;

architecture N_BIT_ADDER_LOGIC of N_BIT_ADDER is
  
constant m: integer := 32;
  
signal OUTPUT, Y_TRANSFORMED : std_logic_vector(m-1 DOWNTO 0);
signal CARRY_OUT, OUTPUT_ZERO_CHECK: std_logic_vector(m DOWNTO 0);
signal ZERO: std_logic;

component FULL_ADDER
port 
	(
		grygorczuk_input_3, grygorczuk_input_4, grygorczuk_carry_in: in std_logic;
		grygorczuk_output, grygorczuk_carry_out_2 : out std_logic
	);
end component;

begin
  
CARRY_OUT(0) <= grygorczuk_subtract; -- Mistake '1'

NEGATE_LOOP: for i in 0 to n-1 generate
  Y_TRANSFORMED(i) <= grygorczuk_carry_y(i) xor grygorczuk_subtract;
end generate;

FULL_ADDER_LOOP: for i in 0 to n-1 generate
 FULL_ADDER_PART: FULL_ADDER port map(grygorczuk_carry_x(i), Y_TRANSFORMED(i), CARRY_OUT(i), OUTPUT(i),CARRY_OUT(i+1));
end generate;

OUTPUT_ASSING_LOOP: for i in 0 to n-1 generate
  grygorczuk_o(i) <= OUTPUT(i);
end generate;

grygorczuk_carry_out_flag <= CARRY_OUT(n);
grygorczuk_overflow_flag <= '0' and (CARRY_OUT(n) xor CARRY_OUT(n-1));
grygorczuk_negative_flag <=  OUTPUT(n-1);

OUTPUT_ZERO_CHECK(0) <= '0';
ZERO_LOOP: for i in 0 to n-1 generate
  OUTPUT_ZERO_CHECK(i+1) <= OUTPUT_ZERO_CHECK(i) or OUTPUT(i);
end generate;
grygorczuk_zero_flag <=  not OUTPUT_ZERO_CHECK(n);
  
end N_BIT_ADDER_LOGIC;
