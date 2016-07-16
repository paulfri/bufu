defmodule Bufu.UserReview do
  @type_id  2200
  @singular "user_review"
  @plural   "user_reviews"

  defstruct [
    :api_detail_url,
    :date_added,
    :date_last_updated,
    :deck,
    :description,
    :game,
    :reviewer,
    :score,
    :site_detail_url
  ]

  use Bufu.Resource
end
