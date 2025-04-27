library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TwoWay4Bit_Mux is
    Port ( In0 : in STD_LOGIC_VECTOR (3 downto 0);
           In1 : in STD_LOGIC_VECTOR (3 downto 0);
           S0 : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end TwoWay4Bit_Mux;

architecture Behavioral of TwoWay4Bit_Mux is

begin

 Y <= In0 when S0 = '0' else In1;
 
end Behavioral;



