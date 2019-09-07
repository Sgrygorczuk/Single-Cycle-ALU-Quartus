library ieee;
use ieee.std_logic_1164.all;

entity FOUR_BIT_ADDER is
	port(
		grygorczuk_carry_in_2 : in std_logic;
		grygorczuk_carry_x, grygorczuk_carry_y: in std_logic_vector(3 DOWNTO 0);
		grygorczuk_overflow_flag, grygorczuk_negative_flag, grygorczuk_zero_flag, grygorczuk_carry_out_flag: out std_logic;
		grygorczuk_o: out std_logic_vector(3 DOWNTO 0)
	);
end FOUR_BIT_ADDER;

architecture FOUR_BIT_ADDER_LOGIC of FOUR_BIT_ADDER is
signal CARRY_OUT, OUTPUT : std_logic_vector(3 DOWNTO 0);
component FULL_ADDER
port 
	(
		grygorczuk_input_3, grygorczuk_input_4, grygorczuk_carry_in: in std_logic;
		grygorczuk_output, grygorczuk_carry_out_2 : out std_logic
	);
end component;

begin
FULL_ADDER_0: FULL_ADDER port map(grygorczuk_carry_in_2, grygorczuk_carry_x(0), OUTPUT(0), grygorczuk_o(0),CARRY_OUT(0));
FULL_ADDER_1: FULL_ADDER port map(CARRY_OUT(0), grygorczuk_carry_x(1), grygorczuk_carry_y(1), OUTPUT(1),CARRY_OUT(1));
FULL_ADDER_2: FULL_ADDER port map(CARRY_OUT(1),grygorczuk_carry_x(2), grygorczuk_carry_y(2),OUTPUT(2), CARRY_OUT(2));
FULL_ADDER_3: FULL_ADDER port map(CARRY_OUT(2), grygorczuk_carry_x(3), grygorczuk_carry_y(3), OUTPUT(3),CARRY_OUT(3));

grygorczuk_carry_out_flag <= CARRY_OUT(3);
grygorczuk_overflow_flag <= CARRY_OUT(2) xor CARRY_OUT(3);
grygorczuk_negative_flag <= OUTPUT(3);
grygorczuk_zero_flag <=  not(OUTPUT(0) and OUTPUT(1) and OUTPUT(2) and OUTPUT(3));

process is 
begin
	for i in 0 to 3 loop
		grygorczuk_o(i) <= OUTPUT(i);
	end loop; 
end process;  
  
end FOUR_BIT_ADDER_LOGIC;
	