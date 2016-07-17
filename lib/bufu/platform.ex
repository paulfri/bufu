defmodule Bufu.Platform do
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
