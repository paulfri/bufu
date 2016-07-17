defmodule Bufu.Promo do
  @moduledoc """
  Resource representing a Giant Bomb site promo slot that appears on the
  homepage.

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-28).
  """

  @type_id  1700
  @singular "promo"
  @plural   "promos"

  defstruct [
    :api_detail_url,
    :date_added,
    :deck,
    :id,
    :image,
    :link,
    :name,
    :resource_type,
    :user
  ]

  use Bufu.Resource
end
