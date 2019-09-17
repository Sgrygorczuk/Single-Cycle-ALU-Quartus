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

entity dual_x_thirty_two_testbench is 
end dual_x_thirty_two_testbench;

architecture dual_x_thirty_two_testbench_logic of dual_x_thirty_two_testbench is

component dual_x_thirty_two is 
	port(
		grygorczuk_cs, grygorczuk_regwr: in std_logic;
		grygorczuk_data_in: in std_logic_vector(31 DOWNTO 0);
		grygorczuk_d, grygorczuk_t, grygorczuk_s: in std_logic_vector(4 DOWNTO 0);
		grygorczuk_output_t, grygorczuk_output_s: out std_logic_vector(31 DOWNTO 0)
		);
end component;

signal grygorczuk_CSCS, grygorczuk_OEOE, grygorczuk_WRITE_ENABLE : std_logic;
signal grygorczuk_D, grygorczuk_T, grygorczuk_S: std_logic_vector(4 DOWNTO 0);
signal grygorczuk_INPUT, grygorczuk_O_T, grygorczuk_O_S: std_logic_vector(31 DOWNTO 0);

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: dual_x_thirty_two port map(
  grygorczuk_cs => grygorczuk_CSCS,
  grygorczuk_data_in => grygorczuk_INPUT,
  grygorczuk_d => grygorczuk_D,
  grygorczuk_t => grygorczuk_T,
  grygorczuk_s => grygorczuk_S,
  grygorczuk_regwr => grygorczuk_WRITE_ENABLE,
  grygorczuk_output_t => grygorczuk_O_T,
  grygorczuk_output_s => grygorczuk_O_S
);

--Test Bench
Test_Bench : process
begin 

-- Adress 0
grygorczuk_INPUT <= "00001111000011110000111100001111";
grygorczuk_CSCS <= '1';
grygorczuk_D <= "00000";
grygorczuk_T <= "00000";
grygorczuk_S <= "00000";
grygorczuk_WRITE_ENABLE <= '0';
wait for 100 ps; 

grygorczuk_INPUT <= "11111111111111111111111111111111";
grygorczuk_CSCS <= '1';
grygorczuk_D <= "00000";
grygorczuk_T <= "00000";
grygorczuk_S <= "00000";
grygorczuk_WRITE_ENABLE <= '1';
wait for 100 ps; 

grygorczuk_INPUT <= "00001111000011110000111100001111";
grygorczuk_CSCS <= '1';
grygorczuk_D <= "00000";
grygorczuk_T <= "00000";
grygorczuk_S <= "00000";
grygorczuk_WRITE_ENABLE <= '0';
wait for 100 ps; 

grygorczuk_INPUT <= "00111111001111110011111100111111";
grygorczuk_CSCS <= '1';
grygorczuk_D <= "00000";
grygorczuk_T <= "00000";
grygorczuk_S <= "00000";
grygorczuk_WRITE_ENABLE <= '1';
wait for 100 ps; 

--Adress 1

grygorczuk_INPUT <= "01101111011011110110111101101111";
grygorczuk_CSCS <= '1';
grygorczuk_D <= "00001";
grygorczuk_T <= "00000";
grygorczuk_S <= "00001";
grygorczuk_WRITE_ENABLE <= '0';
wait for 100 ps; 

grygorczuk_INPUT <= "11001111110011111100111111001111";
grygorczuk_CSCS <= '1';
grygorczuk_D <= "00001";
grygorczuk_T <= "00001";
grygorczuk_S <= "00000";
grygorczuk_WRITE_ENABLE <= '1';
wait for 100 ps; 

grygorczuk_INPUT <= "10011111100111111001111110011111";
grygorczuk_CSCS <= '1';
grygorczuk_D <= "00001";
grygorczuk_T <= "00001";
grygorczuk_S <= "00001";
grygorczuk_WRITE_ENABLE <= '0';
wait for 100 ps; 

grygorczuk_INPUT <= "00111111001111110011111100111111";
grygorczuk_CSCS <= '1';
grygorczuk_D <= "00001";
grygorczuk_T <= "00001";
grygorczuk_S <= "00001";
grygorczuk_WRITE_ENABLE <= '1';
wait for 100 ps;

end process; 
end dual_x_thirty_two_testbench_logic;














