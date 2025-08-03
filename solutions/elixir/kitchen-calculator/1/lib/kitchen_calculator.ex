defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair,1)
  end

  def to_milliliter(volume_pair) do
    cond do
      elem(volume_pair,0)==:cup -> {:milliliter,240.0*elem(volume_pair,1)}
      elem(volume_pair,0)==:milliliter -> {:milliliter,1.0*elem(volume_pair,1)}
      elem(volume_pair,0)==:teaspoon -> {:milliliter,5.0*elem(volume_pair,1)}
      elem(volume_pair,0)==:tablespoon -> {:milliliter,15.0*elem(volume_pair,1)}
      elem(volume_pair,0)==:fluid_ounce -> {:milliliter,30.0*elem(volume_pair,1)}
    end
  end

  def from_milliliter(volume_pair, unit) do
    cond do
      unit==:cup -> {unit,elem(volume_pair,1)/240.0}
      unit==:milliliter -> {unit,elem(volume_pair,1)}
      unit==:teaspoon -> {unit,elem(volume_pair,1)/5.0}
      unit==:tablespoon -> {unit,elem(volume_pair,1)/15.0}
      unit==:fluid_ounce -> {unit,elem(volume_pair,1)/30.0}
    end
  end

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair),unit)
  end
end
