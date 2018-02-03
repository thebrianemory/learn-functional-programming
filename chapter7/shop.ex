defmodule Shop do
  def checkout() do
    try do
      {quantity, _} = ask_number("Quantity?")
      {price, _} = ask_number("Price?")
      quantity * price
    rescue
      MatchError -> "It's not a number"
    end
  end
end
