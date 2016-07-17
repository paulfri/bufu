defmodule Bufu.Review do
  @type_id  1900
  @singular "review"
  @plural   "reviews"

  defstruct [
    :api_detail_url,
    :deck,
    :description,
    :dlc_name,
    :game,
    :id,
    :platforms,
    :publish_date,
    :release,
    :reviewer,
    :score,
    :site_detail_url
  ]

  use Bufu.Resource

  defp schema do
    %__MODULE__{
      game: %Bufu.Game{},
      platforms: [%Bufu.Platform{}],
      release: %Bufu.Release{}
    }
  end
end
