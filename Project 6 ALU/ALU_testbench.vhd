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

entity ALU_testbench is 
end ALU_testbench;

architecture ALU_testbench_logic of ALU_testbench is

component ALU is
	port(
		grygorczuk_AX, grygorczuk_BX: in std_logic_vector(31 DOWNTO 0);
		grygorczuk_ALUctr: in std_logic_vector(3 DOWNTO 0);
		grygorczuk_zero_flag: out std_logic;
		grygorczuk_o: out std_logic_vector(31 DOWNTO 0)
	);
end component;

signal AX, BX, O: std_logic_vector(31 DOWNTO 0);
signal ALUc: std_logic_vector(3 DOWNTO 0);
signal ZF: std_logic;

begin 
utt: ALU port map(
 grygorczuk_AX => AX,
 grygorczuk_BX => BX, 
 grygorczuk_o => O,
 grygorczuk_ALUctr => ALUc,
 grygorczuk_zero_flag => ZF
);

Test_Bench : process
begin 
  AX <= "00000000000000000000000000000010";
  BX <= "00000000000000000000000000000010";
  ALUc <= "0000";
  wait for 100 ps;
  
  AX <= "00000000000000000000000000000010";
  BX <= "00000000000000000000000000000010";
  ALUc <= "0001";
  wait for 100 ps;
  
  AX <= "00000000000000000000000000000010";
  BX <= "00000000000000000000000000000010";
  ALUc <= "0010";
  wait for 100 ps;
  
  AX <= "00000000000000000000000000000010";
  BX <= "00000000000000000000000000000010";
  ALUc <= "0011";
  wait for 100 ps;

  AX <= "00000000000000000000000000000010";
  BX <= "00000000000000000000000000000010";
  ALUc <= "0100";
  wait for 100 ps;
  
  AX <= "00000000000000000000000000000010";
  BX <= "00000000000000000000000000000010";
  ALUc <= "0101";
  wait for 100 ps;
  
  AX <= "00000000000000000000000000000010";
  BX <= "00000000000000000000000000000010";
  ALUc <= "0110";
  wait for 100 ps;
  
  AX <= "00000000000000000000000000000010";
  BX <= "00000000000000000000000000000010";
  ALUc <= "0111";
  wait for 100 ps;
  
  AX <= "00000000000000000000000000000010";
  BX <= "00000000000000000000000000000010";
  ALUc <= "1000";
  wait for 100 ps;
  
  AX <= "00000000000000000000000000000010";
  BX <= "00000000000000000000000000000010";
  ALUc <= "1001";
  wait for 100 ps;
  
  AX <= "00000000000000000000000000000010";
  BX <= "00000000000000000000000000000010";
  ALUc <= "1001";
  wait for 100 ps;
  
  AX <= "00000000000000000000000000000010";
  BX <= "00000000000000000000000000000010";
  ALUc <= "1010";
  wait for 100 ps;

end process; 

end ALU_testbench_logic;






