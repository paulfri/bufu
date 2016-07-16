defmodule Bufu.Character do
  @type_id  3005
  @singular "character"
  @plural   "characters"

  defstruct [
    :aliases,
    :api_detail_url,
    :birthday,
    :concepts,
    :date_added,
    :date_last_updated,
    :deck,
    :description,
    :enemies,
    :first_appeared_in_game,
    :franchises,
    :friends,
    :games,
    :gender,
    :id,
    :image,
    :last_name,
    :locations,
    :name,
    :objects,
    :people,
    :real_name,
    :site_detail_url
  ]

  use Bufu.Resource
end
