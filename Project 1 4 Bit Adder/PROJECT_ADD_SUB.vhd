library ieee;
use ieee.std_logic_1164.all;

entity PROJECT_ADD_SUB is
	port(
		grygorczuk_y0, grygorczuk_y1, grygorczuk_y2, grygorczuk_y3 :in std_logic;
		grygorczuk_x0, grygorczuk_x1, grygorczuk_x2, grygorczuk_x3 :in std_logic;
		grygorczuk_carry_in, grygorczuk_sign :in std_logic;
		grygorczuk_flag_carry_out,grygorczuk_flag_zero, grygorczuk_flag_overflow, grygorczuk_negative : out std_logic;
		grygorczuk_output_0, grygorczuk_output_1, grygorczuk_output_2, grygorczuk_output_3: out std_logic;
		grygorczuk_a2, grygorczuk_b2, grygorczuk_c2, grygorczuk_d2, grygorczuk_e2, grygorczuk_f2, grygorczuk_g2 : out std_logic;
		grygorczuk_a1, grygorczuk_b1, grygorczuk_c1, grygorczuk_d1, grygorczuk_e1, grygorczuk_f1, grygorczuk_g1 : out std_logic
	);
end PROJECT_ADD_SUB;

architecture PROJECT_ADD_SUB_LOGIC of PROJECT_ADD_SUB is
signal Y_OUTPUT_0,Y_OUTPUT_1,Y_OUTPUT_2,Y_OUTPUT_3, CARRY_OUT_2, CARRY_OUT_3, OUTPUT_0,OUTPUT_1,OUTPUT_2,OUTPUT_3, NEG, ZERO, Z, RESET_S, A_OUTPUT_0,A_OUTPUT_1,A_OUTPUT_2,A_OUTPUT_3,M_OUTPUT_0, M_OUTPUT_1, M_OUTPUT_2,M_OUTPUT_3, C_OUTPUT_0, C_OUTPUT_1, C_OUTPUT_2, C_OUTPUT_3, CARRY_OUT_2_2, CARRY_OUT_3_2,  O_OUTPUT_0, O_OUTPUT_1, O_OUTPUT_2, O_OUTPUT_3: std_logic;

component TWOS_COMPLEMENT is
	port(
		grygorczuk_y0, grygorczuk_y1, grygorczuk_y2, grygorczuk_y3, grygorczuk_s_1 : in std_logic;
		grygorczuk_m0,grygorczuk_m1,grygorczuk_m2,grygorczuk_m3 : out std_logic
	);
end component;

component FOUR_BIT_ADDER is
	port(
		grygorczuk_carry_in_2 : in std_logic;
		grygorczuk_carry_x0, grygorczuk_carry_x1, grygorczuk_carry_x2, grygorczuk_carry_x3: in std_logic;
		grygorczuk_carry_y0, grygorczuk_carry_y1, grygorczuk_carry_y2, grygorczuk_carry_y3: in std_logic;
		grygorczuk_carry_out_2, grygorczuk_carry_out_3, grygorczuk_o0, grygorczuk_o1, grygorczuk_o2, grygorczuk_o3: out std_logic
	);
end component;

component COMPARATOR is
	port(
		grygorczuk_o0, grygorczuk_o1, grygorczuk_o2, grygorczuk_o3 : in std_logic;
		grygorczuk_z : out std_logic
	);
end component;

component SEVEN_SEGMENT_D2 is
	port(
		grygorczuk_sign, grygorczuk_input_z, grygorczuk_negative_flag, grygorczuk_zero_flag : in std_logic;
		grygorczuk_output_a, grygorczuk_output_b, grygorczuk_output_c, grygorczuk_output_d, grygorczuk_output_e, grygorczuk_output_f, grygorczuk_output_g : out std_logic
	);
end component;

component RESET_1 is
	port(
		grygorczuk_input_0, grygorczuk_input_1, grygorczuk_input_2, grygorczuk_input_3 : in std_logic;
		grygorczuk_output_0, grygorczuk_output_1, grygorczuk_output_2,  grygorczuk_output_3: out std_logic
	);
end component;

component MUX is
	port(
		grygorczuk_x, grygorczuk_y, grygorczuk_s : in std_logic;
		grygorczuk_m : out std_logic
	);
end component;

