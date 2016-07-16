defmodule Bufu.Video do
  @type_id  2300
  @singular "video"
  @plural   "videos"

  defstruct [
    :api_detail_url,
    :deck,
    :hd_url,
    :high_url,
    :low_url,
    :embed_player,
    :id,
    :image,
    :length_seconds,
    :name,
    :publish_date,
    :site_detail_url,
    :url,
    :user,
    :youtube_id
  ]

  use Bufu.Resource
end
