defmodule Bufu.Object do
  @moduledoc """
  Resource representing an object in a game.

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-22).
  """

  @type_id  3055
  @singular "object"
  @plural   "objects"

  defstruct [
    :aliases,
    :api_detail_url,
    :characters,
    :companies,
    :concepts,
    :date_added,
    :date_last_updated,
    :deck,
    :description,
    :first_appeared_in_game,
    :franchises,
    :games,
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
      companies: [%Bufu.Company{}],
      concepts: [%Bufu.Concept{}],
      first_appeared_in_game: %Bufu.Game{},
      franchises: [%Bufu.Franchise{}],
      games: [%Bufu.Game{}],
      locations: [%Bufu.Location{}],
      objects: [%Bufu.Object{}],
      people: [%Bufu.Person{}]
    }
  end
end
