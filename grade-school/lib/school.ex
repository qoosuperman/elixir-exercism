defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t(), integer) :: map
  def add(db, name, grade) do
    if name not in Enum.concat(Map.values(db)) do
      Map.update(db, grade, [name], fn(arr) -> [name | arr] end )
    else
      db
    end
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t()]
  def grade(db, grade) do
    db = for {grade, names} <- db, into: %{}, do: {grade, Enum.sort(names)}
    db
    |> Map.get(grade, [])
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t()]}]
  def sort(db) do
    db = for {grade, names} <- db, into: %{}, do: {grade, Enum.sort(names)}
    db
    |> Map.to_list
  end
end
