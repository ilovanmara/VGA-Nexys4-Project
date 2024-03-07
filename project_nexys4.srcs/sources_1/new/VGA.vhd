----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2022 09:34:56 AM
-- Design Name: 
-- Module Name: VGA - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.procedura_vga.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VGA is
Port 
( 
signal clk:in std_logic;
signal HSYNC:out std_logic;
signal VSYNC:out std_logic;
signal R:out std_logic_vector(3 downto 0);
signal G:out std_logic_vector(3 downto 0);
signal B:out std_logic_vector(3 downto 0);
signal sel:in std_logic;
signal culoare:in std_logic_vector( 11 downto 0);
signal butoane:in std_logic_vector(3 downto 0)
);
end VGA;

architecture Behavioral of VGA is

signal HPOS:INTEGER RANGE 0 TO 1688:=0; 
signal VPOS:INTEGER RANGE 0 TO 1066:=0; 


signal x1:INTEGER range 0 to 1688:=1042;
signal y1:INTEGER range 0 to 1688:=554;
signal RGB:std_logic_vector(3 downto 0);
signal DRAW:std_logic:='1';
begin

Pixel(HPOS,VPOS,x1,y1,RGB,DRAW);
process(clk)
begin

if clk'event and clk='1' then

if DRAW='1' then
if sel='1' then
R<=culoare(11 downto 8);
G<=culoare(7 downto 4);
B<=culoare(3 downto 0);
else
R<=RGB;
G<=RGB;
B<=RGB;
end if;
else
R<=(others=>'0');
G<=(others=>'0');
B<=(others=>'0');
end if;

    if (HPOS<1688) then
        HPOS<=HPOS+1;
    else
        HPOS<=0;
            if VPOS<1066 THEN
                VPOS<=VPOS+1;
            else
                VPOS<=0;
            end if;
    end if;



if(HPOS>=48 AND HPOS<160) THEN
    HSYNC<='0';
else
    HSYNC<='1';
end if;
if(VPOS>=1 AND VPOS<4) THEN
    VSYNC<='0';
else
    VSYNC<='1';
end if;

--det rgb pentru perioada de sincronizare
if ((HPOS>0 AND HPOS<408) OR (VPOS>0 AND VPOS<42)) then
R<=(others=>'0');
G<=(others=>'0');
B<=(others=>'0');
end if;

if butoane="1000" then
y1<=y1-5;
end if;

if butoane="0100" then
y1<=y1+5;
end if;

if butoane="0010" then
x1<=x1-5;
end if;

if butoane="0001" then
x1<=x1+5;
end if;
end if;
end process;

end Behavioral;
