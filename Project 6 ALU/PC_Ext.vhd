library ieee;
use ieee.std_logic_1164.all;

entity pc_extender is
	port(
		grygorczuk_imm : in std_logic_vector(15 DOWNTO 0);
		grygorczuk_output : out std_logic_vector(31 DOWNTO 0)
	);
end pc_extender;

architecture pc_extender_logic of pc_extender is

begin
  
  grygorczuk_output(15 DOWNTO 0) <=  grygorczuk_imm; 
	grygorczuk_output(31 DOWNTO 16) <= "0000000000000000";
  
end pc_extender_logic;

