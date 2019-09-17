--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains the testbench for the Half Adder, going through all the info of the truth table 
--Here is the truth table for it 

--I1 I2 O CO
--0  0  0 0
--0  1  1 0
--1  0  1 0
--1  1  0 1

library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity one_adder_testbench is 
end one_adder_testbench;

architecture one_adder_testbench_logic of one_adder_testbench is

component one_adder is
  generic(
    n: integer := 32
      );
	port(
		grygorczuk_pc: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_o: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

signal PC, IMM, O: std_logic_vector(31 DOWNTO 0);

begin 
utt: one_adder port map(
 grygorczuk_pc => PC,
 grygorczuk_o => O
);

Test_Bench : process
begin 
  PC <= "00000000000000000000000000000010";
  wait for 100 ps;
  
  PC <= "00000000000000000000000000000101";
  wait for 100 ps;

end process; 

end one_adder_testbench_logic;



