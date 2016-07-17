defmodule Bufu.Region do
  @moduledoc """
  Resource representing a release region (e.g., the United States).

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-32).
  """

  @type_id  3075
  @singular "region"
  @plural   "regions"

  defstruct [
    :api_detail_url,
    :date_added,
    :date_last_updated,
    :deck,
    :description,
    :id,
    :image,
    :name,
    :rating_boards,
    :site_detail_url
  ]

  use Bufu.Resource

  defp schema do
    %__MODULE__{
      rating_boards: [%Bufu.RatingBoard{}]
    }
  end
end
