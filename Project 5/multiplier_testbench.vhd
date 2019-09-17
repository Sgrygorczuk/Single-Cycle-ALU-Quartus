--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains the testbench for the the SRAM 4x8 the inputs and outputs are too long to display as a comment reffer to the 
--simulation graph, this test if we save all the information to only one register and check if the clear function works 

library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity mutlipler_testbench is 
end mutlipler_testbench;

architecture mutlipler_testbench_logic of mutlipler_testbench is

component Multiplier is
	port(
	  grygorczuk_input_a, grygorczuk_input_b: in  std_logic_vector(31 DOWNTO 0);
	  grygorczuk_m_output: out std_logic_vector(63 DOWNTO 0)
	);
end component;

signal grygorczuk_IN_1, grygorczuk_IN_2, grygorczuk_ADD: std_logic_vector(31 DOWNTO 0);
signal grygorczuk_OUT : std_logic_vector(63 DOWNTO 0);

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: Multiplier port map(
  grygorczuk_input_a => grygorczuk_IN_1,
  grygorczuk_input_b => grygorczuk_IN_2,
  grygorczuk_m_output => grygorczuk_OUT
);

--Test Bench
Test_Bench : process
begin 

grygorczuk_IN_1 <= "00000000000000000000000001111011";
grygorczuk_IN_2 <= "00000000000000000000000000000001";
wait for 100 ps;

end process; 
end mutlipler_testbench_logic;





