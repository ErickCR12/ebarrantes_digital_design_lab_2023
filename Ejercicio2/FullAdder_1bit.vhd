library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder_1bit is
    Port ( A, B, Cin : in STD_LOGIC;
           Sum, Cout : out STD_LOGIC);
end FullAdder_1bit;

architecture full_adder1bit of FullAdder_1bit is
begin
    Sum <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (B AND Cin) OR (A AND Cin);
end full_adder1bit;

----------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FullAdder_4bit is
    Port ( A, B : in STD_LOGIC_VECTOR(3 downto 0);
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR(3 downto 0);
           Cout : out STD_LOGIC);
end FullAdder_4bit;

architecture fulladder_4bit of FullAdder_4bit is
    signal C : STD_LOGIC_VECTOR(3 downto 0);
    signal S : STD_LOGIC_VECTOR(3 downto 0);
begin
    C(0) <= Cin;

    FA0: entity work.FullAdder_1bit
        port map (A(0), B(0), C(0), S(0), C(1));
    
    FA1: entity work.FullAdder_1bit
        port map (A(1), B(1), C(1), S(1), C(2));
        
    FA2: entity work.FullAdder_1bit
        port map (A(2), B(2), C(2), S(2), C(3));
        
    FA3: entity work.FullAdder_1bit
        port map (A(3), B(3), C(3), S(3), Cout);
        
    Sum <= S;
end fulladder_4bit;