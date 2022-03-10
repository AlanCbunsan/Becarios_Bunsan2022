defmodule FizzBuzz do

def fb(x) when(rem(x, 15) ==0 ), do: IO.puts "FizzBuzz" 
def fb(x) when(rem(x, 5) ==0 ), do: IO.puts "Buzz" 
def fb(x) when(rem(x, 3) ==0 ), do: IO.puts "Fizz" 
def fb(x), do: IO.puts x
end

Enum.each(1..10, fn(x) -> FizzBuzz.fb(x)end)