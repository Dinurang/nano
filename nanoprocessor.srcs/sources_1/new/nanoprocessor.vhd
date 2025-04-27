----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2025 12:27:10 PM
-- Design Name: 
-- Module Name: nanoprocessor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity nanoprocessor is
    Port ( NanoClock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           FourLED : out STD_LOGIC_VECTOR (3 downto 0);
           SevenSegment : out STD_LOGIC_VECTOR (6 downto 0);
           OverflowLED : out STD_LOGIC;
           ZeroLED : out STD_LOGIC);
end nanoprocessor;

architecture Behavioral of nanoprocessor is

component Clock is
    Port ( CLKIn_from_Basys : in STD_LOGIC;
    CLKOut_to_Components : out STD_LOGIC);
end component;

signal clkout_to_components : std_logic;

begin
Clock_global : Clock 
port map (
   CLKIn_from_Basys => NanoClock ,
   CLKOut_to_Components => clkout_to_components);



end Behavioral;
