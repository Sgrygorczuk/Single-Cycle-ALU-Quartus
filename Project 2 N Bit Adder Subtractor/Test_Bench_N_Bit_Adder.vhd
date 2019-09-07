library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity TEST_BENCH_N_BIT_ADDER is 
end TEST_BENCH_N_BIT_ADDER;

architecture TEST_BENCH_N_BIT_ADDER_LOGIC of TEST_BENCH_N_BIT_ADDER is

constant n: integer := 4;
constant m : integer := (2**n)-1; 

component N_BIT_ADDER is
  generic
  (
    n: integer := 4
  );
	port(
		grygorczuk_carry_in_2, grygorczuk_signed : in std_logic;
		grygorczuk_carry_x, grygorczuk_carry_y: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_overflow_flag, grygorczuk_negative_flag, grygorczuk_zero_flag, grygorczuk_carry_out_flag: out std_logic;
		grygorczuk_o: out std_logic_vector(n-1 DOWNTO 0)
	);
end component; 

signal grygorczuk_A, grygorczuk_B, grygorczuk_S : std_logic_vector(n-1 DOWNTO 0):= (0 => '0', others => '0');
signal grygorczuk_add_one : std_logic_vector(n-1 DOWNTO 0):= (0 => '1', others => '0');
signal grygorczuk_CI, grygorczuk_CO, grygorczuk_Sign : std_logic;

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: N_BIT_ADDER port map(
  grygorczuk_carry_in_2 => grygorczuk_CI,
  grygorczuk_signed => grygorczuk_Sign,
  grygorczuk_carry_x => grygorczuk_A,
  grygorczuk_carry_y => grygorczuk_B,
  grygorczuk_o => grygorczuk_S,
  grygorczuk_carry_out_flag => grygorczuk_CO
);

--Test Bench
Test_Bench : process
begin 
  grygorczuk_CI <= '0'; 
  grygorczuk_Sign <= '0';
  for i in 0 to m loop
    for j in 0 to m loop
    wait for 100 ps; 
    assert (grygorczuk_S = grygorczuk_A+grygorczuk_B) report "The sum from four bit adder is S =" & 
    integer'image(to_integer(unsigned((grygorczuk_S)))) & " while the expected A+B = " & 
    integer'image(to_integer(unsigned((grygorczuk_A+grygorczuk_B)))) severity ERROR;   
    grygorczuk_B <= grygorczuk_B + grygorczuk_add_one;
    end loop;
  grygorczuk_A <= grygorczuk_A + grygorczuk_add_one;
  end loop;
  report "End of Test";
  
end process; 



end Test_Bench_N_Bit_Adder_LOGIC;