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

entity dual_d_flip_flop_testbench is 
end dual_d_flip_flop_testbench;

architecture dual_d_flip_flop_testbench_logic of dual_d_flip_flop_testbench is

component dual_d_flip_flop is 
	port(
		grygorczuk_in, grygorczuk_chip_select_d, grygorczuk_chip_select_t, grygorczuk_chip_select_s, grygorczuk_we: in std_logic;
		grygorczuk_output_t, grygorczuk_output_s: out std_logic 
		);
end component; 

signal grygorczuk_ININ, grygorczuk_D, grygorczuk_T, grygorczuk_S, grygorczuk_WEWE : std_logic;
signal grygorczuk_TT, grygorczuk_SS: std_logic;

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: dual_d_flip_flop port map(

  grygorczuk_in => grygorczuk_ININ,
  grygorczuk_chip_select_d => grygorczuk_D,
  grygorczuk_chip_select_t => grygorczuk_T,
  grygorczuk_chip_select_s => grygorczuk_S,
  grygorczuk_we => grygorczuk_WEWE,
  grygorczuk_output_t => grygorczuk_TT,
  grygorczuk_output_s => grygorczuk_SS
);

--Test Bench
Test_Bench : process
begin 

wait for 100 ps; 
grygorczuk_ININ <= '0';
grygorczuk_D <= '0';
grygorczuk_T <= '0';
grygorczuk_S <= '0';
grygorczuk_WEWE <= '0';

wait for 100 ps; 
grygorczuk_ININ <= '1';
grygorczuk_D <= '1';
grygorczuk_T <= '0';
grygorczuk_S <= '0';
grygorczuk_WEWE <= '1';

wait for 100 ps; 
grygorczuk_ININ <= '0';
grygorczuk_D <= '0';
grygorczuk_T <= '1';
grygorczuk_S <= '0';
grygorczuk_WEWE <= '0';

wait for 100 ps; 
grygorczuk_ININ <= '1';
grygorczuk_D <= '0';
grygorczuk_T <= '0';
grygorczuk_S <= '1';
grygorczuk_WEWE <= '0';

wait for 100 ps; 
grygorczuk_ININ <= '0';
grygorczuk_D <= '1';
grygorczuk_T <= '1';
grygorczuk_S <= '1';
grygorczuk_WEWE <= '1';

end process; 
end dual_d_flip_flop_testbench_logic;

