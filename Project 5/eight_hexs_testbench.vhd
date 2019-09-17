--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains the testbench for the the Eight Hex decoders

--INPUT = 1111 0000 0101 0011 0010 1000 0110 1100
--INPUT   DECODED      SYMBOL 
--1111    0111000      f
--0000    0000001      0
--0101    0100100      5
--0011    0000110      3
--0010    0010010      2
--1000    0000000      8
--0110    0100000      6
--1100    0110001      c

library ieee; 
use ieee.std_logic_1164.all;

entity eight_hexs_testbench is 
end eight_hexs_testbench;

architecture eight_hexs_testbench_logic of eight_hexs_testbench is

component eight_hexs is 
	port(
		grygorczuk_in: in std_logic_vector(31 DOWNTO 0);
		grygorczuk_out0: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out1: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out2: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out3: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out4: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out5: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out6: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out7: out std_logic_vector(6 DOWNTO 0)
		);
end component;

signal grygorczuk_o0, grygorczuk_o1, grygorczuk_o2, grygorczuk_o3: std_logic_vector(6 DOWNTO 0);
signal grygorczuk_o4, grygorczuk_o5, grygorczuk_o6, grygorczuk_o7: std_logic_vector(6 DOWNTO 0);
signal grygorczuk_ININ: std_logic_vector(31 DOWNTO 0);


begin 
  ------Instantiate the Unit Under Test (UUT)
utt: eight_hexs port map(
  grygorczuk_out0 => grygorczuk_o0,
  grygorczuk_out1 => grygorczuk_o1,
  grygorczuk_out2 => grygorczuk_o2,
  grygorczuk_out3 => grygorczuk_o3,
  grygorczuk_out4 => grygorczuk_o4,
  grygorczuk_out5 => grygorczuk_o5,
  grygorczuk_out6 => grygorczuk_o6,
  grygorczuk_out7 => grygorczuk_o7,
  grygorczuk_in => grygorczuk_ININ
);

--Test Bench
Test_Bench : process
begin 

grygorczuk_ININ <= "11110000010100110010100001101100";
wait for 100 ps;


end process; 
end eight_hexs_testbench_logic;







