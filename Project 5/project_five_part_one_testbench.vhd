library ieee; 
use ieee.std_logic_1164.all;

entity project_five_part_one_testbench is 
end project_five_part_one_testbench;

architecture project_five_part_one_testbench_logic of project_five_part_one_testbench is

component project_five_part_one is
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
end component;

signal grygorczuk_cici, grygorczuk_rd, grygorczuk_we: std_logic;
signal grygorczuk_ofof, grygorczuk_nfne, grygorczuk_zfzf, grygorczuk_cofcof: std_logic;
signal grygorczuk_key0, grygorczuk_key1, grygorczuk_key2, grygorczuk_key3, grygorczuk_clear: std_logic;
signal grygorczuk_out0, grygorczuk_out1, grygorczuk_out2, grygorczuk_out3: std_logic_vector(6 DOWNTO 0);
signal grygorczuk_out4, grygorczuk_out5, grygorczuk_out6, grygorczuk_out7: std_logic_vector(6 DOWNTO 0);
signal grygorczuk_ININ : std_logic_vector (7 DOWNTO 0);
signal grygorczuk_OUT: std_logic_vector(31 DOWNTO 0);

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: project_five_part_one port map(

  grygorczuk_ci => grygorczuk_cici,
  grygorczuk_read => grygorczuk_rd,
  grygorczuk_write => grygorczuk_we,
  grygorczuk_cl =>grygorczuk_clear,
  
  grygorczuk_k0 => grygorczuk_key0,
  grygorczuk_k1 => grygorczuk_key1,
  grygorczuk_k2 => grygorczuk_key2,
  grygorczuk_k3 => grygorczuk_key3,
  
  grygorczuk_input_x => grygorczuk_ININ,
  
  grygorczuk_of => grygorczuk_ofof,
  grygorczuk_nf => grygorczuk_nfne,
  grygorczuk_zf => grygorczuk_zfzf,
  grygorczuk_cof => grygorczuk_cofcof,
    
  grygorczuk_output => grygorczuk_OUT,
  
  grygorczuk_o0 => grygorczuk_out0,
  grygorczuk_o1 => grygorczuk_out1,
  grygorczuk_o2 => grygorczuk_out2,
  grygorczuk_o3 => grygorczuk_out3,
  grygorczuk_o4 => grygorczuk_out4,
  grygorczuk_o5 => grygorczuk_out5,
  grygorczuk_o6 => grygorczuk_out6,
  grygorczuk_o7 => grygorczuk_out7
);

