defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) when size > 0 do
    end_index = String.length(s) - size
    cond do
      end_index >= 0 ->
        for n <- 0..end_index do
          String.slice(s, n ,size)
        end
      true -> []
    end
  end
  def slices(_s, _size), do: []
end
