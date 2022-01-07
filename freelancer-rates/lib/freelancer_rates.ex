defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * discount / 100
  end

  def monthly_rate(hourly_rate, discount) do
    real_hourly_rate = apply_discount(hourly_rate, discount)
    ceil(real_hourly_rate * 22 * 8)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    real_hourly_rate = apply_discount(hourly_rate, discount)
    Float.floor(budget / real_hourly_rate / 8, 1)
  end
end
