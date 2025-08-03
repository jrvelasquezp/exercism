defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory,&(&1.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory,fn x -> x.price==nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory,fn x -> Map.update(x,:name,"",fn y -> String.replace(y,old_word,new_word) end) end)
  end

  def increase_quantity(item, count) do
    Map.update(item, :quantity_by_size, %{}, fn x -> Map.new(Enum.map(x, fn {k,v} -> {k,v+count} end)) end) |> IO.inspect()
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size,0,fn {_key,val}, acc->acc+val end)
  end
end
