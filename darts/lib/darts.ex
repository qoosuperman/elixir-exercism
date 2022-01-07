defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({x, y}) do
    result = :math.pow(x,2) + :math.pow(y,2)
    result = :math.sqrt(result)
    cond do
      result <= 1 -> 10
      result <= 5 -> 5
      result <= 10 -> 1
      true -> 0
    end
  end
end
