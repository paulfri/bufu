defmodule Bufu.Person do
  @moduledoc """
  Resource representing a (real) person credited in a game. Includes developers,
  artists, musicians, executives, etc.

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-24).
  """

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

  defp schema do
    %__MODULE__{
      characters: [%Bufu.Character{}],
      concepts: [%Bufu.Concept{}],
      first_credited_game: %Bufu.Game{},
      franchises: [%Bufu.Franchise{}],
      games: [%Bufu.Game{}],
      locations: [%Bufu.Location{}],
      objects: [%Bufu.Object{}],
      people: [%Bufu.Person{}]
    }
  end
end
