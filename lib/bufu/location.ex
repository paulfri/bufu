defmodule Bufu.Location do
  @type_id  3035
  @singular "location"
  @plural   "locations"

  defstruct [
    :aliases,
    :api_detail_url,
    :date_added,
    :date_last_updated,
    :deck,
    :description,
    :first_appeared_in_game,
    :id,
    :image,
    :name,
    :site_detail_url
  ]

  use Bufu.Resource


  defp schema do
    %__MODULE__{
      first_appeared_in_game: %Bufu.Game{}
    }
  end
end
