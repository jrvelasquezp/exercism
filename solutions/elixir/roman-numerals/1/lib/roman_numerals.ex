defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    case number do
      number when number >= 1000 -> "M" <> numeral(number-1000)
      number when number + 100 >= 1000 -> "C" <> numeral(number+100)
      number when number >= 500 -> "D" <> numeral(number-500)
      number when number + 100 >= 500 -> "C" <> numeral(number+100)
      number when number >= 100 -> "C" <> numeral(number-100)
      number when number + 10 >= 100 -> "X" <> numeral(number+10)
      number when number >= 50 -> "L" <> numeral(number-50)
      number when number + 10 >= 50 -> "X" <> numeral(number+10)
      number when number >= 10 -> "X" <> numeral(number-10)
      number when number + 1 >= 10 -> "I" <> numeral(number+1)
      number when number >= 5 -> "V" <> numeral(number-5)
      number when number + 1 >= 5 -> "I" <> numeral(number+1)
      number when number >= 1 -> "I" <> numeral(number-1)
      number when number == 0 -> ""
    end
  end
end
