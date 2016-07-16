defmodule Bufu.VideoType do
  @type_id  2320
  @singular "video_type"
  @plural   "video_types"

  defstruct [
    :api_detail_url,
    :deck,
    :id,
    :name,
    :site_detail_url
  ]

  use Bufu.Resource
end
