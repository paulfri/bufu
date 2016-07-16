defmodule Bufu.Person do
  @type_id  3040
  @singular "person"
  @plural   "people"

  defstruct [
    :aliases,
    :api_detail_url,
    :birth_date,
    :characters,
    :concepts,
    :country,
    :date_added,
    :date_last_updated,
    :death_date,
    :deck,
    :description,
    :first_credited_game,
    :franchises,
    :games,
    :gender,
    :hometown,
    :id,
    :image,
    :locations,
    :name,
    :objects,
    :people,
    :site_detail_url
  ]

  use Bufu.Resource
end
