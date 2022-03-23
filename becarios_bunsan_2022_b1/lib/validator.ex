defmodule Validator do 
  def  validate_dates(%DateTime {} = edate, %DateTime{} = pdate) do
    d1 = DateTime.to_unix(edate) |> IO.inspect()
    d2 = DateTime.to_unix(pdate) |> IO.inspect()

    cond do 
      d2 - d1 > 259200 ->
        {:error, "ya pasaron mas de 72 horas de su emisión"}

      d2 - d1 > 300 ->
        {:error, "Error"}

        true ->
          :ok        
  end
 end
end 