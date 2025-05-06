library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           RegClock : in STD_LOGIC;
           RegReset : in STD_LOGIC;
           RegEn : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Reg;

architecture Behavioral of Reg is

component D_FF
port (     D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end component;

signal y0,y1,y2,y3 : std_logic;
begin

D_FF_0 : D_FF 
port map(
      D => I(0),
      Res => RegReset,
      Clk => RegClock,
      Q => y0);

D_FF_1 : D_FF 
port map(
     D => I(1),
      Res => RegReset,
      Clk => RegClock,
      Q => y1);

D_FF_2 : D_FF 
port map(
      D => I(2),
      Res => RegReset,
      Clk => RegClock,
      Q => y2);

D_FF_3 : D_FF 
port map(
  D => I(3),
      Res => RegReset,
      Clk => RegClock,
      Q => y3);

process (RegEn, y0, y1, y2, y3)
begin
    if RegEn = '1' then
        Y <= (y3 & y2 & y1 & y0); -- Concatenate bits into a vector
    else
        Y <= "0000"; -- Assign the full vector
    end if;
end process;



end Behavioral;
