defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new() do
    %RemoteControlCar{nickname: "none"}
  end

  def new(nickname) do
    %{new() | nickname: nickname }
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: distance}) do
    "#{distance} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: 0}) do
    "Battery empty"
  end
  def display_battery(%RemoteControlCar{battery_percentage: percentage}) do
    "Battery at #{percentage}%"
  end

  def drive(car = %RemoteControlCar{battery_percentage: 0}) do
    car
  end
  def drive(car = %RemoteControlCar{battery_percentage: percentage, distance_driven_in_meters: distance}) do
    %{car | battery_percentage: percentage - 1, distance_driven_in_meters: distance + 20 }
  end
end
