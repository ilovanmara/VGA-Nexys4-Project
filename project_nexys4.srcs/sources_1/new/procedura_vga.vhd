----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2022 10:34:34 AM
-- Design Name: 
-- Module Name: procedura_vga - Behavioral
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

PACKAGE procedura_vga is 
PROCEDURE Pixel
(
signal Xcur:in Integer;
signal Ycur:in Integer;
signal Xpos:in Integer;
signal Ypos:in Integer;
signal RGB:out STD_lOGIC_VECTOR(3 DOWNTO 0);
signal DRAW:out std_logic
);
end procedura_vga;

package body procedura_vga is
PROCEDURE Pixel
(
signal Xcur:in Integer;
signal Ycur:in Integer;
signal Xpos:in Integer;
signal Ypos:in Integer;
signal RGB:out STD_lOGIC_VECTOR(3 DOWNTO 0);
signal DRAW:out std_logic
) IS
BEGIN
if(Xcur=Xpos and Ycur=Ypos) then
  RGB<="1111";
  DRAW<='1';
  else
  DRAW<='0';
  
 end if;
end Pixel;
end procedura_vga;

