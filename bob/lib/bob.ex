defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input = rm_special_charaters(input)
    cond do
      String.trim(input) == "" -> "Fine. Be that way!"
      is_question?(input) and input |> rm_capitals_and_numbers |> only_question_left? -> "Calm down, I know what I'm doing!"
      input |> rm_capitals_and_numbers |> only_bang_left? -> "Whoa, chill out!"
      is_question?(input) and not multiple_lines?(input) -> "Sure."
      true -> "Whatever."
    end
  end

  defp rm_special_charaters(input) do
    String.replace(input, ~r/[\"\:",\'%\^\*@\#\$\(\)]/, "")
  end

  defp rm_capitals_and_numbers(input) do
    input
    |> String.replace(~r/[A-Z\d ]/, "")
  end

  defp only_bang_left?(input) do
    String.length(String.replace(input, ~r/\!/, "")) == 0
  end

  defp only_question_left?(input) do
    String.length(String.replace(input, ~r/\?/, "")) == 0
  end

  # defp only_capitals_and_numbers?(input) do
  #   length_after_replace = input
  #                           |> String.replace(~r/[A-Z\d ]/, "")
  #                           |> String.length
  #   length_after_replace == 0
  # end

  defp multiple_lines?(input) do
    String.match?(input,  ~r/\n/)
  end

  defp is_question?(input) do
    String.match?(input, ~r/[A-Za-z\d]+\?/)
  end
end
