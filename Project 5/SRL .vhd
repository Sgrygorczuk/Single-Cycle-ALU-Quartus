library ieee;
use ieee.std_logic_1164.all;

entity BW_SRL is
  generic(
    n: integer := 32
  );
	port(
		grygorczuk_srl: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_srl: out std_logic_vector(n-1 DOWNTO 0)
	);
end BW_SRL;

architecture BW_SRL_LOGIC of BW_SRL is

begin

SRL_LOOP: for i in 0 to n-2 generate
  grygorczuk_output_srl(i) <= grygorczuk_srl(i+1);
end generate;
grygorczuk_output_srl(n-1) <= '0';
  
end BW_SRL_LOGIC;
