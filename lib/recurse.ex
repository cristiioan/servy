defmodule Recurse do
  def my_map([head | tail], function) do
    [function.(head) | my_map(tail, function)]
  end

  def my_map([], _function), do: []
end

IO.inspect(Recurse.my_map([1, 2, 3, 4, 5], &(&1 * 3)))
