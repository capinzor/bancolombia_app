defmodule AdventOfCode do

  def get_basement(instructions) do
    instructions
    |> String.split("", trim: true)
    |> follow_instructions()
  end
  def get_floor(instructions) do
    instructions
    |> String.split("")
    |> Enum.map(fn
      "(" -> 1
      ")" -> -1
      _ -> 0
    end)
    |> Enum.sum()

  end

  def find_basement (instructions) do
    instructions
    |> String.graphemes()
    |> Enum.map(fn
      "(" -> 1
      ")" -> -1
      _ -> 0
    end)
  end

  defp eval("(") do 1 end
  defp eval(")") do -1 end
  defp eval("_") do 0 end

  defp follow_instructions(list) do
    follow_instructions(list, {0,0})
  end

  defp follow_instructions([],res), do: res
  defp follow_instructions(_list, {_index,-1}=res), do: res

  defp follow_instructions([h|t], {index,floor}) do
    follow_instructions(t, {index+1, floor + eval(h)})
  end

end
