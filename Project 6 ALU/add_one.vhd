library ieee;
use ieee.std_logic_1164.all;

entity one_adder is
  generic(
    n: integer := 32
      );
	port(
		grygorczuk_pc: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_oo: out std_logic_vector(n-1 DOWNTO 0)
	);
end one_adder;

architecture one_adder_logic of one_adder is
  
constant m: integer := 32;
  
signal OUTPUT, Y_TRANSFORMED, grygorczuk_carry_x : std_logic_vector(m-1 DOWNTO 0);
signal CARRY_OUT: std_logic_vector(m DOWNTO 0);

component FULL_ADDER
port 
	(
		grygorczuk_input_3, grygorczuk_input_4, grygorczuk_carry_in: in std_logic;
		grygorczuk_output, grygorczuk_carry_out_2 : out std_logic
	);
end component;

begin
  
CARRY_OUT(0) <= '0'; -- Mistake '1'
grygorczuk_carry_x <= "00000000000000000000000000000001";

FULL_ADDER_LOOP: for i in 0 to n-1 generate
 FULL_ADDER_PART_2: FULL_ADDER port map(grygorczuk_carry_x(i), grygorczuk_pc(i), CARRY_OUT(i), OUTPUT(i),CARRY_OUT(i+1));
end generate;

grygorczuk_oo <= OUTPUT;

end one_adder_logic;

