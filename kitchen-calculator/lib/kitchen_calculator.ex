defmodule KitchenCalculator do
  def get_volume({_, vol}) do
    vol
  end

  def to_milliliter({:milliliter, vol}) do
    {:milliliter, vol}
  end

  def to_milliliter({:cup, vol}) do
    {:milliliter, vol * 240}
  end

  def to_milliliter({:fluid_ounce, vol}) do
    {:milliliter, vol * 30}
  end

  def to_milliliter({:teaspoon, vol}) do
    {:milliliter, vol * 5}
  end

  def to_milliliter({:tablespoon, vol}) do
    {:milliliter, vol * 15}
  end

  def from_milliliter({_, vol}, :milliliter) do
    {:milliliter, vol}
  end

  def from_milliliter({_, vol}, unit = :cup) do
    {unit, vol / 240}
  end

  def from_milliliter({_, vol}, unit = :fluid_ounce) do
    {unit, vol / 30}
  end

  def from_milliliter({_, vol}, unit = :teaspoon) do
    {unit, vol / 5}
  end

  def from_milliliter({_, vol}, unit = :tablespoon) do
    {unit, vol / 15}
  end

  @spec convert(
          {:cup, number}
          | {:fluid_ounce, number}
          | {:milliliter, any}
          | {:tablespoon, number}
          | {:teaspoon, number},
          :cup | :fluid_ounce | :milliliter | :tablespoon | :teaspoon
        ) ::
          {:cup, float}
          | {:fluid_ounce, float}
          | {:milliliter, any}
          | {:tablespoon, float}
          | {:teaspoon, float}
  def convert(volume_pair, unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(unit)
  end
end
