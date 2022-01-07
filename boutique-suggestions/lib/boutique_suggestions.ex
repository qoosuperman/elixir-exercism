defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    maximum_price = Keyword.get(options, :maximum_price, 100)

    for x <- tops,
        y <- bottoms,
        x.base_color != y.base_color,
        maximum_price > x.price + y.price do
        { x, y }
    end
  end
end
