defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    Regex.scan(~r/([A-Za-z ])\1*/, string)
    |> Enum.map_join(fn([run, c]) -> "#{number_to_string(String.length(run))}#{c}" end)
  end

  defp number_to_string(1), do: ""
  defp number_to_string(num), do: num

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.replace(~r/(\d+)([A-Za-z ])/, string, fn(_, count, char) ->
      String.duplicate(char, String.to_integer(count))
    end)
  end
end
