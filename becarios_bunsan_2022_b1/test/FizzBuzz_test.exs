defmodule FizzBuzzTest do
   use ExUnit.case 
     
   test "prueba FizzBuzz del 1 al 100" do
     assert FizzBuzz.fb(15) == "FizzBuzz"
        
end
    
end