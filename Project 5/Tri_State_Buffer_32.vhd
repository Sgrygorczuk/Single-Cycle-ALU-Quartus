--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains a Tri State Buffer, it's purpose is to hold off any infromation while the enable it off
--This component has two inputs, Input and Enable and has one output, Output.  

library ieee;
use ieee.std_logic_1164.all;

--Whenever Enable is set to low the inforamtion will be held back and 'Z' will be given as the output
--Otherwsie Output = Input
entity tri_state_buffer_three_two is
    Port (grygorczuk_enable: in std_logic;  
          grygorczuk_input_32: in std_logic_vector(31 DOWNTO 0);  
          grygorczuk_output_32: out std_logic_vector(31 DOWNTO 0)
           );
end tri_state_buffer_three_two;

architecture tri_state_buffer_three_two_logic of tri_state_buffer_three_two is
  
begin
  grygorczuk_output_32 <= grygorczuk_input_32 when (grygorczuk_enable = '1') else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
  
end tri_state_buffer_three_two_logic;
