library ieee;
use ieee.std_logic_1164.all;

entity sevensegdisplay is
  port(A, B, C, D : in std_logic;
       Sa, Sb, Sc, Sd, Se, Sf, Sg : out std_logic);
end sevensegdisplay;

architecture behav of sevensegdisplay is
begin
  Sa <= (B and (not C) and (not D)) or ((not A) and (not B) and (not C) and D);
  Sb <= (B and (not C) and D) or (B and C and (not D));
  Sc <= ((not B) and C and (not D));
  Sd <= (B and (not C) and (not D)) or (B and C and D) or ((not A) and (not B) and (not C) and D);
  Se <= (D) or (B and (not C));
  Sf <= (C and D) or ((not B) and C) or ((not A) and (not B) and D);
  Sg <= ((not A) and (not B) and (not C)) or (B and C and D);
end behav;
