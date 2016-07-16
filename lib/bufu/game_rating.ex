defmodule Bufu.GameRating do
  @type_id  3065
  @singular "game_rating"
  @plural   "game_ratings"

  defstruct [
    :api_detail_url,
    :id,
    :image,
    :name,
    :rating_board
  ]

  use Bufu.Resource
end