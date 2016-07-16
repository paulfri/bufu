defmodule Bufu.Game do
  @endpoint "game"

  defstruct [
    :id,
    :name,
    :image,
    :deck,
    :description
  ]

  use Bufu.Resource
end
