library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity BCD is
  
  --generic(N: positive := 20; -- size of binary input
         -- numDigits: positive := 7); -- resulting number of digits in decimal (IE: 2^N = 2^20 = 1048575 =7 digits)

	port ( Din: in std_logic_vector(19 downto 0); 
		Dout: out std_logic_vector(27 downto 0); 
		overflow: out std_logic);
    
end BCD;

Architecture struct of BCD is 

 
  --function count_digits(input_vector : std_logic_vector) return integer is
   -- variable input_int : integer;
    --variable digits : integer := 0;
    --begin
    --input_int := to_integer(unsigned(input_vector));
    
    --while input_int > 0 loop
      --digits := digits + 1;
      --input_int := input_int / 10;
    --end loop;
  
    --return digits;
  --end function;
  

  begin

  Process(Din)

    --initializes all bits of temp with 0 using the aggregate funciton 'others'
    variable temp : std_logic_vector(27 downto 0); --:= ((others => '0') );
    --variable numDigits : integer := 0;
    --variable a, b  : integer;
 
    begin
    
    if (to_integer(unsigned(Din)) > 999999) then  
      overflow <= '1';
    else 
      overflow <= '0';
    end if;
  
    --temp := not temp;
    --numDigits := count_digits(temp);
    --temp := not temp;

    temp := "0000000000000000000000000000";
    for i in 19 downto 0 loop

      temp := temp(26 downto 0) & Din(i);
      
      --a := 3; b := 0;
      --for j in 0 to numDigits-1 loop

        --if(unsigned(temp(a downto b)) > 4) then
          --temp(a downto b) := std_logic_vector(unsigned(temp(a downto b)) + 3);
        --end if;

       -- a := a + 4; 
       -- b := b + 4;
        
      --end loop;
      if i /= 0 then
        if(unsigned(temp(27 downto 24)) > 4) then
          temp(27 downto 24) := std_logic_vector(unsigned(temp(27 downto 24)) + 3);
        end if;

        if(unsigned(temp(23 downto 20)) > 4) then
          temp(23 downto 20) := std_logic_vector(unsigned(temp(23 downto 20)) + 3);
        end if;

        if(unsigned(temp(19 downto 16)) > 4) then
          temp(19 downto 16) := std_logic_vector(unsigned(temp(19 downto 16)) + 3);
        end if;

        if(unsigned(temp(15 downto 12)) > 4) then
          temp(15 downto 12) := std_logic_vector(unsigned(temp(15 downto 12)) + 3);
        end if;

        if(unsigned(temp(11 downto 8)) > 4) then
          temp(11 downto 8) := std_logic_vector(unsigned(temp(11 downto 8)) + 3);
        end if;

        if(unsigned(temp(7 downto 4)) > 4) then
          temp(7 downto 4) := std_logic_vector(unsigned(temp(7 downto 4)) + 3);
        end if;

        if(unsigned(temp(3 downto 0)) > 4) then
          temp(3 downto 0) := std_logic_vector(unsigned(temp(3 downto 0)) + 3);
        end if;
      end if;
    end loop;
    
    Dout <= temp;

  end process;

end struct;


