defmodule EnchanterShop do
  def test_data do
    [
      %{title: "Longsword", price: 50, magic: false},
      %{title: "Healing potion", price: 60, magic: true},
      %{title: "Rope", price: 10, magic: false},
      %{title: "Dragon's Spear", price: 100, magic: true}
    ]
  end

  @enchanter_name "Brian"

  def enchant_for_sale([]), do: []

  def enchant_for_sale(items) do
    items
    |> Enum.filter(&(&1.magic == false))
    |> Enum.map(&%{title: "#{@enchanter_name}'s #{&1.title}, price #{&1.price * 3}, magic: true"})
  end
end
