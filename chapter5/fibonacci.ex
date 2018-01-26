defmodule Fibonacci do
  def run(num) do
    Stream.unfold({0, 1}, fn {num1, num2} -> {num1, {num2, num1 + num2}} end)
    |> Enum.take(num)
  end
end
