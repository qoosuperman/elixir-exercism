defmodule ResistorColorDuo do
  @colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    [color_a, color_b | _] = colors
    [color_a, color_b]
    |> Enum.map(fn x -> @colors[x] end)
    |> Enum.join("")
    |> String.to_integer
  end
end
