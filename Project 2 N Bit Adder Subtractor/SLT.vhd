library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity SLT is 
  generic(
    n: integer := 4
  );
  port(
  grygorczuk_x_1, grygorczuk_y_1 : in std_logic_vector(n-1 DOWNTO 0);
  grygorczuk_output : out std_logic
  );
end SLT;



architecture SLT_LOGIC of SLT is

component COMPARATOR is
  generic(
    n: integer := 4
  );
	port(grygorczuk_sign : in std_logic;
		grygorczuk_X, grygorczuk_Y: in std_logic_vector(n-1 DOWNTO 0);
		grygorczuk_OVF, grygorczuk_NF, grygorczuk_ZF, grygorczuk_COF: out std_logic;
		grygorczuk_OUT: out std_logic_vector(n-1 DOWNTO 0)
	);
end component; 


signal grygorczuk_op :  std_logic_vector(n-1 DOWNTO 0);
signal SIGN, OVF_FLAG, N_FLAG, Z_FLAG, OC_FLAG : std_logic; 

--y = B'C'D' + A'BC'
begin
SIGN <= '1';
COMPARATOR_PART : COMPARATOR port map(SIGN, grygorczuk_x_1, grygorczuk_y_1, OVF_FLAG, N_FLAG, Z_FLAG, OC_FLAG, grygorczuk_op);
grygorczuk_output <= (not N_FLAG and not Z_FLAG and not OC_FLAG) or (not OVF_FLAG and  N_FLAG and not Z_FLAG); 

end SLT_LOGIC; 