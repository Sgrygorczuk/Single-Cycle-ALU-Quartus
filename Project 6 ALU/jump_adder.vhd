library ieee;
use ieee.std_logic_1164.all;

entity jump_adder is
  generic(
    n: integer := 32
      );
	port(
		grygorczuk_pc, grygorczuk_imm: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_pc_o: out std_logic_vector(n-1 DOWNTO 0)
	);
end jump_adder;

architecture jump_adder_logic of jump_adder is
  
constant m: integer := 32;
  
signal OUTPUT, Y_TRANSFORMED : std_logic_vector(m-1 DOWNTO 0);
signal CARRY_OUT: std_logic_vector(m DOWNTO 0);

component FULL_ADDER
port 
	(
		grygorczuk_input_3, grygorczuk_input_4, grygorczuk_carry_in: in std_logic;
		grygorczuk_output, grygorczuk_carry_out_2 : out std_logic
	);
end component;

begin

CARRY_OUT(0) <= '1';

NEGATE_LOOP: for i in 0 to n-1 generate
  Y_TRANSFORMED(i) <= grygorczuk_imm(i) xor '1';
end generate;

FULL_ADDER_LOOP: for i in 0 to n-1 generate
 FULL_ADDER_PART_3: FULL_ADDER port map(grygorczuk_pc(i), Y_TRANSFORMED(i), CARRY_OUT(i), OUTPUT(i),CARRY_OUT(i+1));
end generate;

grygorczuk_pc_o <= OUTPUT;
  
end jump_adder_logic;

