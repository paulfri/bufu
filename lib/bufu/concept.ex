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

  defp schema do
    %__MODULE__{
      characters: [%Bufu.Character{}],
      concepts: [%Bufu.Concept{}],
      first_appeared_in_franchise: %Bufu.Franchise{},
      first_appeared_in_game: %Bufu.Game{},
      franchises: [%Bufu.Franchise{}],
      games: [%Bufu.Game{}],
      locations: [%Bufu.Location{}],
      objects: [%Bufu.Object{}],
      people: [%Bufu.Person{}],
      related_concepts: [%Bufu.Concept{}]
    }
  end
end
