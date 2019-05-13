defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  defp _to_rna('G'), do: 'C'
  defp _to_rna('C'), do: 'G'
  defp _to_rna('T'), do: 'A'
  defp _to_rna('A'), do: 'U'

  defp _to_rna(dna) do
    Enum.map(dna, fn x ->
      case x do
        ?G -> ?C
        ?C -> ?G
        ?T -> ?A
        ?A -> ?U
      end
    end)
  end

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    _to_rna(dna)
  end
end
