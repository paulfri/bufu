defmodule Bufu.Chat do
  @type_id  2450
  @singular "chat"
  @plural   "chats"

  defstruct [
    :api_detail_url,
    :channel_name,
    :deck,
    :image,
    :password,
    :site_detail_url,
    :title
  ]

  use Bufu.Resource
end
