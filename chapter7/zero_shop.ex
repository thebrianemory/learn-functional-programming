defmodule ZeroShop do
  def checkout() do
    result =
      with {quantity, _} <- ask_number("Quantity"),
           {price, _} <- ask_number("Price?"),
           do: quantity * price

    if result == :error, do: IO.puts("It's not a number"), else: result
  end

  def ask_number(message) do
    (message <> "\n")
    |> IO.gets()
    |> Integer.parse()
  end
end
