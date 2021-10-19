defmodule CountList do
  def count(list)do
    count(list,0)
  end

  defp count([],n), do: n
  defp count([h|t],n), do: count(t,n + 1)
end
