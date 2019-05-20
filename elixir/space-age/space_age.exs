defmodule SpaceAge do
  @earth_seconds 31_557_600

  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(:earth, seconds), do: seconds / @earth_seconds
  def age_on(:mercury, seconds), do: seconds / @earth_seconds / 0.2408467
  def age_on(:venus, seconds), do: seconds / @earth_seconds / 0.61519726
  def age_on(:mars, seconds), do: seconds / @earth_seconds / 1.8808158
  def age_on(:jupiter, seconds), do: seconds / @earth_seconds / 11.862615
  def age_on(:saturn, seconds), do: seconds / @earth_seconds / 29.447498
  def age_on(:uranus, seconds), do: seconds / @earth_seconds / 84.016846
  def age_on(:neptune, seconds), do: seconds / @earth_seconds / 164.79132

  # def age_on(:mercury, seconds, ratio \\ 0.2408467) do
  #   seconds / @earth_seconds / ratio
  # end
end
