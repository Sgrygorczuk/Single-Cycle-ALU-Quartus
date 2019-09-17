library ieee; 
use ieee.std_logic_1164.all;

entity tri_state_buffer_three_two_testbench is 
end tri_state_buffer_three_two_testbench;

architecture tri_state_buffer_three_two_testbench_logic of tri_state_buffer_three_two_testbench is

component tri_state_buffer_three_two is
    Port (grygorczuk_enable: in std_logic;  
          grygorczuk_input_32: in std_logic_vector(31 DOWNTO 0);  
          grygorczuk_output_32: out std_logic_vector(31 DOWNTO 0)
           );
end component; 

signal grygorczuk_EN: std_logic;
signal grygorczuk_IN,grygorczuk_O:  std_logic_vector(31 DOWNTO 0);

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: tri_state_buffer_three_two port map(
  grygorczuk_input_32 => grygorczuk_IN,
  grygorczuk_enable => grygorczuk_EN,
  grygorczuk_output_32 => grygorczuk_O
);

--Test Bench
Test_Bench : process
begin 

wait for 100 ps; 
grygorczuk_IN <= "11110000010100110010100001101100";
grygorczuk_EN <= '0';

wait for 100 ps; 
grygorczuk_IN <= "11110000010100110010100001101100";
grygorczuk_EN <= '1';

wait for 100 ps; 
grygorczuk_IN <= "00000000000000000000000000000000";
grygorczuk_EN <= '0';

wait for 100 ps; 
grygorczuk_IN <= "00000000000000000000000000000000";
grygorczuk_EN <= '1';

end process; 
end tri_state_buffer_three_two_testbench_logic;




