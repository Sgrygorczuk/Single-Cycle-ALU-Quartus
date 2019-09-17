library ieee;
use ieee.std_logic_1164.all;

entity mux is
	port(
		grygorczuk_0, grygorczuk_1 : in std_logic_vector(31 DOWNTO 0);
	  grygorczuk_s : in std_logic;
		grygorczuk_m : out std_logic_vector(31 DOWNTO 0)
	);
end MUX;

architecture mux_logic of mux is


begin
	with grygorczuk_s select
		grygorczuk_m <= grygorczuk_0 when '0',
		                             grygorczuk_1 when '1',
		                             "00000000000000000000000000000000" when others;
  
end mux_logic;
