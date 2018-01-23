defmodule Navigator do
  def navigate(dir) do
    expanded_dir = Path.expand(dir)
    go_trough([expanded_dir])
  end

  defp go_trough([]), do: nil

  defp go_trough([content | rest]) do
    print_and_navigate(content, File.dir?(content))
    go_trough(rest)
  end

  defp print_and_navigate(_dir, false), do: nil

  defp print_and_navigate(dir, true) do
    IO.puts(dir)
    children_dirs = File.ls!(dir)
    go_trough(expand_dirs(children_dirs, dir))
  end

  defp expand_dirs([], _relative_to), do: []

  defp expand_dirs([dir | dirs], relative_to) do
    expanded_dir = Path.expand(dir, relative_to)
    [expanded_dir | expand_dirs(dirs, relative_to)]
  end
end
