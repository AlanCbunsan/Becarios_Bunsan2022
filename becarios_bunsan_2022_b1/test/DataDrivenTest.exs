defmodule DataDrivenTest do
use ExUnit.Case
data = [
    {1, 3, 4}
    {7, 4, 10},
    {5, 4, 9},
    {3, 3, 6},
    {6, 2, 9}
] 
for {a,b,c} <- data do
 @a a
 @b b
 @c c
 test  "sum of #{@a} and #{@b} should equal #{@c}" do
    assert SUT.sum(@a,@b) == @c
     
   end     
  end
        
end