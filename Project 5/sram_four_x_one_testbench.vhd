--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains the testbench for the the SRAM 4x1

--Here we test to see if each of the Flip Flops saves and can read the information after we wrote in it(U = UNKNOW) 
--IN WE ADD O
--0  0  00  U
--0  1  00  0
--0  0  00  0
--1  1  00  1
--0  0  01  U
--0  1  01  0
--0  0  01  0
--1  1  01  1
--0  0  10  U
--0  1  10  0
--0  0  10  0
--1  1  10  1
--0  0  11  U
--0  1  11  0
--0  0  11  0
--1  1  11  1
--0  0  00  1
--0  0  01  1
--0  0  01  1
--0  0  11  1


library ieee; 
use ieee.std_logic_1164.all;

entity sram_four_x_one_testbench is 
end sram_four_x_one_testbench;

architecture sram_four_x_one_testbench_logic of sram_four_x_one_testbench is

component sram_four_x_one is 
	port(
		grygorczuk_sram_in, grygorczuk_sram_we: in std_logic;
		grygorczuk_address: in std_logic_vector(1 DOWNTO 0);
		grygorczuk_sram_output: out std_logic 
		);
end component;

signal grygorczuk_INPUT, grygorczuk_WRITE_ENABLE, grygorczuk_O: std_logic;
signal grygorczuk_ADD : std_logic_vector(1 DOWNTO 0);

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: sram_four_x_one port map(
  grygorczuk_sram_in => grygorczuk_INPUT,
  grygorczuk_address => grygorczuk_ADD,
  grygorczuk_sram_we => grygorczuk_WRITE_ENABLE,
  grygorczuk_sram_output => grygorczuk_O
);

--Test Bench
Test_Bench : process
begin 

-- Adress 0
grygorczuk_INPUT <= '0';
grygorczuk_ADD <= "00";
grygorczuk_WRITE_ENABLE <= '0';
wait for 100 ps; 

grygorczuk_INPUT <= '0';
grygorczuk_ADD <= "00";
grygorczuk_WRITE_ENABLE <= '1';
wait for 100 ps; 

grygorczuk_INPUT <= '0';
grygorczuk_ADD <= "00";
grygorczuk_WRITE_ENABLE <= '0';
wait for 100 ps; 

grygorczuk_INPUT <= '1';
grygorczuk_ADD <= "00";
grygorczuk_WRITE_ENABLE <= '1';
wait for 100 ps; 

--Adress 1

grygorczuk_INPUT <= '0';
grygorczuk_ADD <= "01";
grygorczuk_WRITE_ENABLE <= '0';
wait for 100 ps; 

grygorczuk_INPUT <= '0';
grygorczuk_ADD <= "01";
grygorczuk_WRITE_ENABLE <= '1';
wait for 100 ps; 

grygorczuk_INPUT <= '0';
grygorczuk_ADD <= "01";
grygorczuk_WRITE_ENABLE <= '0';
wait for 100 ps; 

grygorczuk_INPUT <= '1';
grygorczuk_ADD <= "01";
grygorczuk_WRITE_ENABLE <= '1';
wait for 100 ps;

--Address 2

grygorczuk_INPUT <= '0';
grygorczuk_ADD <= "10";
grygorczuk_WRITE_ENABLE <= '0';
wait for 100 ps; 

grygorczuk_INPUT <= '0';
grygorczuk_ADD <= "10";
grygorczuk_WRITE_ENABLE <= '1';
wait for 100 ps; 

grygorczuk_INPUT <= '0';
grygorczuk_ADD <= "10";
grygorczuk_WRITE_ENABLE <= '0';
wait for 100 ps; 

grygorczuk_INPUT <= '1';
grygorczuk_ADD <= "10";
grygorczuk_WRITE_ENABLE <= '1';
wait for 100 ps;

--Adress 4

grygorczuk_INPUT <= '0';
grygorczuk_ADD <= "11";
grygorczuk_WRITE_ENABLE <= '0';
wait for 100 ps; 

grygorczuk_INPUT <= '0';
grygorczuk_ADD <= "11";
grygorczuk_WRITE_ENABLE <= '1';
wait for 100 ps; 

grygorczuk_INPUT <= '0';
grygorczuk_ADD <= "11";
grygorczuk_WRITE_ENABLE <= '0';
wait for 100 ps; 

grygorczuk_INPUT <= '1';
grygorczuk_ADD <= "11";
grygorczuk_WRITE_ENABLE <= '1';
wait for 100 ps;

--Addresses Revisited 

grygorczuk_INPUT <= '0';
grygorczuk_ADD <= "00";
grygorczuk_WRITE_ENABLE <= '0';
wait for 100 ps; 

grygorczuk_INPUT <= '0';
grygorczuk_ADD <= "01";
grygorczuk_WRITE_ENABLE <= '0';
wait for 100 ps; 

grygorczuk_INPUT <= '0';
grygorczuk_ADD <= "10";
grygorczuk_WRITE_ENABLE <= '0';
wait for 100 ps; 

grygorczuk_INPUT <= '0';
grygorczuk_ADD <= "11";
grygorczuk_WRITE_ENABLE <= '0';
wait for 100 ps; 

end process; 
end sram_four_x_one_testbench_logic;



