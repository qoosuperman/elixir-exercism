defmodule Lasagna do
  def expected_minutes_in_oven do
    40
  end

  def remaining_minutes_in_oven(min) do
    expected_minutes_in_oven() - min
  end

  def preparation_time_in_minutes(layer) do
    2 * layer
  end

  def total_time_in_minutes(layer, oven_time) do
    preparation_time_in_minutes(layer) + oven_time
  end

  def alarm do
    "Ding!"
  end
end
