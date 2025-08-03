defmodule Username do
  def sanitize([]) do
    []
  end
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
    [head | tail]=username
    case head do
      head when head > 96 and head < 123 -> [head | sanitize(tail)]
      head when head == 95 -> [head | sanitize(tail)]
      head when head == 228 -> [97 | [101 | sanitize(tail)]]   
      head when head == 246 -> [111 | [101 | sanitize(tail)]]
      head when head == 252 -> [117 | [101 | sanitize(tail)]]
      head when head == 223 -> [115 | [115 | sanitize(tail)]]
      _ -> sanitize(tail)
    end
  end
end
