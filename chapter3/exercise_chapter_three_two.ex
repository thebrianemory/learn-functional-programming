defmodule Exercise.ChapterThree.Two do
  def print_message(distance, time) do
    average_velocity = distance / time
    IO.puts "Travel distance: #{distance}\nTravel time: #{time}\nAverage velocity: #{average_velocity}"
  end
end
