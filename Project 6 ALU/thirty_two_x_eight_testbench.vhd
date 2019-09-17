
--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains the testbench for the the SRAM 4x8 the inputs and outputs are too long to display as a comment reffer to the 
--simulation graph

library ieee; 
use ieee.std_logic_1164.all;

entity thirty_two_x_eight_testbench is 
end thirty_two_x_eight_testbench;

architecture thirty_two_x_eight_testbench_logic of thirty_two_x_eight_testbench is

component thirty_two_x_eight is 
	port(
		grygorczuk_s_cs, grygorczuk_s_we, grygorczuk_s_oe: in std_logic;
		grygorczuk_s_in: in std_logic_vector(7 DOWNTO 0);
		grygorczuk_s_addresses: in std_logic_vector(4 DOWNTO 0);
		grygorczuk_s_output: out std_logic_vector(7 DOWNTO 0)
		);
end component;

signal grygorczuk_CSCS, grygorczuk_WEWE, grygorczuk_OEOE: std_logic;
signal grygorczuk_ADD : std_logic_vector(4 DOWNTO 0);
signal grygorczuk_ININ, grygorczuk_OO: std_logic_vector(7 DOWNTO 0);

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: thirty_two_x_eight port map(
  grygorczuk_s_cs => grygorczuk_CSCS,
  grygorczuk_s_we => grygorczuk_WEWE,
  grygorczuk_s_oe => grygorczuk_OEOE,
  grygorczuk_s_in => grygorczuk_ININ,
  grygorczuk_s_addresses => grygorczuk_ADD,
  grygorczuk_s_output =>grygorczuk_OO
);

--Test Bench
Test_Bench : process
begin 

grygorczuk_ADD <= "00000";
grygorczuk_ININ <= "10010110";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '0';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00000";
grygorczuk_ININ <= "10010110";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00001";
grygorczuk_ININ <= "11000111";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '0';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00001";
grygorczuk_ININ <= "11000111";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00000";
grygorczuk_ININ <= "11000111";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '0';
wait for 100 ps;

grygorczuk_ADD <= "00000";
grygorczuk_ININ <= "11000111";
grygorczuk_CSCS <= '0';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '1';
wait for 100 ps;

end process; 
end thirty_two_x_eight_testbench_logic;






