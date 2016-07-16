defmodule Bufu.Theme do
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
