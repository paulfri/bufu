defmodule Bufu.UserReview do
  @moduledoc """
  Resource representing a Giant Bomb user's review of a game. Editorial reviews
  are represented by a different resource, `Bufu.Review`.

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-42).
  """

  @type_id  2200
  @singular "user_review"
  @plural   "user_reviews"

  defstruct [
    :api_detail_url,
    :date_added,
    :date_last_updated,
    :deck,
    :description,
    :game,
    :id,
    :reviewer,
    :score,
    :site_detail_url
  ]

  use Bufu.Resource

  defp schema do
    %__MODULE__{
      game: %Bufu.Game{}
    }
  end
end
