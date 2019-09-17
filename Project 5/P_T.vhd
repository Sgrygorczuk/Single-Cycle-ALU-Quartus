library ieee;
use ieee.std_logic_1164.all;

entity project_five_part_one is
	port(
	  grygorczuk_ci, grygorczuk_read, grygorczuk_write, grygorczuk_cl: in std_logic;
	  grygorczuk_k0, grygorczuk_k1, grygorczuk_k2, grygorczuk_k3: in std_logic;
	  grygorczuk_input_x : in std_logic_vector(7 DOWNTO 0); 
	  grygorczuk_of, grygorczuk_nf, grygorczuk_zf, grygorczuk_cof: out std_logic;  
	  grygorczuk_output : out std_logic_vector(31 DOWNTO 0); 
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
		grygorczuk_key_0, grygorczuk_key_1, grygorczuk_key_2, grygorczuk_key_3, grygorczuk_clear: in std_logic;
		grygorczuk_in: in std_logic_vector(7 DOWNTO 0);
		grygorczuk_addresses: in std_logic_vector(1 DOWNTO 0);
		grygorczuk_output: out std_logic_vector(31 DOWNTO 0)
		);
end component;

component sram_three_two is 
	port(
		grygorczuk_cs, grygorczuk_we, grygorczuk_oe: in std_logic;
		grygorczuk_in: in std_logic_vector(31 DOWNTO 0);
		grygorczuk_addresses: in std_logic_vector(1 DOWNTO 0);
		grygorczuk_output: out std_logic_vector(31 DOWNTO 0)
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

signal grygorczuk_u_sram_o, grygorczuk_buffer_0, grygorczuk_buffer_1: std_logic_vector(31 DOWNTO 0);
signal grygorczuk_i_sram_o, grygorczuk_cleared_o, grygorczuk_add_output: std_logic_vector(31 DOWNTO 0) := "00000000000000000000000000000000" ;
signal grygorczuk_write_clear: std_logic;

begin
  
--User SRAM, chip is always on, read is always on, address is always 00, takes in 8 bit user input values 
sram_four_x_thirty_two_0: sram_four_x_thirty_two port map('1', grygorczuk_write, '1', grygorczuk_k0, grygorczuk_k1, 
grygorczuk_k2, grygorczuk_k3,grygorczuk_cl, grygorczuk_input_x, "00", grygorczuk_u_sram_o);

--If clear is set it will put both SRAMs to be 0
with grygorczuk_cl select
		grygorczuk_cleared_o <= grygorczuk_add_output when '0',
											  "00000000000000000000000000000000" when '1',
											  "00000000000000000000000000000000" when others;
grygorczuk_write_clear <= grygorczuk_write or grygorczuk_cl;
											  

--Indepedent SRAM, chip always on, read always on, address is always 00, takes in 32 bit numbers from the adder 
sram_three_two_0: sram_three_two port map('1', grygorczuk_write_clear, '1', grygorczuk_cleared_o, "00",  grygorczuk_i_sram_o); 

--The buffers put the info from the SRAMs to the adder 
tri_state_buffer_three_two_0: tri_state_buffer_three_two port map(grygorczuk_read, grygorczuk_u_sram_o, grygorczuk_buffer_0);
tri_state_buffer_three_two_1: tri_state_buffer_three_two port map(grygorczuk_read, grygorczuk_i_sram_o, grygorczuk_buffer_1);
  
--The adder takes in inputs from both SRAMs and saves them to the I SRAM 
N_BIT_ADDER_0: N_BIT_ADDER port map(grygorczuk_ci, '0', grygorczuk_buffer_0, grygorczuk_buffer_1, grygorczuk_of, 
grygorczuk_nf, grygorczuk_zf, grygorczuk_cof, grygorczuk_add_output);

--Hex output
eight_hexs_0: eight_hexs port map(grygorczuk_add_output, grygorczuk_o0, grygorczuk_o1, grygorczuk_o2, grygorczuk_o3,
grygorczuk_o4, grygorczuk_o5, grygorczuk_o6, grygorczuk_o7);
  	
end project_five_part_one_logic;
	


