--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains a Tri State Buffer, it's purpose is to hold off any infromation while the enable it off
--This component has two inputs, Input and Enable and has one output, Output.  

library ieee;
use ieee.std_logic_1164.all;

--Whenever Enable is set to low the inforamtion will be held back and 'Z' will be given as the output
--Otherwsie Output = Input
entity tri_state_buffer is
    Port ( grygorczuk_input, grygorczuk_enable: in std_logic;  
           grygorczuk_output   : out std_logic
           );
end tri_state_buffer;

architecture tri_state_buffer_logic of tri_state_buffer is
  
begin
  grygorczuk_output <= grygorczuk_input when (grygorczuk_enable = '1') else 'Z';
  
end tri_state_buffer_logic;