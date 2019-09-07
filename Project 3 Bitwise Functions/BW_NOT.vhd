library ieee;
use ieee.std_logic_1164.all;

entity BW_NOT is
  generic(
    n: integer := 6
  );
	port(
		grygorczuk_not: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_not: out std_logic_vector(n-1 DOWNTO 0)
	);
end BW_NOT;

architecture BW_NOT_LOGIC of BW_NOT is

begin

NOT_LOOP: for i in 0 to n-1 generate
  grygorczuk_output_not(i) <= not grygorczuk_not(i);
end generate;
  
end BW_NOT_LOGIC;

