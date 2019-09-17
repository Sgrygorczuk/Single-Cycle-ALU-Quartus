library ieee;
use ieee.std_logic_1164.all;

entity project_five_part_one is
	port(
	  grygorczuk_carry_in, grygorczuk_sign, grygorczuk_output_enable, grygorczuk_write_enable: in std_logic;
		grygorczuk_k0, grygorczuk_k1, grygorczuk_k2, grygorczuk_k3, grygorczuk_clear: in std_logic;
		grygorczuk_in: in std_logic_vector(7 DOWNTO 0);
		grygorczuk_of, grygorczuk_nf, grygorczuk_zf, grygorczuk_cof: out std_logic;
		grygorczuk_o0: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_o1: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_o2: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_o3: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_o4: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_o5: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_o6: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_o7: out std_logic_vector(6 DOWNTO 0)
	);
end project_five_part_one;

architecture project_five_part_one_logic of project_five_part_one is

component sram_four_x_thirty_two is 
	port(
		grygorczuk_cs, grygorczuk_we, grygorczuk_oe: in std_logic;
		grygorczuk_key_0, grygorczuk_key_1, grygorczuk_key_2, grygorczuk_key_3: in std_logic;
		grygorczuk_in: in std_logic_vector(7 DOWNTO 0);
		grygorczuk_addresses: in std_logic_vector(1 DOWNTO 0);
		grygorczuk_output: out std_logic_vector(31 DOWNTO 0)
		);
end component;

component sram_four_x_eight is 
	port(
		grygorczuk_s_cs, grygorczuk_s_we, grygorczuk_s_oe: in std_logic;
		grygorczuk_s_in: in std_logic_vector(7 DOWNTO 0);
		grygorczuk_s_addresses: in std_logic_vector(1 DOWNTO 0);
		grygorczuk_s_output: out std_logic_vector(7 DOWNTO 0)
		);
end component;

component eight_hexs is 
	port(
		grygorczuk_in: in std_logic_vector(31 DOWNTO 0);
		grygorczuk_out0: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out1: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out2: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out3: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out4: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out5: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out6: out std_logic_vector(6 DOWNTO 0);
		grygorczuk_out7: out std_logic_vector(6 DOWNTO 0)
		);
end component;

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

component tri_state_buffer_three_two is
    Port (grygorczuk_enable: in std_logic;  
          grygorczuk_input_32: in std_logic_vector(31 DOWNTO 0);  
          grygorczuk_output_32: out std_logic_vector(31 DOWNTO 0)
           );
end component;

signal grygorczuk_input, grygorczuk_unite_0, grygorczuk_unite_1, grygorczuk_unite_2, grygorczuk_unite_3: std_logic_vector(7 DOWNTO 0);
signal grygorczuk_user_sram_output, grygorczuk_indep_sram_output, grygorczuk_user_buffer : std_logic_vector(31 DOWNTO 0);
signal grygorczuk_indep_buffer, grygorczuk_modif_output, grygorczuk_buffered_modify : std_logic_vector(31 DOWNTO 0);

begin

--Generates the output, if Clear is 0 it makes passses through the input, if CLear is 1 the input is then set to 0 clearing the memeory
with grygorczuk_clear select
		grygorczuk_input <= grygorczuk_in when '0',
											  "00000000" when others;
											 
with grygorczuk_clear select
		grygorczuk_buffered_modify <= grygorczuk_modif_output when '0',
											  "00000000000000000000000000000000" when others;

--User SRAM
sram_four_x_thirty_two_0: sram_four_x_thirty_two port map('1', grygorczuk_write_enable , '1',
 grygorczuk_k0, grygorczuk_k1, grygorczuk_k2, grygorczuk_k3, grygorczuk_input, "00", grygorczuk_user_sram_output);

--Independent SRAM
sram_four_x_eight_one: sram_four_x_eight port map('1', grygorczuk_write_enable, '1', grygorczuk_buffered_modify(7 DOWNTO 0),
                                                     "00", grygorczuk_unite_0);
sram_four_x_eight_two: sram_four_x_eight port map('1', grygorczuk_write_enable, '1', grygorczuk_buffered_modify(15 DOWNTO 8),
                                                     "00", grygorczuk_unite_1);
sram_four_x_eight_three: sram_four_x_eight port map('1', grygorczuk_write_enable, '1', grygorczuk_buffered_modify(23 DOWNTO 16),
                                                     "00", grygorczuk_unite_2);
sram_four_x_eight_four: sram_four_x_eight port map('1', grygorczuk_write_enable, '1', grygorczuk_buffered_modify(31 DOWNTO 24),
                                                     "00", grygorczuk_unite_3);

unite_loop: for i in 0 to 7 generate
grygorczuk_indep_sram_output(i) <= grygorczuk_unite_0(i);
grygorczuk_indep_sram_output(8+i) <= grygorczuk_unite_1(i);
grygorczuk_indep_sram_output(16+i) <= grygorczuk_unite_2(i);
grygorczuk_indep_sram_output(24+i) <= grygorczuk_unite_3(i);
end generate;

--Buffers
tri_state_buffer_three_two_0: tri_state_buffer_three_two port map (grygorczuk_output_enable, grygorczuk_user_sram_output, grygorczuk_user_buffer);
tri_state_buffer_three_two_1: tri_state_buffer_three_two port map (grygorczuk_output_enable, grygorczuk_indep_sram_output, grygorczuk_indep_buffer);

--Adder/Subtractor 
N_BIT_ADDER_part: N_BIT_ADDER port map(grygorczuk_carry_in, grygorczuk_sign, grygorczuk_user_buffer, grygorczuk_indep_buffer,
  grygorczuk_of, grygorczuk_nf, grygorczuk_zf, grygorczuk_cof, grygorczuk_modif_output);
	
--Eight Hex Displays 
eight_hexs_part: eight_hexs port map(grygorczuk_indep_sram_output, grygorczuk_o0, grygorczuk_o1, grygorczuk_o2, grygorczuk_o3,
grygorczuk_o4, grygorczuk_o5, grygorczuk_o6, grygorczuk_o7);
	
end project_five_part_one_logic;
	
