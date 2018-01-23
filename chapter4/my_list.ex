defmodule MyList do
  def max([]), do: nil
  def max([num]), do: num
  def max([a, b | rest]) when a >= b, do: find_max(rest, a)
  def max([a, b | rest]) when a < b, do: find_max(rest, b)

  defp find_max([], max), do: max
  defp find_max([head | rest], max) when max >= head, do: find_max(rest, max)
  defp find_max([head | rest], max) when max < head, do: find_max(rest, head)

  def min([]), do: nil
  def min([num]), do: num
  def min([a, b | rest]) when a <= b, do: find_min(rest, a)
  def min([a, b | rest]) when a > b, do: find_min(rest, b)

  defp find_min([], min), do: min
  defp find_min([head | rest], min) when min <= head, do: find_min(rest, min)
  defp find_min([head | rest], min) when min > head, do: find_min(rest, head)
end
