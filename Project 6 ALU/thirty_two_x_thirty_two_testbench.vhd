
--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains the testbench for the the SRAM 4x8 the inputs and outputs are too long to display as a comment reffer to the 
--simulation graph

library ieee; 
use ieee.std_logic_1164.all;

entity thirty_two_x_thirty_two_testbench is 
end thirty_two_x_thirty_two_testbench;

architecture thirty_two_x_thirty_two_testbench_logic of thirty_two_x_thirty_two_testbench is

component thirty_two_x_thirty_two is 
	port(
		grygorczuk_cs, grygorczuk_regwr: in std_logic;
		grygorczuk_data_in: in std_logic_vector(31 DOWNTO 0);
		grygorczuk_address: in std_logic_vector(4 DOWNTO 0);
		grygorczuk_op, grygorczuk_funct: out std_logic_vector(5 DOWNTO 0);
		grygorczuk_rs, grygorczuk_rt, grygorczuk_rd, grygorczuk_shamt: out std_logic_vector(4 DOWNTO 0)
		);
end component;

signal grygorczuk_CSCS, grygorczuk_WEWE: std_logic;
signal grygorczuk_ADD : std_logic_vector(4 DOWNTO 0);
signal grygorczuk_ININ : std_logic_vector(31 DOWNTO 0);
signal grygorczuk_OPP, grygorczuk_functt: std_logic_vector(5 DOWNTO 0);
signal grygorczuk_rss, grygorczuk_rtt, grygorczuk_rdd, grygorczuk_shamtt: std_logic_vector(4 DOWNTO 0);


begin 
  ------Instantiate the Unit Under Test (UUT)
utt: thirty_two_x_thirty_two port map(
  grygorczuk_cs => grygorczuk_CSCS,
  grygorczuk_regwr => grygorczuk_WEWE,
  grygorczuk_data_in => grygorczuk_ININ,
  grygorczuk_address => grygorczuk_ADD,
  grygorczuk_op => grygorczuk_OPP,
  grygorczuk_funct => grygorczuk_functt,
  grygorczuk_rs => grygorczuk_rss,
  grygorczuk_rt => grygorczuk_rtt, 
  grygorczuk_rd => grygorczuk_rdd,
  grygorczuk_shamt => grygorczuk_shamtt
);

--Test Bench
Test_Bench : process
begin 

grygorczuk_ADD <= "00000";
grygorczuk_ININ <= "00000000000000000000000010010110"; 
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '0';
wait for 100 ps;

grygorczuk_ADD <= "00000";
grygorczuk_ININ <= "00000000000000000000000010010110";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00001";
grygorczuk_ININ <= "00000000000000000000000011000111";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '0';
wait for 100 ps;

grygorczuk_ADD <= "00001";
grygorczuk_ININ <= "00000000000000000000000011000111";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00000";
grygorczuk_ININ <= "00000000000000000000000011000111";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00000";
grygorczuk_ININ <= "00000000000000000000000011000111";
grygorczuk_CSCS <= '0';
grygorczuk_WEWE <= '1';
wait for 100 ps;

end process; 
end thirty_two_x_thirty_two_testbench_logic;







