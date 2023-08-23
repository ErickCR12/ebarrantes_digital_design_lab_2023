library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder_1bit is
    Port ( A, B, Cin : in STD_LOGIC;
           Sum, Cout : out STD_LOGIC);
end FullAdder_1bit;

architecture fulladder of FullAdder_1bit is
begin
    Sum <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (B AND Cin) OR (A AND Cin);
end fulladder;
