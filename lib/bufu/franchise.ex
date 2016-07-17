defmodule Bufu.Franchise do
  @moduledoc """
  Resource representing a game franchise.

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-12).
  """

  @type_id  3025
  @singular "franchise"
  @plural   "franchises"

  defstruct [
    :aliases,
    :api_detail_url,
    :characters,
    :concepts,
    :date_added,
    :date_last_updated,
    :deck,
    :description,
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
      concepts: [%Bufu.Concept{}],
      games: [%Bufu.Game{}],
      locations: [%Bufu.Location{}],
      objects: [%Bufu.Object{}],
      people: [%Bufu.Person{}]
    }
  end
end
