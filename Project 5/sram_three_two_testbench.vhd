--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains the testbench for the the SRAM 4x8 the inputs and outputs are too long to display as a comment reffer to the 
--simulation graph, this test if we save all the information to only one register and check if the clear function works 


library ieee; 
use ieee.std_logic_1164.all;

entity sram_three_two_testbench is 
end sram_three_two_testbench;

architecture sram_three_two_testbench_logic of sram_three_two_testbench is

component sram_three_two is 
	port(
		grygorczuk_cs, grygorczuk_we, grygorczuk_oe: in std_logic;
		grygorczuk_in: in std_logic_vector(31 DOWNTO 0);
		grygorczuk_addresses: in std_logic_vector(1 DOWNTO 0);
		grygorczuk_output: out std_logic_vector(31 DOWNTO 0)
		);
end component;

signal grygorczuk_CSCS, grygorczuk_WEWE, grygorczuk_OEOE: std_logic;
signal grygorczuk_ADD : std_logic_vector(1 DOWNTO 0);
signal grygorczuk_ININ, grygorczuk_OO : std_logic_vector(31 DOWNTO 0);

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: sram_three_two port map(
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

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "11110000111100001111000011110000";
grygorczuk_CSCS <= '0';
grygorczuk_WEWE <= '0';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "01";
grygorczuk_ININ <= "11110000111100001111000011110000";
grygorczuk_CSCS <= '0';
grygorczuk_WEWE <= '0';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "10";
grygorczuk_ININ <= "11110000111100001111000011110000";
grygorczuk_CSCS <= '0';
grygorczuk_WEWE <= '0';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "11";
grygorczuk_ININ <= "11110000111100001111000011110000";
grygorczuk_CSCS <= '0';
grygorczuk_WEWE <= '0';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "11110000111100001111000011110000";
grygorczuk_CSCS <= '0';
grygorczuk_WEWE <= '0';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "11110000111100001111000011110000";
grygorczuk_CSCS <= '0';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "11110000111100001111000011110000";
grygorczuk_CSCS <= '0';
grygorczuk_WEWE <= '0';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "11110000111100001111000011110000";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '0';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "11110000111100001111000011110000";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "11110000111100001111000011110000";
grygorczuk_CSCS <= '0';
grygorczuk_WEWE <= '0';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "00000000111100001111000011110000";
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '1';
wait for 100 ps;

end process; 
end sram_three_two_testbench_logic;







