defmodule Bufu.Accessory do
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
