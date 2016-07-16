defmodule Bufu.Promo do
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
