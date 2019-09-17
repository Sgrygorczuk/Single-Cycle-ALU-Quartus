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

entity input_reg_testbench is 
end input_reg_testbench;

architecture input_reg_testbench_logic of input_reg_testbench is

component input_reg is 
	port(
    grygorczuk_oe: in std_logic;
		grygorczuk_key_0, grygorczuk_key_1, grygorczuk_key_2, grygorczuk_key_3: in std_logic;
		grygorczuk_data_in: in std_logic_vector(7 DOWNTO 0);
		grygorczuk_output: out std_logic_vector(31 DOWNTO 0)
		);
end component;

signal OEOE, K0, K1, K2, K3  : std_logic;
signal DI: std_logic_vector(7 DOWNTO 0); 
signal O:  std_logic_vector(31 DOWNTO 0);

begin 
utt: input_reg port map(
 grygorczuk_oe => OEOE, 
 grygorczuk_key_0 => K0, 
 grygorczuk_key_1 => K1, 
 grygorczuk_key_2 => K2, 
 grygorczuk_key_3 => K3, 
 grygorczuk_data_in => DI, 
 grygorczuk_output => O 
);

Test_Bench : process
begin 
  OEOE <= '1';
  K0 <= '0';
  K1 <= '0';
  K2 <= '0';
  K3 <= '0';
  DI <= "00000001";
  wait for 100 ps;
  
 OEOE <= '1';
  K0 <= '1';
  K1 <= '0';
  K2 <= '0';
  K3 <= '0';
  DI <= "00000001";
  wait for 100 ps;
  
  OEOE <= '1';
  K0 <= '0';
  K1 <= '0';
  K2 <= '0';
  K3 <= '0';
  DI <= "00000001";
  wait for 100 ps;

  OEOE <= '1';
  K0 <= '0';
  K1 <= '1';
  K2 <= '0';
  K3 <= '0';
  DI <= "00000001";
  wait for 100 ps;
  
  OEOE <= '1';
  K0 <= '0';
  K1 <= '0';
  K2 <= '0';
  K3 <= '0';
  DI <= "00000001";
  wait for 100 ps;
  
  OEOE <= '1';
  K0 <= '0';
  K1 <= '0';
  K2 <= '1';
  K3 <= '0';
  DI <= "00000001";
  wait for 100 ps;
  
  OEOE <= '1';
  K0 <= '0';
  K1 <= '0';
  K2 <= '0';
  K3 <= '0';
  DI <= "00000001";
  wait for 100 ps;
  
  OEOE <= '1';
  K0 <= '0';
  K1 <= '0';
  K2 <= '0';
  K3 <= '1';
  DI <= "00000001";
  wait for 100 ps;

end process; 

end input_reg_testbench_logic;

