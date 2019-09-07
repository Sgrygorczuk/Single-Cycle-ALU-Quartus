library ieee;
use ieee.std_logic_1164.all;


entity BW_OR is
  generic(
    n: integer := 6
  );
	port(
		grygorczuk_or_1, grygorczuk_or_2: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_or: out std_logic_vector(n-1 DOWNTO 0)
	);
end BW_OR;

architecture BW_OR_LOGIC of BW_OR is

begin

OR_LOOP: for i in 0 to n-1 generate
  grygorczuk_output_or(i) <= grygorczuk_or_1(i) or grygorczuk_or_2(i);
end generate;
  
end BW_OR_LOGIC;