component SEVEN_SEGMENT_D1 is
	port(
		grygorczuk_input_3, grygorczuk_input_2, grygorczuk_input_1, grygorczuk_input_0 : in std_logic;
		grygorczuk_output_a, grygorczuk_output_b, grygorczuk_output_c, grygorczuk_output_d, grygorczuk_output_e, grygorczuk_output_f, grygorczuk_output_g : out std_logic
	);
end component;

begin

TWOS_COMPLEMENT_1: TWOS_COMPLEMENT port map(grygorczuk_y0, grygorczuk_y1, grygorczuk_y2, grygorczuk_y3, grygorczuk_carry_in, Y_OUTPUT_0,Y_OUTPUT_1,Y_OUTPUT_2,Y_OUTPUT_3);
FOUR_BIT_ADDER_1 : FOUR_BIT_ADDER port map(grygorczuk_carry_in, grygorczuk_x0, grygorczuk_x1, grygorczuk_x2, grygorczuk_x3,Y_OUTPUT_0,Y_OUTPUT_1,Y_OUTPUT_2,Y_OUTPUT_3, CARRY_OUT_2, CARRY_OUT_3, OUTPUT_0,OUTPUT_1,OUTPUT_2,OUTPUT_3);

grygorczuk_flag_carry_out <= CARRY_OUT_3;
grygorczuk_flag_zero <=  not (OUTPUT_0 or OUTPUT_1 or OUTPUT_2 or OUTPUT_3);
grygorczuk_flag_overflow <= CARRY_OUT_2 xor CARRY_OUT_3;
grygorczuk_negative <= OUTPUT_3; 

NEG <= OUTPUT_3; 
ZERO <=  not (OUTPUT_0 or OUTPUT_1 or OUTPUT_2 or OUTPUT_3);

grygorczuk_output_0 <= OUTPUT_0;
grygorczuk_output_1 <= OUTPUT_1;
grygorczuk_output_2 <= OUTPUT_2;
grygorczuk_output_3 <= OUTPUT_3;

COMPARATOR_1: COMPARATOR port map(OUTPUT_0, OUTPUT_1, OUTPUT_2, OUTPUT_3, Z);
SEVEN_SEGMENT_D2_1: SEVEN_SEGMENT_D2 port map(grygorczuk_sign, Z, NEG, ZERO, grygorczuk_a2, grygorczuk_b2, grygorczuk_c2, grygorczuk_d2, grygorczuk_e2, grygorczuk_f2, grygorczuk_g2);

RESET_S <=  not (grygorczuk_sign and NEG) and Z;
RESET_1_1: RESET_1 port map(OUTPUT_0,OUTPUT_1,OUTPUT_2,OUTPUT_3, A_OUTPUT_0,A_OUTPUT_1,A_OUTPUT_2,A_OUTPUT_3);

MUX_0: MUX port map(OUTPUT_0,A_OUTPUT_0, RESET_S, M_OUTPUT_0);
MUX_1: MUX port map(OUTPUT_1,A_OUTPUT_1,  RESET_S, M_OUTPUT_1);
MUX_2: MUX port map(OUTPUT_2,A_OUTPUT_2, RESET_S, M_OUTPUT_2);
MUX_3: MUX port map(OUTPUT_3,'0',RESET_S, M_OUTPUT_3);

TWOS_COMPLEMENT_2: TWOS_COMPLEMENT port map(M_OUTPUT_0, M_OUTPUT_1, M_OUTPUT_2, M_OUTPUT_3, grygorczuk_sign and NEG, C_OUTPUT_0 ,C_OUTPUT_1,C_OUTPUT_2,C_OUTPUT_3);
FOUR_BIT_ADDER_2 : FOUR_BIT_ADDER port map(grygorczuk_sign and NEG,C_OUTPUT_0 ,C_OUTPUT_1,C_OUTPUT_2,C_OUTPUT_3,'0','0','0','0',CARRY_OUT_2_2, CARRY_OUT_3_2, O_OUTPUT_0, O_OUTPUT_1, O_OUTPUT_2, O_OUTPUT_3);
SEVEN_SEGMENT_D1_1: SEVEN_SEGMENT_D1 port map(O_OUTPUT_0, O_OUTPUT_1, O_OUTPUT_2, O_OUTPUT_3,grygorczuk_a1, grygorczuk_b1, grygorczuk_c1, grygorczuk_d1, grygorczuk_e1, grygorczuk_f1, grygorczuk_g1);

end PROJECT_ADD_SUB_LOGIC;
