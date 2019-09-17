library ieee;
use ieee.std_logic_1164.all;

entity extender is
	port(
		grygorczuk_imm : in std_logic_vector(15 DOWNTO 0);
	  grygorczuk_ExtOp : in std_logic;
		grygorczuk_output : out std_logic_vector(31 DOWNTO 0)
	);
end extender;

architecture extender_logic of extender is

begin
  
  grygorczuk_output(15 DOWNTO 0) <=  grygorczuk_imm;
  
	with grygorczuk_ExtOp select
		grygorczuk_output(31 DOWNTO 16) <= "0000000000000000" when '0',
		                 "1111111111111111" when '1',
		                 "ZZZZZZZZZZZZZZZZ" when others;
  
end extender_logic;