library ieee;
use ieee.std_logic_1164.all;

entity MUX is
	port(
		grygorczuk_x, grygorczuk_y, grygorczuk_s : in std_logic;
		grygorczuk_m : out std_logic
	);
end MUX;

architecture MUX_LOGIC of MUX is
signal AND_0, AND_1: std_logic;


begin
AND_0 <= grygorczuk_x and not grygorczuk_s; 
AND_1 <= grygorczuk_y and grygorczuk_s;
grygorczuk_m <= AND_0 or AND_1;
  
end MUX_LOGIC;