
--By Sebatian Grygorczuk
--For CSC 343, Computer Organization Lab Fall 2018
--This file contains the testbench for the the SRAM 4x8 the inputs and outputs are too long to display as a comment reffer to the 
--simulation graph

library ieee; 
use ieee.std_logic_1164.all;

entity OpControl_testbench is 
end OpControl_testbench;

architecture OpControl_testbench_loigc of OpControl_testbench is

component OpControl is
	port(
		grygorczuk_op, grygorczuk_funt: in std_logic_vector(5 downto 0);
		ALUctr : out std_logic_vector(3 downto 0);
		RegDst, RegWr, MemWr, MemToReg, ExpOp, ALUscr, PCsrc : out std_logic
		);
end component;

signal RD, RW, MW, MTR, EO, AS, PSS: std_logic;
signal ALU : std_logic_vector(3 DOWNTO 0);
signal OP, FUNT: std_logic_vector(5 DOWNTO 0);

begin 
  ------Instantiate the Unit Under Test (UUT)
utt: OpControl port map(
  grygorczuk_op => OP,
  grygorczuk_funt => FUNT,
  ALUctr => ALU,
  RegDst => RD,
  RegWr => RW,
  MemWr => MW,
  MemToReg => MTR,
  ExpOp => EO,
  ALUscr => AS,
  PCsrc => PSS
);

--Test Bench
Test_Bench : process
begin 

OP <= "000000";
FUNT <= "000000";
wait for 100 ps;

OP <= "000000";
FUNT <= "000001";
wait for 100 ps;

OP <= "000000";
FUNT <= "000010";
wait for 100 ps;

OP <= "000000";
FUNT <= "000011";
wait for 100 ps;

OP <= "000000";
FUNT <= "000100";
wait for 100 ps;

OP <= "000000";
FUNT <= "000101";
wait for 100 ps;

OP <= "000000";
FUNT <= "000110";
wait for 100 ps;

OP <= "000000";
FUNT <= "000111";
wait for 100 ps;

OP <= "000000";
FUNT <= "001000";
wait for 100 ps;

OP <= "000000";
FUNT <= "001001";
wait for 100 ps;

OP <= "000001";
FUNT <= "000000";
wait for 100 ps;

OP <= "000010";
FUNT <= "000000";
wait for 100 ps;

OP <= "000011";
FUNT <= "000000";
wait for 100 ps;

end process; 
end OpControl_testbench_loigc;








