defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(is_nil(&1.price)))
  end

  def increase_quantity(item, count) do
    increased_quantity = item.quantity_by_size
                         |> Enum.map(fn {k, v} -> {k, v+count} end)
                         |> Enum.into(%{})
    %{item | quantity_by_size: increased_quantity}
  end

  def total_quantity(item) do
    item.quantity_by_size
    |> Enum.reduce(0, fn {_, count}, acc -> count + acc end)
  end
end
