defmodule TopSecret do
  def to_ast(string) do
    {_,ast} = Code.string_to_quoted(string)
    ast
  end

  def decode_secret_message_part(ast, acc) do
    {operator, _, list} = ast
    if (operator == :def) || (operator == :defp) do
      arity = List.first(list) |> elem(2) |> length
      function_name = cond do
                        arity == 0 -> ""
                        true -> List.first(list) |> elem(0) |> Atom.to_string |> String.slice(0..arity - 1)
                      end
      {ast, [function_name | acc]}
    else
      {ast, acc}
    end
  end

  def decode_secret_message(string) do
    # Please implement the decode_secret_message/1 function
  end
end
