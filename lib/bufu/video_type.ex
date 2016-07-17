defmodule Bufu.VideoType do
  @moduledoc """
  Resource representing a Giant Bomb video show.

  This resource will eventually be retired in favor of the `Bufu.VideoShow`
  resource.

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-46).
  """

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
