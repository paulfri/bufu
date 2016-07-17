defmodule Bufu.RatingBoard do
  @type_id  3070
  @singular "rating_board"
  @plural   "rating_boards"

  defstruct [
    :api_detail_url,
    :date_added,
    :date_last_updated,
    :deck,
    :description,
    :id,
    :image,
    :name,
    :region,
    :site_detail_url
  ]

  use Bufu.Resource

  defp schema do
    %__MODULE__{
      region: %Bufu.Region{}
    }
  end
end
