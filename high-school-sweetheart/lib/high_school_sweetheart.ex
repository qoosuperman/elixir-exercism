defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim
    |> String.at(0)
  end

  def initial(name) do
    first_string = name
    |> first_letter
    |> String.upcase

    first_string <> "."
  end

  def initials(full_name) do
    full_name
    |> String.split
    |> Enum.map(&(initial(&1)))
    |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    string = "#{initials(full_name1)}  +  #{initials(full_name2)}"
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{string}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
