defmodule Bufu.Game do
  @type_id  3030
  @singular "game"
  @plural   "games"

  defstruct [
    :aliases,
    :api_detail_url,
    :characters,
    :concepts,
    :date_added,
    :date_last_updated,
    :deck,
    :description,
    :developers,
    :expected_release_day,
    :expected_release_month,
    :expected_release_quarter,
    :expected_release_year,
    :first_appearance_characters,
    :first_appearance_concepts,
    :first_appearance_locations,
    :first_appearance_objects,
    :first_appearance_people,
    :franchises,
    :genres,
    :id,
    :image,
    :images,
    :killed_characters,
    :locations,
    :name,
    :number_of_user_reviews,
    :objects,
    :original_game_rating,
    :original_release_date,
    :people,
    :platforms,
    :publishers,
    :releases,
    :reviews,
    :similar_games,
    :site_detail_url,
    :themes,
    :videos
  ]

  use Bufu.Resource

  defp schema do
    %__MODULE__{
      characters: [%Bufu.Character{}],
      concepts: [%Bufu.Concept{}],
      developers: [%Bufu.Company{}],
      first_appearance_characters: [%Bufu.Character{}],
      first_appearance_concepts: [%Bufu.Concept{}],
      first_appearance_locations: [%Bufu.Location{}],
      first_appearance_objects: [%Bufu.Person{}],
      first_appearance_people: [%Bufu.Person{}],
      franchises: [%Bufu.Franchise{}],
      genres: [%Bufu.Genre{}],
      killed_characters: [%Bufu.Character{}],
      locations: [%Bufu.Location{}],
      objects: [%Bufu.Person{}],
      original_game_rating: [%Bufu.GameRating{}],
      people: [%Bufu.Person{}],
      platforms: [%Bufu.Platform{}],
      publishers: [%Bufu.Company{}],
      releases: [%Bufu.Release{}],
      reviews: [%Bufu.Review{}],
      similar_games: [%Bufu.Game{}],
      themes: [%Bufu.Theme{}],
      videos: [%Bufu.Video{}]
    }
  end
end
