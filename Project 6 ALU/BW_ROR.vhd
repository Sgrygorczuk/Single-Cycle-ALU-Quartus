library ieee;
use ieee.std_logic_1164.all;

entity BW_ROR is
  generic(
    n: integer := 6
  );
	port(
		grygorczuk_ror: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_ror: out std_logic_vector(n-1 DOWNTO 0)
	);
end BW_ROR;

architecture BW_ROR_LOGIC of BW_ROR is

begin

SRL_LOOP: for i in 0 to n-2 generate
  grygorczuk_output_ror(i) <= grygorczuk_ror(i+1);
end generate;
grygorczuk_output_ror(n-1) <= grygorczuk_ror(0);
  
end BW_ROR_LOGIC;


