defmodule Bufu.Concept do
  @type_id  3015
  @singular "concept"
  @plural   "concepts"

  defstruct [
    :aliases,
    :api_detail_url,
    :characters,
    :concepts,
    :date_added,
    :date_last_updated,
    :deck,
    :description,
    :first_appeared_in_franchise,
    :first_appeared_in_game,
    :franchises,
    :games,
    :id,
    :image,
    :locations,
    :name,
    :objects,
    :people,
    :related_concepts,
    :site_detail_url
  ]

  use Bufu.Resource
end
