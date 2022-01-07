defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  # @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace("_", "")
    |> String.replace("-", " ")
    |> String.replace(~r/ +/, " ")
    |> String.split([" "])
    |> Enum.map(fn x -> String.at(x, 0) end)
    |> Enum.map(fn x -> String.upcase(x) end)
    |> Enum.join("")
  end
end
