library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FullAdder4Bit_tb is
end FullAdder4Bit_tb;

architecture Behavioral of FullAdder4Bit_tb is
    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal Cin, Cout : STD_LOGIC;
    signal Segments : STD_LOGIC_VECTOR(6 downto 0);
    
    constant clock_period : time := 0.2 ns; -- Simulation clock period
    
    -- Test cases
    constant operand_1 : STD_LOGIC_VECTOR(3 downto 0) := "0101";
    constant operand_2 : STD_LOGIC_VECTOR(3 downto 0) := "0010";
    constant operand_3 : STD_LOGIC_VECTOR(3 downto 0) := "1111";
    constant operand_4 : STD_LOGIC_VECTOR(3 downto 0) := "1000";
    
begin
    -- Instantiate the FourBitAdderWithHexDisplay component
    uut : entity work.FullAdder4Bit
        port map (
            A => A,
            B => B,
            Cin => Cin,
            Segments => Segments,
            Cout => Cout
        );
        
    -- Stimulus process
    stimulus : process
    begin
        A <= operand_1;
        B <= operand_2;
        Cin <= '0';
        wait for clock_period;
        
        A <= operand_3;
        B <= operand_4;
        Cin <= '1';
        wait for clock_period;
        
        A <= operand_2;
        B <= operand_4;
        Cin <= '0';
        wait for clock_period;
        
        A <= operand_1;
        B <= operand_3;
        Cin <= '1';
        wait for clock_period;
        
        wait;
    end process;
end Behavioral;