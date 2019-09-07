library ieee;
use ieee.std_logic_1164.all;

entity COMPARATOR is
  generic(
    n: integer := 4
  );
	port(grygorczuk_sign : in std_logic;
		grygorczuk_X, grygorczuk_Y: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_OVF, grygorczuk_NF, grygorczuk_ZF, grygorczuk_COF: out std_logic;
		grygorczuk_OUT: out std_logic_vector(n-1 DOWNTO 0)
	);
end COMPARATOR;

architecture COMPARATOR_LOGIC of COMPARATOR is
  
signal OUTPUT : std_logic_vector(n-1 DOWNTO 0);

component N_BIT_ADDER
  generic(
    n: integer := 4
  );
	port(
		grygorczuk_carry_in_2, grygorczuk_signed : in std_logic;
		grygorczuk_carry_x, grygorczuk_carry_y: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_overflow_flag, grygorczuk_negative_flag, grygorczuk_zero_flag, grygorczuk_carry_out_flag: out std_logic;
		grygorczuk_o: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

begin 
   
N_BIT_ADDER_PART: N_BIT_ADDER port map('1', grygorczuk_sign, grygorczuk_X,grygorczuk_Y, grygorczuk_OVF, grygorczuk_NF, grygorczuk_ZF,grygorczuk_COF, grygorczuk_OUT);

end COMPARATOR_LOGIC;