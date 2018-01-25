defmodule FiniteFactorial do
  def of(0), do: 1

  def of(n) when n > 0 do
    1..10
    |> Enum.take(n)
    |> Enum.reduce(&(&1 * &2))
  end
end
