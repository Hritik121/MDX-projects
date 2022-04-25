----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:32:27 01/31/2021 
-- Design Name: 
-- Module Name:    hextosev - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hextosev is
    Port ( bcd : in  STD_LOGIC_VECTOR (3 downto 0);
           sevenseg : out  STD_LOGIC_VECTOR (6 downto 0);
           Enable : out  STD_LOGIC_VECTOR (7 downto 0));
end hextosev;


architecture Behavioral of hextosev is
	signal leds: std_logic_vector (6 downto 0);

begin
-- | a | b | c | d | e | f | g |
-- |leds6|leds5|leds4|leds3|leds2|leds1|leds0|
with bcd select
	leds <= "1111110" when "0000", --0
			  "0110000" when "0001",
			  "1101101" when "0010",
			  "1111001" when "0011",
			  "0110011" when "0100",
			  "1011011" when "0101",
			  "1011111" when "0110",
			  "1110000" when "0111",
			  "1111111" when "1000",
			  "1111011" when "1001",
			  "1110111" when "1010",
			  "0011111" when "1011",
			  "1001110" when "1100",
			  "0111101" when "1101",
			  "1001111" when "1110",
			  "1000111" when others;
			  
			  
		  	  
			   -- There are 4 7-seg displays that can be used. We will use only the last (from left to right):
			  Enable <= "11111110"; -- only the first 7-seg display is activated.
			  -- Enable(0) goes to one 7-seg display. It goes to every LED anode.
		     -- To activate the anode, we need Enable(0) to be zero (see circuit)
		     sevenseg <= not(leds); --- HERE we invert the sevenseg output from signal leds



end Behavioral;

