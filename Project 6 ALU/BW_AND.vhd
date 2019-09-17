library ieee;
use ieee.std_logic_1164.all;


entity BW_AND is
  generic(
    n: integer := 6
  );
	port(
		grygorczuk_and_1, grygorczuk_and_2: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_and: out std_logic_vector(n-1 DOWNTO 0)
	);
end BW_AND;

architecture BW_AND_LOGIC of BW_AND is

begin

AND_LOOP: for i in 0 to n-1 generate
  grygorczuk_output_and(i) <= grygorczuk_and_1(i) and grygorczuk_and_2(i);
end generate;
  
end BW_AND_LOGIC;