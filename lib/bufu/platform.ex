defmodule Bufu.Platform do
  @moduledoc """
  Resource representing a game platform, such as a console. Digital distribution
  networks are listed separately for some older platforms.

  See the [official documentation](http://www.giantbomb.com/api/documentation#toc-0-26).
  """

  @type_id  3045
  @singular "platform"
  @plural   "platforms"

  defstruct [
    :abbreviation,
    :api_detail_url,
    :company,
    :date_added,
    :date_last_updated,
    :deck,
    :description,
    :id,
    :image,
    :install_base,
    :name,
    :online_support,
    :original_price,
    :release_date,
    :site_detail_url
  ]

  use Bufu.Resource

  defp schema do
    %__MODULE__{
      company: %Bufu.Company{}
    }
  end
end
