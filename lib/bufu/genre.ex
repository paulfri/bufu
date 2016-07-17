defmodule Bufu.Genre do
  @moduledoc """
  Resource representing a genre.

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-18).
  """

  @type_id  3060
  @singular "genre"
  @plural   "genres"

  defstruct [
    :api_detail_url,
    :date_added,
    :date_last_updated,
    :deck,
    :description,
    :id,
    :image,
    :name,
    :site_detail_url
  ]

  use Bufu.Resource
end
