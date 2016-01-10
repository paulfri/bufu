defmodule Bufu.Game do
  @derive [Poison.Encoder]

  defstruct [
    :id,
    :name,
    :image,
    :deck,
    :description
  ]

  def get(id) do
    get(Bufu.new, id)
  end

  def get(bufu, id) do
    Bufu.HTTP.get(bufu, "game", to_string(id)) |> parse
  end

  defp parse({status, response}) when status == :ok do
    {success, parsed_body} = Poison.decode(response, as: %{"results" => Bufu.Game})
    {success, parsed_body["results"]}
  end

  defp parse({status, response}) do
    {status, response}
  end
end
