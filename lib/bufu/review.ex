defmodule Bufu.Review do
  @moduledoc """
  Resource representing a Giant Bomb editorial game review. User reviews are
  represented by a different resource, `Bufu.UserReview`.

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-36).
  """

  @type_id  1900
  @singular "review"
  @plural   "reviews"

  defstruct [
    :api_detail_url,
    :deck,
    :description,
    :dlc_name,
    :game,
    :id,
    :platforms,
    :publish_date,
    :release,
    :reviewer,
    :score,
    :site_detail_url
  ]

  use Bufu.Resource

  defp schema do
    %__MODULE__{
      game: %Bufu.Game{},
      platforms: [%Bufu.Platform{}],
      release: %Bufu.Release{}
    }
  end
end
