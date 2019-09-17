--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains the testbench for the Address Decoder, It goes through all the possible stages 
--Of the Truth Table 

-- IN O
-- 00 0001
-- 01 0010
-- 10 0100
-- 11 1000

library ieee; 
use ieee.std_logic_1164.all;

entity address_decoder_testbench is 
end address_decoder_testbench;

architecture address_decoder_testbench_logic of address_decoder_testbench is

component address_decoder is
	port(
		grygorczuk_word: in std_logic_vector(4 downto 0);
		grygorczuk_decoder_output : out std_logic_vector(31 downto 0)
		);
	end component;
	
signal grygorczuk_ADD : std_logic_vector(4 DOWNTO 0);
signal grygorczuk_output : std_logic_vector(31 downto 0);

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: address_decoder port map(
  grygorczuk_word => grygorczuk_ADD,
  grygorczuk_decoder_output => grygorczuk_output
);

--Test Bench
Test_Bench : process
begin 

grygorczuk_ADD <= "00000";
wait for 100 ps; 

grygorczuk_ADD <= "00001";
wait for 100 ps; 

grygorczuk_ADD <= "00010";
wait for 100 ps; 

grygorczuk_ADD <= "00011";
wait for 100 ps;  

grygorczuk_ADD <= "00100";
wait for 100 ps; 

grygorczuk_ADD <= "00101";
wait for 100 ps; 

grygorczuk_ADD <= "00110";
wait for 100 ps; 

grygorczuk_ADD <= "00111";
wait for 100 ps; 

grygorczuk_ADD <= "01000";
wait for 100 ps; 

grygorczuk_ADD <= "01001";
wait for 100 ps; 

grygorczuk_ADD <= "01010";
wait for 100 ps; 

grygorczuk_ADD <= "01011";
wait for 100 ps;

grygorczuk_ADD <= "01100";
wait for 100 ps; 

grygorczuk_ADD <= "01101";
wait for 100 ps; 

grygorczuk_ADD <= "01110";
wait for 100 ps; 

grygorczuk_ADD <= "01111";
wait for 100 ps; 

grygorczuk_ADD <= "10000";
wait for 100 ps; 

grygorczuk_ADD <= "10001";
wait for 100 ps; 

grygorczuk_ADD <= "10010";
wait for 100 ps; 

grygorczuk_ADD <= "10011";
wait for 100 ps;  

grygorczuk_ADD <= "10100";
wait for 100 ps; 

grygorczuk_ADD <= "10101";
wait for 100 ps; 

grygorczuk_ADD <= "10110";
wait for 100 ps; 

grygorczuk_ADD <= "10111";
wait for 100 ps; 

grygorczuk_ADD <= "11000";
wait for 100 ps; 

grygorczuk_ADD <= "11001";
wait for 100 ps; 

grygorczuk_ADD <= "11010";
wait for 100 ps; 

grygorczuk_ADD <= "11011";
wait for 100 ps;

grygorczuk_ADD <= "11100";
wait for 100 ps; 

grygorczuk_ADD <= "11101";
wait for 100 ps; 

grygorczuk_ADD <= "11110";
wait for 100 ps; 

grygorczuk_ADD <= "11111";
wait for 100 ps; 
end process; 

end address_decoder_testbench_logic;




