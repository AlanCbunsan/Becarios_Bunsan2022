defmodule AplhabetCipher.Coder do
    def abc() do
    'abcdefghijklmnopqrstuvwxyz' |> Enum.with_index
 end

def encode(keyword, message)do
 keyword = keyword
 |> String.downcase()
 |> String.duplicate(div(String.length(message), String.length(keyword))+1)
 |> to_charlist()

 message = message
 |> String.downcase()
 |> to_charlist()

Enum.zip_with(message, keyword, fn(m,k) ->
 {_ , mindx} = List.keyfind!(abc(), m, 0)
 {_ , kindx} = List.keyfind!(abc(), k, 0)
cond do
 mindx + kindx >= length(abc()) ->
 {char, _} = List.keyfind(abc(), mindx + kindx - length(abc)), 1)
 char
true ->
 {char, _} = List.keyfind(abc(), mindx + kindx, 1)
 char
 end
 end) |> to_String()

end

def decode(keyword, message)do
 keyword = keyword
 |> String.downcase()
 |> String.duplicate(div(String.length(message), String.length(keyword))+1)
 |> to_charlist()
 message = message 
 |> String.downcase()
 |> to_charlist()

Enum.zip_with(message, keyword, fn(m,k) -> 
 {_ , mindx} = List.keyfind!(abc(),m,0)
 {_ , kindx} = List.keyfind!(abc(),k,0)
cond do
 mindx - kindx < 0 ->
 {char, _} = List.keyfind(abc(), mindx + length(abc()) - kindx, 1)
 char
 true ->
 {char, _} = List.keyfind(abc(), mindx - kindx, 1)
 char
  end
 end) |> to_String()
end

 def decipher(cipher, message) do
 cipherC = cipher
 |> String.downcase()
 |> to_charlist()

 Enum.zip_with(messageC, cipherC, fn(m,c) -> 
 {_ , mindx} = List.keyfind!(abc(),m,0)
 {_ , cindx} = List.keyfind!(abc(),c,0)
 cond do
 cindx - mind < 0 ->
 {char, _} List.keyfind(abc(), cindx + length(abc()) - mindx, 1)
 char
 true -> 
 {char, _} = List.keyfind(abc(), cindx - mindx, 1)
 char
  end
 end) |> Enum.reduce("", fn(x,acc) ->
 cond do
 String.length(acc) == 0 ->
 acc <> to_string([x])
 encode(acc, message) == cipher ->
 acc
 true ->
acc <> to_string([x])
  end
 end)

end
end