library ieee;
use ieee.std_logic_1164.all;


entity BW_CIRCUIT is
	port(
	   grygorczuk_start: in std_logic;
		grygorczuk_op0, grygorczuk_op1, grygorczuk_op2: in std_logic;
		grygorczuk_x0, grygorczuk_x1, grygorczuk_x2, grygorczuk_x3, grygorczuk_x4, grygorczuk_x5: in std_logic;
		grygorczuk_y0, grygorczuk_y1, grygorczuk_y2, grygorczuk_y3, grygorczuk_y4, grygorczuk_y5: in std_logic;
		grygorczuk_o0, grygorczuk_o1, grygorczuk_o2, grygorczuk_o3, grygorczuk_o4, grygorczuk_o5: out std_logic
	);
end BW_CIRCUIT;

architecture BW_CIRCUIT_LOGIC of BW_CIRCUIT is
 
constant n: integer := 6;  
signal grygorczuk_input_1, grygorczuk_input_2, grygorczuk_output: std_logic_vector(n-1 DOWNTO 0) := (0 => '0', others => '0');
signal grygorczuk_and_o, grygorczuk_or_o, grygorczuk_xor_o, grygorczuk_not_o, grygorczuk_sll_o, grygorczuk_srl_o, grygorczuk_rol_o, grygorczuk_ror_o: std_logic_vector(n-1 DOWNTO 0) := (0 => '0', others => '0');
signal grygorczuk_op_input : std_logic_vector(2 DOWNTO 0) := (0 => '0', others => '0');
  
component BW_AND is
  generic(
    n: integer := 6
    );
	port(
		grygorczuk_and_1, grygorczuk_and_2: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_and: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

component BW_OR is
  generic(
    n: integer := 6
  );
	port(
		grygorczuk_or_1, grygorczuk_or_2: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_or: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

component BW_XOR is
  generic(
    n: integer := 6
  );
	port(
		grygorczuk_xor_1, grygorczuk_xor_2: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_xor: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

component BW_NOT is
  generic(
    n: integer := 6
  );
	port(
		grygorczuk_not: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_not: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

component BW_SLL is
  generic(
    n: integer := 6
  );
	port(
		grygorczuk_sll: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_sll: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

component BW_SRL is
  generic(
    n: integer := 6
  );
	port(
		grygorczuk_srl: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_srl: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

component BW_ROL is
  generic(
    n: integer := 6
  );
	port(
		grygorczuk_rol: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_rol: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

component BW_ROR is
  generic(
    n: integer := 6
  );
	port(
		grygorczuk_ror: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_output_ror: out std_logic_vector(n-1 DOWNTO 0)
	);
end component;

begin
  grygorczuk_input_1(0) <= grygorczuk_x0;
  grygorczuk_input_1(1) <= grygorczuk_x1;
  grygorczuk_input_1(2) <= grygorczuk_x2;
  grygorczuk_input_1(3) <= grygorczuk_x3;
  grygorczuk_input_1(4) <= grygorczuk_x4;
  grygorczuk_input_1(5) <= grygorczuk_x5;
  
  grygorczuk_input_2(0) <= grygorczuk_y0;
  grygorczuk_input_2(1) <= grygorczuk_y1;
  grygorczuk_input_2(2) <= grygorczuk_y2;
  grygorczuk_input_2(3) <= grygorczuk_y3;
  grygorczuk_input_2(4) <= grygorczuk_y4;
  grygorczuk_input_2(5) <= grygorczuk_y5;
  
  grygorczuk_op_input(0) <= grygorczuk_op0;
  grygorczuk_op_input(1) <= grygorczuk_op1;
  grygorczuk_op_input(2) <= grygorczuk_op2;
  
  BW_AND_PART: BW_AND port map(grygorczuk_input_1, grygorczuk_input_2, grygorczuk_and_o);
  BW_OR_PART: BW_OR port map(grygorczuk_input_1, grygorczuk_input_2, grygorczuk_or_o); 
  BW_XOR_PART: BW_XOR port map(grygorczuk_input_1, grygorczuk_input_2, grygorczuk_xor_o); 
  BW_NOT_PART: BW_NOT port map(grygorczuk_input_1, grygorczuk_not_o);
  BW_SLL_PART: BW_SLL port map(grygorczuk_input_1, grygorczuk_sll_o);
  BW_SRL_PART: BW_SRL port map(grygorczuk_input_1, grygorczuk_srl_o);
  BW_ROL_PART: BW_ROL port map(grygorczuk_input_1, grygorczuk_rol_o);
  BW_ROR_PART: BW_ROR port map(grygorczuk_input_1, grygorczuk_ror_o);
  
  process (grygorczuk_start, grygorczuk_op_input)
    begin
		if (not grygorczuk_start = '1') then 
      case grygorczuk_op_input is
			when "000" =>
				grygorczuk_output <= grygorczuk_and_o;
			when "001" =>
				grygorczuk_output <= grygorczuk_or_o;
			when "010" =>
				grygorczuk_output <= grygorczuk_xor_o;
			when "011" =>
				grygorczuk_output <= grygorczuk_not_o;
			when "100" =>
				grygorczuk_output <= grygorczuk_sll_o;
			when "101" =>
				grygorczuk_output <= grygorczuk_srl_o;
			when "110" =>
				grygorczuk_output <= grygorczuk_rol_o;
			when "111" =>
				grygorczuk_output <= grygorczuk_ror_o;
			when others =>
				NULL;
		end case;
	  end if; 
	end process;
   
  grygorczuk_o0 <= grygorczuk_output(0);
  grygorczuk_o1 <= grygorczuk_output(1);
  grygorczuk_o2 <= grygorczuk_output(2);
  grygorczuk_o3 <= grygorczuk_output(3);
  grygorczuk_o4 <= grygorczuk_output(4);
  grygorczuk_o5 <= grygorczuk_output(5);
  
  
end BW_CIRCUIT_LOGIC;