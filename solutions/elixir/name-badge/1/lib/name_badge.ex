defmodule NameBadge do
  def print(id, name, department) do
    if id != nil and name !=nil and department != nil do
      "[#{id}] - " <> name <> " - " <> String.upcase(department)
    else
      "#{if id != nil, do: "[#{id}] - "}" <> name <> " - " <> if department == nil, do: "OWNER", else: String.upcase(department)
    end
  end
end
