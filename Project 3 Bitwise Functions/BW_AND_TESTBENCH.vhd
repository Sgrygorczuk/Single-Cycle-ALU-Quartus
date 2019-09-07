library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity BW_AND_TESTBENCH is 
end BW_AND_TESTBENCH;

architecture BW_AND_TESTBENCH_LOGIC of BW_AND_TESTBENCH is

constant n: integer := 6;
constant m : integer := (2**n)-1; 

component BW_AND is
  generic(
    n: integer := 6
  );
	port(
		grygorczuk_and_1, grygorczuk_and_2: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_and: out std_logic_vector(n-1 DOWNTO 0)
	);
end component; 

signal grygorczuk_X, grygorczuk_Y, grygorczuk_Z: std_logic_vector(n-1 DOWNTO 0) := (0 => '0', others => '0');
signal grygorczuk_add_one: std_logic_vector(n-1 DOWNTO 0):= (0 => '1', others => '0');

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: BW_AND port map(
  grygorczuk_and_1 => grygorczuk_X,
  grygorczuk_and_2 => grygorczuk_Y,
  grygorczuk_output_and => grygorczuk_Z
);

--Test Bench
Test_Bench : process
begin 
  for i in 0 to m loop
    for j in 0 to m loop
    wait for 100 ps; 
    grygorczuk_Y <= grygorczuk_Y + grygorczuk_add_one;
    end loop;
  grygorczuk_X <= grygorczuk_X + grygorczuk_add_one;
  end loop;
  report "End of Test";
end process; 

end BW_AND_TESTBENCH_LOGIC;