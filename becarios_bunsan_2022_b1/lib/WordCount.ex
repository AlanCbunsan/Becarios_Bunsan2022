defmodule WordCount do

  def conteo(docu)do
    {:ok, text} = File.read(docu)
    map(text |> borrar())
  end

  def borrar(text) do
    text |> String.downcase()
    |> String.replace(~r/@|#|%|&|:|_|!|,|./u, " ") #sustituye los iconos por espacios
    |> String.split()
  end

  def map(text)do
    Enum.reduce(text,%{}, fn(text,acc) ->
      Map.update(acc, text, 1, fn x -> x+1 end)
    end)
  end
end