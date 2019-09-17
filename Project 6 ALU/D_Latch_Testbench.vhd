--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains the testbench for D-Latch. It goes through all the possible stages 
-- Of the Truth Table 

-- D C Q Q' 
-- 0 0 NO CHANGE
-- 1 0 NO CHANGE 
-- 0 1 0 1
-- 1 1 1 0

library ieee; 
use ieee.std_logic_1164.all;

entity d_latch_test is 
end d_latch_test;

architecture d_latch_test_logic of d_latch_test is

component d_latch is 
	port(
		grygorczuk_d, grygorczuk_c: in std_logic;
		grygorczuk_q, grygorczuk_q_not: out std_logic 
		);
end component; 

signal grygorczuk_DD, grygorczuk_CC: std_logic;
signal grygorczuk_QQ, grygorczuk_QQ_not: std_logic;

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: d_latch port map(
  grygorczuk_d => grygorczuk_DD,
  grygorczuk_c => grygorczuk_CC,
  grygorczuk_q => grygorczuk_QQ,
  grygorczuk_q_not => grygorczuk_QQ_not
);

--Test Bench
Test_Bench : process
begin 

wait for 100 ps; 
grygorczuk_DD <= '0';
grygorczuk_CC <= '0';

wait for 100 ps; 
grygorczuk_DD <= '1';
grygorczuk_CC <= '0';

wait for 100 ps; 
grygorczuk_DD <= '0';
grygorczuk_CC <= '1';

wait for 100 ps; 
grygorczuk_DD <= '1';
grygorczuk_CC <= '1';

end process; 
end d_latch_test_logic;
