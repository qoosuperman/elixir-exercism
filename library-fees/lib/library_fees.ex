defmodule LibraryFees do
  def datetime_from_string(string) do
    {_, date} = NaiveDateTime.from_iso8601(string)
    date
  end

  def before_noon?(datetime) do
    time = NaiveDateTime.to_time(datetime)
    result = Time.compare(time, ~T[12:00:00])
    result == :lt
  end

  def return_date(checkout_datetime) do
    days = if before_noon?(checkout_datetime), do: 28, else: 29
    checkout_datetime
    |>NaiveDateTime.add(days*24*60*60, :second)
    |> NaiveDateTime.to_date
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_date = NaiveDateTime.to_date(actual_return_datetime)
    result = Date.diff(actual_return_date, planned_return_date)
    result = if result < 0 do
                0
             else
                result
             end
    result
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week
    |> then(&(&1 == 1))
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    planned_return_date = return_date(checkout_datetime)

    return_datetime = datetime_from_string(return)
    late_days_count  = days_late(planned_return_date, return_datetime)
    if monday?(return_datetime) do
      trunc(rate * late_days_count / 2)
    else
      rate * late_days_count
    end
  end
end
