----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2022 09:25:03 AM
-- Design Name: 
-- Module Name: Nexys4 - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Nexys4 is
Port 
(
signal clk:in std_logic;
signal btn:in std_logic_vector(4 downto 0);
signal sw:in std_logic_vector(15 downto 0);
signal led:out std_logic_vector(15 downto 0);
signal cat:out std_logic_vector(6 downto 0);
signal an:out std_logic_vector(7 downto 0);
signal VGA_R:out std_logic_vector(3 downto 0);
signal VGA_G:out std_logic_vector(3 downto 0);
signal VGA_B:out std_logic_vector(3 downto 0);
signal VGA_HS:out std_logic;
signal VGA_VS:out std_logic
);
end Nexys4;

architecture Behavioral of Nexys4 is

signal counter:integer;
signal semnal_divizat:std_logic:='0';
signal btn_rst:std_logic;

signal btn_up:std_logic;
signal btn_down:std_logic;
signal btn_left:std_logic;
signal btn_right:std_logic;

signal butoane:std_logic_vector(3 downto 0);
begin

--process(clk,btn_rst)
--begin
--if btn_rst='1' then
--counter<=0;
--elsif clk='1' and clk'event then
--    if counter<1 then
--        counter<=counter+1;
--    else
--        counter<=0;
--        semnal_divizat<=not(semnal_divizat);
--    end if;
--end if;
--end process;

btn_c:entity WORK.mpg port map
(
btn=>btn(0),
clk=>clk,
en=>btn_rst
);
btn_u:entity WORK.mpg port map
(
btn=>btn(1),
clk=>clk,
en=>btn_up
);
btn_s:entity WORK.mpg port map
(
btn=>btn(2),
clk=>clk,
en=>btn_left
);
btn_r:entity WORK.mpg port map
(
btn=>btn(3),
clk=>clk,
en=>btn_right
);
btn_d:entity WORK.mpg port map
(
btn=>btn(4),
clk=>clk,
en=>btn_down
);
display:entity WORK.VGA port map
(
 clk=>clk,
 HSYNC=>VGA_HS,
 VSYNC=>VGA_VS,
 R=>VGA_R,
 G=>VGA_G,
 B=>VGA_B,
 sel=>sw(15),
 culoare=>sw(11 downto 0),
 butoane=>butoane
);
butoane<=btn_up & btn_down & btn_left & btn_right;

end Behavioral;