--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains the testbench for the Tri State Buffer, It goes through all the possible stages 
--Of the Truth Table 

-- IN EN O
-- 0  0  Z
-- 1  0  Z
-- 0  1  1
-- 1  1  1

library ieee; 
use ieee.std_logic_1164.all;

entity tri_state_buffer_testbench is 
end tri_state_buffer_testbench;

architecture tri_state_buffer_testbench_logic of tri_state_buffer_testbench is

component tri_state_buffer is
    Port ( grygorczuk_input, grygorczuk_enable: in std_logic;  
           grygorczuk_output   : out std_logic
           );
end component; 

signal grygorczuk_IN, grygorczuk_EN: std_logic;
signal grygorczuk_O: std_logic;

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: tri_state_buffer port map(
  grygorczuk_input => grygorczuk_IN,
  grygorczuk_enable => grygorczuk_EN,
  grygorczuk_output => grygorczuk_O
);

--Test Bench
Test_Bench : process
begin 

wait for 100 ps; 
grygorczuk_IN <= '0';
grygorczuk_EN <= '0';

wait for 100 ps; 
grygorczuk_IN <= '1';
grygorczuk_EN <= '0';

wait for 100 ps; 
grygorczuk_IN <= '0';
grygorczuk_EN <= '1';

wait for 100 ps; 
grygorczuk_IN <= '1';
grygorczuk_EN <= '1';

end process; 
end tri_state_buffer_testbench_logic;


