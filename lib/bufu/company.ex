defmodule Bufu.Company do
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
end
