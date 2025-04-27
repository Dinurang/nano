library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity InstructionDecoder is
    Port ( InstructionBus : in STD_LOGIC_VECTOR (11 downto 0);
           RegValueForCheck : in STD_LOGIC_VECTOR (3 downto 0);
           JumpFlag : out STD_LOGIC;
           JumpAddress : out STD_LOGIC_VECTOR (3 downto 0);
           AddSubSelect : out STD_LOGIC;
           RegSelect1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSelect2 : out STD_LOGIC_VECTOR (2 downto 0);
           ImmediateValue : out STD_LOGIC_VECTOR (3 downto 0);
           LoadSelect : out STD_LOGIC;
           RegEN : out STD_LOGIC_VECTOR (2 downto 0));
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is
begin


process (InstructionBus)
begin
    -- Default values to avoid latches
    LoadSelect <= '0';
    AddSubSelect <= '0';
    JumpFlag <= '0';
    RegEN <= (others => '0');
    ImmediateValue <= (others => '0');
    RegSelect1 <= (others => '0');
    RegSelect2 <= (others => '0');
    JumpAddress <= (others => '0');

    if (InstructionBus(11) = '1') and (InstructionBus(10) = '0') then
        -- Load Immediate Operation
        RegEN(2 downto 0) <= InstructionBus(9 downto 7);
        ImmediateValue(3 downto 0) <= InstructionBus(3 downto 0);
        LoadSelect <= '1';

    elsif (InstructionBus(11) = '0') and (InstructionBus(10) = '0') then
        -- Register to Register Transfer
        RegSelect1(2 downto 0) <= InstructionBus(9 downto 7);
        RegSelect2(2 downto 0) <= InstructionBus(6 downto 4);
        RegEN(2 downto 0) <= InstructionBus(3 downto 1);

    elsif (InstructionBus(11) = '0') and (InstructionBus(10) = '1') then
        -- Arithmetic Operation (Add/Sub)
        RegSelect1(2 downto 0) <= InstructionBus(6 downto 4);
        RegSelect2(2 downto 0) <= InstructionBus(9 downto 7);
        RegEN(2 downto 0) <= InstructionBus(9 downto 7);
        AddSubSelect <= '1';

    elsif (InstructionBus(11) = '1') and (InstructionBus(10) = '1') then
        -- Conditional Jump
        RegSelect1(2 downto 0) <= InstructionBus(9 downto 7);

        if RegValueForCheck = "0000" then
            JumpFlag <= '1';
            JumpAddress(2 downto 0) <= InstructionBus(2 downto 0);  
        else
            JumpFlag <= '0';
        end if;

    end if;
end process;

    
end behavioral;
