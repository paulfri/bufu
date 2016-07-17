defmodule Bufu.Release do
  @moduledoc """
  Resource representing a game release. Games can have many releases, including
  remasters, regional differences, physical or digital, etc.

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-34).
  """

  @type_id  3050
  @singular "release"
  @plural   "releases"

  defstruct [
    :api_detail_url,
    :date_added,
    :date_last_updated,
    :deck,
    :description,
    :developers,
    :expected_release_day,
    :expected_release_month,
    :expected_release_quarter,
    :expected_release_year,
    :game,
    :game_rating,
    :id,
    :image,
    :images,
    :maximum_players,
    :minimum_players,
    :multiplayer_features,
    :name,
    :platform,
    :product_code_type,
    :product_code_value,
    :publishers,
    :region,
    :release_date,
    :resolutions,
    :singleplayer_features,
    :sound_systems,
    :site_detail_url,
    :widescreen_support
  ]

  use Bufu.Resource
end
