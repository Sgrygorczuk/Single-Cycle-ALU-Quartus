library ieee;
use ieee.std_logic_1164.all;

entity BW_SLL is
  generic(
    n: integer := 6
  );
	port(
		grygorczuk_sll: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_sll: out std_logic_vector(n-1 DOWNTO 0)
	);
end BW_SLL;

architecture BW_SLL_LOGIC of BW_SLL is

begin

SLL_LOOP: for i in 0 to n-2 generate
  grygorczuk_output_sll(i+1) <= grygorczuk_sll(i);
end generate;
grygorczuk_output_sll(0) <= '0';
  
end BW_SLL_LOGIC;


