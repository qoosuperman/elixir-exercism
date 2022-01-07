defmodule LucasNumbers do
  def generate(1) do
    [2]
  end

  def generate(2) do
    [2, 1]
  end

  def generate(n) when is_integer(n) and n > 2 do
    sequence =
      {2, 1}
      |> Stream.iterate(fn {a, b} -> {b, a + b} end)
      |> Stream.map(&elem(&1, 1))
      |> Enum.take(n - 1)
    [2 | sequence]
  end

  def generate(_) do
    raise ArgumentError, "count must be specified as an integer >= 1"
  end
end
