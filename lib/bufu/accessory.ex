defmodule Bufu.Accessory do
  @moduledoc """
  Resource representing a video game (hardware) accessory.

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-2).
  """

  @type_id  3000
  @singular "accessory"
  @plural   "accessories"

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
