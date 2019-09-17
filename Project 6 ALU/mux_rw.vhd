library ieee;
use ieee.std_logic_1164.all;

entity mux_rw is
	port(
		grygorczuk_rd, grygorczuk_rt : in std_logic_vector(4 DOWNTO 0);
	  grygorczuk_RegDst : in std_logic;
		grygorczuk_rw : out std_logic_vector(4 DOWNTO 0)
	);
end mux_rw;

architecture mux_rw_logic of mux_rw is

begin
	with grygorczuk_RegDst select
		grygorczuk_rw <= grygorczuk_rt when '0',
		                 grygorczuk_rd when '1',
		                 "00000" when others;
  
end mux_rw_logic;

