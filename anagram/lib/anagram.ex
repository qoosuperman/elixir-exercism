defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, fn(x) -> anagram?(base, x) end)
  end

  defp anagram?(string_a, string_b) do
    a = String.downcase(string_a)
    b = String.downcase(string_b)
    (a != b) && split_and_sort(a) == split_and_sort(b)
  end

  defp split_and_sort(string) do
    string
    |> String.split("")
    |> Enum.sort
  end
end
