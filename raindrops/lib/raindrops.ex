defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(num) when is_integer(num) do
    {num, ""}
    |> handle_3_factor
    |> handle_5_factor
    |> handle_7_factor
    |> trans_to_string
  end

  defp handle_3_factor({num, string}) when rem(num, 3) == 0, do: {num, string <> "Pling"}
  defp handle_3_factor({num, string}), do: {num, string}

  defp handle_5_factor({num, string}) when rem(num, 5) == 0, do: {num, string <> "Plang"}
  defp handle_5_factor({num, string}), do: {num, string}

  defp handle_7_factor({num, string}) when rem(num, 7) == 0, do: {num, string <> "Plong"}
  defp handle_7_factor({num, string}), do: {num, string}

  defp trans_to_string({num, string}) when string == "", do: Integer.to_string(num)
  defp trans_to_string({_num, string}), do: string
end
