defmodule Bufu.Review do
  @type_id  1900
  @singular "review"
  @plural   "reviews"

  defstruct [
    :api_detail_url,
    :deck,
    :description,
    :dlc_name,
    :game,
    :platforms,
    :publish_date,
    :release,
    :reviewer,
    :score,
    :site_detail_url
  ]

  use Bufu.Resource
end