--Test Bench
Test_Bench : process
begin 
  
  --PAUSE  
  grygorczuk_cici <= '0';
  grygorczuk_rd <= '1';
  grygorczuk_we <= '0';
  grygorczuk_key0 <= '1';
  grygorczuk_key1 <= '1';
  grygorczuk_key2 <= '1';
  grygorczuk_key3 <= '1';
  grygorczuk_clear <= '0';
  grygorczuk_ININ <= "11110000";
  wait for 10 ps;
  
  --Saves Clears  
  grygorczuk_cici <= '0';
  grygorczuk_rd <= '1';
  grygorczuk_we <= '1';
  grygorczuk_key0 <= '0';
  grygorczuk_key1 <= '1';
  grygorczuk_key2 <= '1';
  grygorczuk_key3 <= '1';
  grygorczuk_clear <= '1';
  grygorczuk_ININ <= "11110000";
  wait for 100 ps;

  --PAUSE  
  grygorczuk_cici <= '0';
  grygorczuk_rd <= '1';
  grygorczuk_we <= '0';
  grygorczuk_key0 <= '1';
  grygorczuk_key1 <= '1';
  grygorczuk_key2 <= '1';
  grygorczuk_key3 <= '1';
  grygorczuk_clear <= '0';
  grygorczuk_ININ <= "11110000";
  wait for 10 ps;

  --Saves "11110000" to fourth quadrant 
  grygorczuk_cici <= '0';
  grygorczuk_rd <= '1';
  grygorczuk_we <= '1';
  grygorczuk_key0 <= '0';
  grygorczuk_key1 <= '1';
  grygorczuk_key2 <= '1';
  grygorczuk_key3 <= '1';
  grygorczuk_clear <= '0';
  grygorczuk_ININ <= "11110000";
  wait for 100 ps;
  
  --PAUSE  
  grygorczuk_cici <= '0';
  grygorczuk_rd <= '1';
  grygorczuk_we <= '0';
  grygorczuk_key0 <= '1';
  grygorczuk_key1 <= '1';
  grygorczuk_key2 <= '1';
  grygorczuk_key3 <= '1';
  grygorczuk_clear <= '0';
  grygorczuk_ININ <= "11110000";
  wait for 10 ps;
  
  --Writes 00001111 to thrid quadrant 
  grygorczuk_cici <= '0';
  grygorczuk_rd <= '1';
  grygorczuk_we <= '1';
  grygorczuk_key0 <= '1';
  grygorczuk_key1 <= '0';
  grygorczuk_key2 <= '1';
  grygorczuk_key3 <= '1';
  grygorczuk_clear <= '0';
  grygorczuk_ININ <= "00001111";
  wait for 100 ps;
  
  --PAUSE 
  grygorczuk_cici <= '0';
  grygorczuk_rd <= '1';
  grygorczuk_we <= '0';
  grygorczuk_key0 <= '1';
  grygorczuk_key1 <= '1';
  grygorczuk_key2 <= '1';
  grygorczuk_key3 <= '1';
  grygorczuk_clear <= '0';
  grygorczuk_ININ <= "11110000";
  wait for 10 ps;
    
  --Writes 01010101 to second qudarnt 
  grygorczuk_cici <= '0';
  grygorczuk_rd <= '1';
  grygorczuk_we <= '1';
  grygorczuk_key0 <= '1';
  grygorczuk_key1 <= '1';
  grygorczuk_key2 <= '0';
  grygorczuk_key3 <= '1';
  grygorczuk_clear <= '0';
  grygorczuk_ININ <= "01010101";
  wait for 100 ps;
  
  --PAUSE 
  grygorczuk_cici <= '0';
  grygorczuk_rd <= '1';
  grygorczuk_we <= '0';
  grygorczuk_key0 <= '1';
  grygorczuk_key1 <= '1';
  grygorczuk_key2 <= '1';
  grygorczuk_key3 <= '1';
  grygorczuk_clear <= '0';
  grygorczuk_ININ <= "11110000";
  wait for 10 ps;
  
  --Writes 10101010 to first quadrant 
  grygorczuk_cici <= '0';
  grygorczuk_rd <= '1';
  grygorczuk_we <= '1';
  grygorczuk_key0 <= '1';
  grygorczuk_key1 <= '1';
  grygorczuk_key2 <= '1';
  grygorczuk_key3 <= '0';
  grygorczuk_clear <= '0';
  grygorczuk_ININ <= "10101010";
  wait for 100 ps;
  
  --PAUSE 
  grygorczuk_cici <= '0';
  grygorczuk_rd <= '1';
  grygorczuk_we <= '0';
  grygorczuk_key0 <= '1';
  grygorczuk_key1 <= '1';
  grygorczuk_key2 <= '1';
  grygorczuk_key3 <= '1';
  grygorczuk_clear <= '0';
  grygorczuk_ININ <= "11110000";
  wait for 100 ps;
  
   --Saves Clears  
  grygorczuk_cici <= '0';
  grygorczuk_rd <= '1';
  grygorczuk_we <= '1';
  grygorczuk_key0 <= '0';
  grygorczuk_key1 <= '1';
  grygorczuk_key2 <= '1';
  grygorczuk_key3 <= '1';
  grygorczuk_clear <= '1';
  grygorczuk_ININ <= "11110000";
  wait for 100 ps;
  
    --PAUSE 
  grygorczuk_cici <= '0';
  grygorczuk_rd <= '1';
  grygorczuk_we <= '0';
  grygorczuk_key0 <= '1';
  grygorczuk_key1 <= '1';
  grygorczuk_key2 <= '1';
  grygorczuk_key3 <= '1';
  grygorczuk_clear <= '0';
  grygorczuk_ININ <= "11110000";
  wait for 10 ps;
  
   --Inputs 11110000 to first quadrent, and adds them 
  grygorczuk_cici <= '0';
  grygorczuk_rd <= '1';
  grygorczuk_we <= '1';
  grygorczuk_key0 <= '1';
  grygorczuk_key1 <= '1';
  grygorczuk_key2 <= '1';
  grygorczuk_key3 <= '0';
  grygorczuk_clear <= '1';
  grygorczuk_ININ <= "11110000";
  wait for 100 ps;
  
    --PAUSE 
  grygorczuk_cici <= '0';
  grygorczuk_rd <= '1';
  grygorczuk_we <= '0';
  grygorczuk_key0 <= '1';
  grygorczuk_key1 <= '1';
  grygorczuk_key2 <= '1';
  grygorczuk_key3 <= '1';
  grygorczuk_clear <= '0';
  grygorczuk_ININ <= "11110000";
  wait for 10 ps;
  
   --Subtracts 10000000  
  grygorczuk_cici <= '1';
  grygorczuk_rd <= '1';
  grygorczuk_we <= '1';
  grygorczuk_key0 <= '1';
  grygorczuk_key1 <= '1';
  grygorczuk_key2 <= '1';
  grygorczuk_key3 <= '1';
  grygorczuk_clear <= '1';
  grygorczuk_ININ <= "11110000";
  wait for 100 ps;
  
end process; 
end project_five_part_one_testbench_logic;








