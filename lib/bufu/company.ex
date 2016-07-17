defmodule Bufu.Company do
  @moduledoc """
  Resource representing a video game company (mostly developers and publishers).

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-8).
  """

  @type_id  3010
  @singular "company"
  @plural   "companies"

  defstruct [
    :abbreviation,
    :aliases,
    :api_detail_url,
    :characters,
    :concepts,
    :date_added,
    :date_founded,
    :date_last_updated,
    :deck,
    :description,
    :developed_games,
    :developer_releases,
    :distributor_releases,
    :id,
    :image,
    :location_address,
    :location_city,
    :location_country,
    :location_state,
    :locations,
    :name,
    :objects,
    :people,
    :phone,
    :published_games,
    :publisher_releases,
    :site_detail_url,
    :website
  ]

  use Bufu.Resource

  defp schema do
    %__MODULE__{
      characters: [%Bufu.Character{}],
      concepts: [%Bufu.Concept{}],
      developed_games: [%Bufu.Game{}],
      developer_releases: [%Bufu.Release{}],
      distributor_releases: [%Bufu.Release{}],
      locations: [%Bufu.Location{}],
      objects: [%Bufu.Person{}],
      people: [%Bufu.Person{}],
      published_games: [%Bufu.Game{}],
      publisher_releases: [%Bufu.Release{}],
    }
  end
end
