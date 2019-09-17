library ieee;
use ieee.std_logic_1164.all;

entity ALUU is
	port(
		grygorczuk_AX, grygorczuk_BX: in std_logic_vector(31 DOWNTO 0);
		grygorczuk_ALUctr: in std_logic_vector(3 DOWNTO 0);
		grygorczuk_zero_flag: out std_logic;
		grygorczuk_o: out std_logic_vector(31 DOWNTO 0)
	);
end ALUU;

architecture ALUU_logic of ALUU is
  
constant m: integer := 32;
  
signal ADD_O, SUB_O, AND_O, OR_O, NOT_O, XOR_O, SLL_O, SRL_O, ROL_O, ROR_O, LW_SW_O: std_logic_vector(31 DOWNTO 0);
signal grygorczuk_A_OF, grygorczuk_A_NF, grygorczuk_A_zf, grygorczuk_A_COF: std_logic;
signal grygorczuk_S_OF, grygorczuk_S_NF, grygorczuk_S_zf, grygorczuk_S_COF: std_logic;

component  N_BIT_ADDER is
  generic(
    n: integer := 32
      );
	port(
		grygorczuk_subtract: in std_logic;
		grygorczuk_carry_x, grygorczuk_carry_y: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_overflow_flag, grygorczuk_negative_flag, grygorczuk_zero_flag, grygorczuk_carry_out_flag: out std_logic;
		grygorczuk_o: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

component BW_AND is
  generic(
    n: integer := 32
  );
	port(
		grygorczuk_and_1, grygorczuk_and_2: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_and: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

component BW_OR is
  generic(
    n: integer := 32
  );
	port(
		grygorczuk_or_1, grygorczuk_or_2: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_or: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

component BW_XOR is
  generic(
    n: integer := 32
  );
	port(
		grygorczuk_xor_1, grygorczuk_xor_2: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_xor: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

component BW_NOT is
  generic(
    n: integer := 32
  );
	port(
		grygorczuk_not: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_not: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

component BW_SLL is
  generic(
    n: integer := 32
  );
	port(
		grygorczuk_sll: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_sll: out std_logic_vector(n-1 DOWNTO 0)
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

component BW_ROL is
  generic(
    n: integer := 32
  );
	port(
		grygorczuk_rol: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_rol: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

component BW_ROR is
  generic(
    n: integer := 32
  );
	port(
		grygorczuk_ror: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_ror: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

begin
  
N_BIT_ADDER_ADD: N_BIT_ADDER port map('0', grygorczuk_AX, grygorczuk_BX, grygorczuk_A_OF, grygorczuk_A_NF, grygorczuk_A_zf, grygorczuk_A_COF, ADD_O);
N_BIT_ADDER_SUB: N_BIT_ADDER port map('1', grygorczuk_AX, grygorczuk_BX, grygorczuk_S_OF, grygorczuk_S_NF, grygorczuk_S_zf, grygorczuk_S_COF, SUB_O);
BW_AND_part: BW_AND port map(grygorczuk_AX, grygorczuk_BX, AND_O);
BW_OR_part: BW_OR port map(grygorczuk_AX, grygorczuk_BX, OR_O);
BW_XOR_part: BW_XOR port map(grygorczuk_AX, grygorczuk_BX, XOR_O);
BW_NOT_part: BW_NOT port map(grygorczuk_BX, NOT_O);
BW_SLL_part: BW_SLL port map(grygorczuk_BX, SLL_O);
BW_SRL_part: BW_SRL port map(grygorczuk_BX, SRL_O);
BW_ROL_part: BW_ROL port map(grygorczuk_BX, ROL_O);
BW_ROR_part: BW_ROR port map(grygorczuk_BX, ROR_O);
LW_SW_O <= grygorczuk_BX; 


	with grygorczuk_ALUctr select
		grygorczuk_o <= ADD_O when "0000",
									  SUB_O when "0001",
									  AND_O when "0010",
									  OR_O when "0011",
									  XOR_O when "0100",
									  NOT_O when "0101",
									  SLL_O when "0110",
									  SRL_O when "0111",
									  ROL_O when "1000",
									  ROR_O when "1001",
									  LW_SW_O when "1010",
										"00000000000000000000000000000000" when others;
										
	with grygorczuk_ALUctr select
		grygorczuk_zero_flag <= grygorczuk_A_zf when "0000",
									  grygorczuk_S_zf when "0001",
										'0' when others;
    
end ALUU_logic;
