defmodule Exercise.ChapterTwo.Three do
  apply_tax = fn price -> IO.puts "Price: #{price * 1.12} - Tax: #{price * 0.12}" end
end
