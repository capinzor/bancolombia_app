defmodule ListOperations do
  def my_map(list, function) do
    exec_my_map(list, function, [])
  end

  defp exec_my_map([], _function, res) do res end
  defp exec_my_map([h|t], function, res) do
    exec_my_map(t, function, res ++ [function.(h)])
  end

  def my_filter(list, condition) do
    exec_my_filter(list, condition, [])
  end

  defp exec_my_filter([], _condition, res) do res end
  defp exec_my_filter([h|t], condition, res) do
    case condition.(h) do
      true-> exec_my_filter(t, condition, res ++ [h])
      false -> exec_my_filter(t, condition, res)
    end

  end

  def acum(list) do
    exec_acum(list,[])
  end

  defp exec_acum([], res) do res end
  defp exec_acum([h|t], res) do
    exec_acum(Enum.sum([t]), res ++ [h])
  end
end
