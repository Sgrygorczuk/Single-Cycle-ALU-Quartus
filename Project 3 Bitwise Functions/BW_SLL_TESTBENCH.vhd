library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity BW_SLL_TESTBENCH is 
end BW_SLL_TESTBENCH;

architecture BW_SLL_TESTBENCH_LOGIC of BW_SLL_TESTBENCH is

constant n: integer := 6;
constant m : integer := (2**n)-1; 

component BW_SLL is
  generic(
    n: integer := 6
  );
	port(
		grygorczuk_sll: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_sll: out std_logic_vector(n-1 DOWNTO 0)
	);
end component; 

signal grygorczuk_X, grygorczuk_Z: std_logic_vector(n-1 DOWNTO 0) := (0 => '0', others => '0');
signal grygorczuk_add_one: std_logic_vector(n-1 DOWNTO 0):= (0 => '1', others => '0');

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: BW_SLL port map(
  grygorczuk_sll => grygorczuk_X,
  grygorczuk_output_sll => grygorczuk_Z
);

--Test Bench
Test_Bench : process
begin 

  for i in 0 to m loop
    wait for 100 ps; 
    grygorczuk_X <= grygorczuk_X + grygorczuk_add_one;
    end loop;
  report "End of Test";
end process; 

end BW_SLL_TESTBENCH_LOGIC;



