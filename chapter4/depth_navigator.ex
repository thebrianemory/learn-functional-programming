defmodule DepthNavigator do
  @max_depth 2

  def navigate(dir) do
    expanded_dir = Path.expand(dir)
    go_trough([expanded_dir], 0)
  end

  defp go_trough([], _current_depth), do: nil
  defp go_trough(_dirs, current_depth) when current_depth > @max_depth, do: nil

  defp go_trough([content | rest], current_depth) do
    print_and_navigate(content, File.dir?(content), current_depth)
    go_trough(rest, current_depth)
  end

  defp print_and_navigate(_dir, false, _current_depth), do: nil

  defp print_and_navigate(dir, true, current_depth) do
    IO.puts(dir)
    children_dirs = File.ls!(dir)
    go_trough(expand_dirs(children_dirs, dir), current_depth + 1)
  end

  defp expand_dirs([], _relative_to), do: []

  defp expand_dirs([dir | dirs], relative_to) do
    expanded_dir = Path.expand(dir, relative_to)
    [expanded_dir | expand_dirs(dirs, relative_to)]
  end
end
