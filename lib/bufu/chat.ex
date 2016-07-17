defmodule Bufu.Chat do
  @moduledoc """
  Resource representing a Giant Bomb site chat.

  Generally, the API will only return active chats.

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-6).

  There is a separate, [undocumented endpoint](http://www.giantbomb.com/upcoming_json)
  that can be used to view scheduled chats, as well as get the "live" status of
  the chat page.
  """

  @type_id  2450
  @singular "chat"
  @plural   "chats"

  defstruct [
    :api_detail_url,
    :channel_name,
    :deck,
    :id,
    :image,
    :password,
    :site_detail_url,
    :title
  ]

  use Bufu.Resource
end
