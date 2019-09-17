--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains the testbench for the the SRAM 4x8 the inputs and outputs are too long to display as a comment reffer to the 
--simulation graph, this test if we save all the information to only one register and check if the clear function works 


library ieee; 
use ieee.std_logic_1164.all;

entity sram_four_x_thirty_two_testbench is 
end sram_four_x_thirty_two_testbench;

architecture sram_four_x_thirty_two_testbench_logic of sram_four_x_thirty_two_testbench is

component sram_four_x_thirty_two is 
	port(
		grygorczuk_cs, grygorczuk_we, grygorczuk_oe: in std_logic;
		grygorczuk_key_0, grygorczuk_key_1, grygorczuk_key_2, grygorczuk_key_3, grygorczuk_clear: in std_logic;
		grygorczuk_in: in std_logic_vector(7 DOWNTO 0);
		grygorczuk_addresses: in std_logic_vector(1 DOWNTO 0);
		grygorczuk_output: out std_logic_vector(31 DOWNTO 0)
		);
end component;

signal grygorczuk_CSCS, grygorczuk_WEWE, grygorczuk_OEOE: std_logic;
signal grygorczuk_K0, grygorczuk_K1, grygorczuk_K2, grygorczuk_K3, grygorczuk_CL: std_logic;
signal grygorczuk_ADD : std_logic_vector(1 DOWNTO 0);
signal grygorczuk_ININ : std_logic_vector(7 DOWNTO 0);
signal grygorczuk_OO: std_logic_vector(31 DOWNTO 0);

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: sram_four_x_thirty_two port map(
  grygorczuk_cs => grygorczuk_CSCS,
  grygorczuk_we => grygorczuk_WEWE,
  grygorczuk_oe => grygorczuk_OEOE,
  grygorczuk_in => grygorczuk_ININ,
  grygorczuk_key_0 => grygorczuk_K0,
  grygorczuk_key_1 => grygorczuk_K1,
  grygorczuk_key_2 => grygorczuk_K2,
  grygorczuk_key_3 => grygorczuk_K3,
  grygorczuk_clear => grygorczuk_CL,
  grygorczuk_addresses => grygorczuk_ADD,
  grygorczuk_output =>grygorczuk_OO
);

--Test Bench
Test_Bench : process
begin 

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "11110000";
grygorczuk_K0 <= '1';
grygorczuk_K1 <= '1';
grygorczuk_K2 <= '1';
grygorczuk_K3 <= '1';
grygorczuk_CL  <= '0';
grygorczuk_CSCS <= '0';
grygorczuk_WEWE <= '0';
grygorczuk_OEOE <= '0';
wait for 100 ps;

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "11110000";
grygorczuk_K0 <= '1';
grygorczuk_K1 <= '1';
grygorczuk_K2 <= '1';
grygorczuk_K3 <= '1';
grygorczuk_CL  <= '0';
grygorczuk_CSCS <= '0';
grygorczuk_WEWE <= '0';
grygorczuk_OEOE <= '1';
wait for 100 ps;


grygorczuk_ADD <= "00";
grygorczuk_ININ <= "11110000";
grygorczuk_K0 <= '1';
grygorczuk_K1 <= '1';
grygorczuk_K2 <= '1';
grygorczuk_K3 <= '1';
grygorczuk_CL  <= '0';
grygorczuk_CSCS <= '0';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '0';
wait for 100 ps;

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "11110000";
grygorczuk_K0 <= '1';
grygorczuk_K1 <= '1';
grygorczuk_K2 <= '1';
grygorczuk_K3 <= '1';
grygorczuk_CL  <= '0';
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "00000111";
grygorczuk_K0 <= '1';
grygorczuk_K1 <= '1';
grygorczuk_K2 <= '1';
grygorczuk_K3 <= '0';
grygorczuk_CL  <= '0';
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "11010101";
grygorczuk_K0 <= '1';
grygorczuk_K1 <= '1';
grygorczuk_K2 <= '0';
grygorczuk_K3 <= '1';
grygorczuk_CL  <= '0';
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "00000000";
grygorczuk_K0 <= '1';
grygorczuk_K1 <= '0';
grygorczuk_K2 <= '1';
grygorczuk_K3 <= '1';
grygorczuk_CL  <= '0';
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "11111111";
grygorczuk_K0 <= '0';
grygorczuk_K1 <= '1';
grygorczuk_K2 <= '1';
grygorczuk_K3 <= '1';
grygorczuk_CL  <= '0';
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "11001100";
grygorczuk_K0 <= '1';
grygorczuk_K1 <= '1';
grygorczuk_K2 <= '1';
grygorczuk_K3 <= '1';
grygorczuk_CL  <= '0';
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '1';
wait for 100 ps;

grygorczuk_ADD <= "00";
grygorczuk_ININ <= "00110011";
grygorczuk_K0 <= '0';
grygorczuk_K1 <= '1';
grygorczuk_K2 <= '1';
grygorczuk_K3 <= '1';
grygorczuk_CL  <= '1';
grygorczuk_CSCS <= '1';
grygorczuk_WEWE <= '1';
grygorczuk_OEOE <= '1';
wait for 100 ps;



end process; 
end sram_four_x_thirty_two_testbench_logic;






