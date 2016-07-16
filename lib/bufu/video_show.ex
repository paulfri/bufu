defmodule Bufu.VideoShow do
  @type_id  2340
  @singular "video_show"
  @plural   "video_shows"

  defstruct [
    :api_detail_url,
    :deck,
    :id,
    :name,
    :site_detail_url
  ]

  use Bufu.Resource
end
