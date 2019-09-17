library ieee;
use ieee.std_logic_1164.all;

entity Multiplier is
	port(
	  grygorczuk_input_a, grygorczuk_input_b: in  std_logic_vector(31 DOWNTO 0);
	  grygorczuk_m_output: out std_logic_vector(63 DOWNTO 0)
	);
end Multiplier;

architecture Multiplier_Logic of Multiplier is

--Outputs of ANDS between 32 bit a input and ith b input 
type grygorczuk_o is array (0 to 31) of std_logic_vector(31 downto 0);
signal grygorczuk_s_o : grygorczuk_o;

type grygorczuk_s is array (0 to 31) of std_logic_vector(31 downto 0);
signal grygorczuk_s_s : grygorczuk_s;

type grygorczuk_u is array (0 to 31) of std_logic_vector(31 downto 0);
signal grygorczuk_s_u : grygorczuk_u;

signal grygorczuk_of, grygorczuk_nf, grygorczuk_zf, grygorczuk_cf: std_logic_vector(31 downto 0);

component N_BIT_ADDER is
  generic(
    n: integer := 32
      );
	port(
		grygorczuk_carry_in_2, grygorczuk_signed : in std_logic;
		grygorczuk_carry_x, grygorczuk_carry_y: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_overflow_flag, grygorczuk_negative_flag, grygorczuk_zero_flag, grygorczuk_carry_out_flag: out std_logic;
		grygorczuk_o: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

component BW_SRL is
  generic(
    n: integer := 32
  );
	port(
		grygorczuk_srl: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_srl: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

begin
  
--Output 0
grygorczuk_m_output(0) <= grygorczuk_s_o(0)(0); 
grygorczuk_s_u(0)(31) <=  '0';
grygorczuk_s_u(0)(30 DOWNTO 0) <= grygorczuk_s_o(0)(30 DOWNTO 0);

LOOP_ONE: for i in 0 to 31 generate
  LOOP_TWO: for j in 0 to 31 generate
      grygorczuk_s_o(i)(j) <= grygorczuk_input_a(j) and grygorczuk_input_b(i);
  end generate;
end generate;

LOOP_THREE: for i in 0 to 30 generate
  N_BIT_ADDER_part: N_BIT_ADDER port map('0', '0', grygorczuk_s_u(i), grygorczuk_s_o(i+1), grygorczuk_of(i),
    grygorczuk_nf(i), grygorczuk_zf(i), grygorczuk_cf(i), grygorczuk_s_s(i)); 
  grygorczuk_s_u(i+1)(31) <= grygorczuk_cf(i);
  grygorczuk_s_u(i+1)(30 DOWNTO 0) <= grygorczuk_s_s(i)(30 DOWNTO 0);
  grygorczuk_m_output(i+1) <= grygorczuk_s_s(i)(0);
end generate;

end Multiplier_Logic;

