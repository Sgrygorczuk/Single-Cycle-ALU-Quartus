
library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Full_Adder_Test is 
end Full_Adder_Test;

architecture Full_Adder_Test_Logic of Full_Adder_Test is

component FULL_ADDER is
	port(
		grygorczuk_input_3, grygorczuk_input_4, grygorczuk_carry_in: in std_logic;
		grygorczuk_output, grygorczuk_carry_out_2 : out std_logic
	);
end component;

signal I1, I2, CI, O, CO : std_logic;

begin 
utt: FULL_ADDER port map(
 grygorczuk_input_3 => I1, 
 grygorczuk_input_4 => I2, 
 grygorczuk_carry_in => CI,
 grygorczuk_output => O, 
 grygorczuk_carry_out_2 => CO 
);

Test_Bench : process
begin 
  I1 <= '0';
  I2 <= '0';
  CI <= '0';
  wait for 100 ps;
  I1 <= '1';
  I2 <= '0';
  CI <= '0';
  wait for 100 ps;
  I1 <= '0';
  I2 <= '1';
  CI <= '0';
  wait for 100 ps;
  I1 <= '1';
  I2 <= '1';
  CI <= '0';
  wait for 100 ps;
   I1 <= '0';
  I2 <= '0';
  CI <= '1';
  wait for 100 ps;
  I1 <= '1';
  I2 <= '0';
  CI <= '1';
  wait for 100 ps;
  I1 <= '0';
  I2 <= '1';
  CI <= '1';
  wait for 100 ps;
  I1 <= '1';
  I2 <= '1';
  CI <= '1';
  wait for 100 ps;
end process; 

end Full_Adder_Test_Logic;
