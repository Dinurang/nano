----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2025 12:01:12 PM
-- Design Name: 
-- Module Name: Clock - Behavioral
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

entity Clock is
    Port ( CLKIn_from_Basys : in STD_LOGIC;
    CLKOut_to_Components : out STD_LOGIC);
end Clock;

architecture Behavioral of Clock is

component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
        Clk_out : out STD_LOGIC);
 end component;

signal slow_clk_out :std_logic;

begin

Slow_Clk_0: Slow_Clk port map(
  Clk_in => CLKIn_from_Basys,
  Clk_out => slow_clk_out);

CLKOut_to_Components <= slow_clk_out;

end Behavioral;
