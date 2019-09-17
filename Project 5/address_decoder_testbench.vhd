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
		grygorczuk_word: in std_logic_vector(1 downto 0);
		grygorczuk_decoder_output : out std_logic_vector(3 downto 0)
		);
	end component;
	
signal grygorczuk_ADD : std_logic_vector(1 DOWNTO 0);
signal grygorczuk_output : std_logic_vector(3 downto 0);

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: address_decoder port map(
  grygorczuk_word => grygorczuk_ADD,
  grygorczuk_decoder_output => grygorczuk_output
);

--Test Bench
Test_Bench : process
begin 

grygorczuk_ADD <= "00";
wait for 100 ps; 

grygorczuk_ADD <= "01";
wait for 100 ps; 

grygorczuk_ADD <= "10";
wait for 100 ps; 

grygorczuk_ADD <= "11";
wait for 100 ps; 
end process; 

end address_decoder_testbench_logic;




