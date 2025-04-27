library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity LUT_8_12 is
    Port ( MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
           InstructionBus : out STD_LOGIC_VECTOR (11 downto 0));
end LUT_8_12;

architecture Behavioral of LUT_8_12 is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0); 
signal program_ROM : rom_type := ( 
"1000000", -- 0 
"1111001",
"0100100",
"0110000",
"0011001",
"0010010",
"0000010",
"1111000"); 

begin

InstructionBus <= program_ROM(to_integer(unsigned(MemorySelect)));

end Behavioral;
