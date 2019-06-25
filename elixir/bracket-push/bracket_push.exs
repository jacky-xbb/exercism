defmodule BracketPush do
  @left ["[", "{", "("]
  @right ["]", "}", ")"]
  @matchs %{"[": "]", "(": ")", "{": "}"}
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str
    |> String.graphemes()
    |> bracket_match?([])
  end

  defp bracket_match?([], stack) do
    # All match when stack is empty. stack holds only the left brackets and braces. It will
    # be poped when meets the matched one.
    stack == []
  end

  defp bracket_match?([h_str | t_str], []) do
    cond do
      h_str in @left -> bracket_match?(t_str, [h_str])
      true -> bracket_match?(t_str, [])
    end
  end

  defp bracket_match?([h_str | t_str], [h_stack | t_stack] = stack) do
    cond do
      h_str in @left ->
        bracket_match?(t_str, [h_str | stack])
      h_str in @right and h_str == Map.get(@matchs, String.to_atom(h_stack)) ->
        bracket_match?(t_str, t_stack)
      h_str in @right and h_str != Map.get(@matchs, String.to_atom(h_stack)) ->
        false
      true ->
        bracket_match?(t_str, stack)
    end
  end
end
