--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains the testbench for the the SRAM 4x1
--Since our goal is only to ADD/SUB which takes up one address and MUL which takes up two addresses we will only test
--two addresses
--Here we test to see if each of the Flip Flops saves and can read the information after we wrote in it(U = UNKNOW)
--We show that it can read, it read the unknow before we saved anything, it can save, and it can read the saved data 
--later after performing other actions on a diffrent address

--CS WE OE ADD IN    O
--1  0  1  00  0110  UUUU
--1  1  1  00  0110  0110
--1  0  1  01  0111  UUUU
--1  1  1  01  0111  0111
--1  1  0  00  0110  ZZZZ
--0  1  1  00  0110  ZZZZ
--0  0  0  00  0110  ZZZZ
--1  0  1  01  0110  0111

library ieee; 
use ieee.std_logic_1164.all;

entity thirty_two_x_four_testbench is 
end thirty_two_x_four_testbench;

architecture thirty_two_x_four_testbench_logic of thirty_two_x_four_testbench is

component thirty_two_x_four is 
	port(
		grygorczuk_cs, grygorczuk_we, grygorczuk_oe: in std_logic;
		grygorczuk_in: in std_logic_vector(3 DOWNTO 0);
		grygorczuk_addresses: in std_logic_vector(4 DOWNTO 0);
		grygorczuk_output: out std_logic_vector(3 DOWNTO 0)
		);
end component;

signal grygorczuk_CSCS, grygorczuk_WEWE, grygorczuk_OEOE: std_logic;
signal grygorczuk_ADD : std_logic_vector(4 DOWNTO 0);
signal grygorczuk_ININ, grygorczuk_OO: std_logic_vector(3 DOWNTO 0);

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: thirty_two_x_four port map(
  grygorczuk_cs => grygorczuk_CSCS,
  grygorczuk_we => grygorczuk_WEWE,
  grygorczuk_oe => grygorczuk_OEOE,
  grygorczuk_in => grygorczuk_ININ,
  grygorczuk_addresses => grygorczuk_ADD,
  grygorczuk_output =>grygorczuk_OO
);

--Test Bench
Test_Bench : process
begin 

grygorczuk_ADD <= "00000";
grygorczuk_ININ <= "0110";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '0';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00000";
grygorczuk_ININ <= "0110";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00001";
grygorczuk_ININ <= "0111";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '0';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00001";
grygorczuk_ININ <= "0111";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00000";
grygorczuk_ININ <= "0110";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '0';
wait for 100 ps;

grygorczuk_ADD <= "00000";
grygorczuk_ININ <= "0110";
grygorczuk_CSCS <= '0';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00000";
grygorczuk_ININ <= "0110";
grygorczuk_CSCS <= '0';
grygorczuk_WEWE <= '0';
grygorczuk_OEOE <= '0';
wait for 100 ps;

grygorczuk_ADD <= "00001";
grygorczuk_ININ <= "0110";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '0';
grygorczuk_OEOE <= '1';
wait for 100 ps;


end process; 
end thirty_two_x_four_testbench_logic;






