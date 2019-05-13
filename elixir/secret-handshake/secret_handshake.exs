defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  # Solution 1
  @spec commands(code :: integer) :: list(String.t())
  # def commands(code) do
  #   <<n5::1, n4::1, n3::1, n2::1, n1::1>> = <<code::5>>
  #   secrets = []

  #   secrets =
  #     if n1 == 1 do
  #       secrets ++ ["wink"]
  #     else
  #       secrets
  #     end

  #   secrets =
  #     if n2 == 1 do
  #       secrets ++ ["double blink"]
  #     else
  #       secrets
  #     end

  #   secrets =
  #     if n3 == 1 do
  #       secrets ++ ["close your eyes"]
  #     else
  #       secrets
  #     end

  #   secrets =
  #     if n4 == 1 do
  #       secrets ++ ["jump"]
  #     else
  #       secrets
  #     end

  #   secrets =
  #     if n5 == 1 do
  #       Enum.reverse(secrets)
  #     else
  #       secrets
  #     end

  #   secrets
  # end

  # Solution 2
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    code
    |> Integer.digits(2)
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.reduce([], &append/2)
    |> Enum.reverse()
  end

  defp append({0, _}, acc), do: acc
  defp append({_, 0}, acc), do: ["wink" | acc]
  defp append({_, 1}, acc), do: ["double blink" | acc]
  defp append({_, 2}, acc), do: ["close your eyes" | acc]
  defp append({_, 3}, acc), do: ["jump" | acc]
  defp append({_, 4}, acc), do: Enum.reverse(acc)
  defp append({_, _}, acc), do: acc
end
