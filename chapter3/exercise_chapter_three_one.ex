defmodule Exercise.ChapterThree.One do
  def calculate_price(list, total_price \\ 0)

  def calculate_price([], total_price), do: total_price

  def calculate_price([[_, quantity, price] | rest], total_price) do
    item_total_price = quantity * price
    new_total_price = total_price + item_total_price
    calculate_price(rest, new_total_price)
  end
end
