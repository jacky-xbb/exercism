defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  # Original
  # @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  # def keep(list, fun) do
  #   list
  #   |> get_filter(fun)
  #   |> do_filter(list, [])
  # end

  # def get_filter(list, fun) do
  #   for x <- list, do: apply(fun, [x])
  # end

  # def do_filter([], [], filtered), do: filtered

  # def do_filter([f_h | filter], [l_h | list], filtered) do
  #   if f_h do
  #     do_filter(filter, list, filtered ++ [l_h])
  #   else
  #     do_filter(filter, list, filtered)
  #   end
  # end

  # Better
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun), do: for(x <- list, fun.(x), do: x)

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  # Original
  # @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  # def discard(list, fun) do
  #   list -- keep(list, fun)
  # end

  # Better
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun), do: for(x <- list, not fun.(x), do: x)
end
