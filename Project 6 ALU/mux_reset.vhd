library ieee;
use ieee.std_logic_1164.all;

entity mux_reset is
	port(
		grygorczuk_pc_added : in std_logic_vector(31 DOWNTO 0);
	  grygorczuk_RegDst : in std_logic;
		grygorczuk_address : out std_logic_vector(31 DOWNTO 0)
	);
end mux_reset;

architecture mux_reset_logic of mux_reset is

begin
	with grygorczuk_RegDst select
		grygorczuk_address <= grygorczuk_pc_added when '0',
		                 "00000000000000000000000000000000" when '1',
		                 "00000000000000000000000000000000" when others;
  
end mux_reset_logic;



