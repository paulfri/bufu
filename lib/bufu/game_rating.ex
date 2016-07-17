defmodule Bufu.GameRating do
  @moduledoc """
  Resource representing a game rating.

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-16).
  """

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

  defp schema do
    %__MODULE__{
      rating_board: %Bufu.RatingBoard{},
    }
  end
end
