defmodule BirdCount do
  def today([]) do
    nil
  end

  def today([head | _]) do
    head
  end

  def increment_day_count([]) do
    [1]
  end

  def increment_day_count([head | tail]) do
    [head + 1 | tail]
  end

  def has_day_without_birds?([]) do
    false
  end
  def has_day_without_birds?(list) do
    Enum.member?(list, 0)
  end

  def total([]) do
    0
  end

  def total(list) do
    Enum.sum(list)
  end

  def busy_days(list) do
    list
    |> Enum.filter(fn x -> x >= 5 end)
    |> length()
  end
end
