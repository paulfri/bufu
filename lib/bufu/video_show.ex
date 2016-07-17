defmodule Bufu.VideoShow do
  @moduledoc """
  Resource representing a Giant Bomb video show.

  As of 2016-07-16, this resource is not yet active. It will [eventually
  supplant](https://twitter.com/Will_Carle/status/754470870781861888) the
  `Bufu.VideoType` resource.

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-48).
  """

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
