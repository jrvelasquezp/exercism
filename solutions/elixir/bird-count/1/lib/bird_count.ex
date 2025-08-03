defmodule BirdCount do
  def today(list) do
    List.first(list)
  end

  def increment_day_count(list) do
    cond do
      today(list)===nil -> [1]
      true -> List.update_at(list, 0, &(&1 + 1))
    end
  end

  def has_day_without_birds?([]) do
    false
  end

  def has_day_without_birds?([head | tail]) do
    head==0 or has_day_without_birds?(tail)
  end

  def total([]) do
    0
  end

  def total([head | tail]) do
    head+total(tail)
  end

  def busy_days([]) do
    0
  end

  def busy_days([head | tail]) do
    cond do
      head>=5 -> busy_days(tail)+1
      true -> busy_days(tail)
    end
  end
end
