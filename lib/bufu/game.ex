defmodule Bufu.Game do
  @singular "game"
  @plural   "games"

  defstruct [
    :id,
    :name,
    :image,
    :deck,
    :description
  ]

  use Bufu.Resource
end
