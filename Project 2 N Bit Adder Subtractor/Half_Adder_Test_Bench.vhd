library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Half_Adder_Test is 
end Half_Adder_Test;

architecture Half_Adder_Test_Logic of Half_Adder_Test is

component HALF_ADDER is
	port(
		grygorczuk_input_1, grygorczuk_input_2 : in std_logic;
		grygorczuk_output, grygorczuk_carry_out : out std_logic
	);
end component;

signal I1, I2, O, CO : std_logic;

begin 
utt: HALF_ADDER port map(
 grygorczuk_input_1 => I1, 
 grygorczuk_input_2 => I2, 
 grygorczuk_output => O, 
 grygorczuk_carry_out => CO 
);

Test_Bench : process
begin 
  I1 <= '0';
  I2 <= '0';
  wait for 100 ps;
  I1 <= '1';
  I2 <= '0';
  wait for 100 ps;
  I1 <= '0';
  I2 <= '1';
  wait for 100 ps;
  I1 <= '1';
  I2 <= '1';
  wait for 100 ps;
end process; 

end Half_Adder_Test_Logic;