defmodule Bufu.Theme do
  @moduledoc """
  Resource representing a thematic element of a game.

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-39).
  """

  @type_id  3032
  @singular "theme"
  @plural   "themes"

  defstruct [
    :api_detail_url,
    :id,
    :name,
    :site_detail_url
  ]

  use Bufu.Resource
end
