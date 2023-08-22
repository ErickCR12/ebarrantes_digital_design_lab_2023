library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FullAdder4Bit_tb is
end FullAdder4Bit_tb;

architecture fourbitadder_tb of FullAdder4Bit_tb is
    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal Cin : STD_LOGIC;
    signal Sum : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout : STD_LOGIC;
    
    signal DisplayA, DisplayB, DisplaySum : STD_LOGIC_VECTOR(6 downto 0);
    
    component FourBitAdder
        Port ( A, B : in STD_LOGIC_VECTOR(3 downto 0);
               Cin : in STD_LOGIC;
               Sum : out STD_LOGIC_VECTOR(3 downto 0);
               Cout : out STD_LOGIC);
    end component;
    
    component HexDisplay
        Port ( HexValue : in STD_LOGIC_VECTOR(3 downto 0);
               Segments : out STD_LOGIC_VECTOR(6 downto 0));
    end component;
    
begin
    UUT: FourBitAdder port map (A, B, Cin, Sum, Cout);
    
    DisplayA_UUT: HexDisplay port map (A, DisplayA);
    DisplayB_UUT: HexDisplay port map (B, DisplayB);
    DisplaySum_UUT: HexDisplay port map (Sum, DisplaySum);
    
    process
    begin
        A <= "0000"; B <= "0000"; Cin <= '0';
        wait for 0.2 ns;
        
        A <= "0010"; B <= "1011"; Cin <= '1';
        wait for 0.2 ns;
        
        A <= "1101"; B <= "0110"; Cin <= '0';
        wait for 0.2 ns;
        
        A <= "1010"; B <= "1001"; Cin <= '1';
        wait for 0.2 ns;
        
        wait;
    end process;
end fourbitadder_tb;
