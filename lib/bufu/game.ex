defmodule Bufu.Game do
  alias Bufu.HTTP

  @derive [Poison.Encoder]

  defstruct [
    :id,
    :name,
    :image,
    :deck,
    :description
  ]

  def get(id), do: get(Bufu.new, id)
  def get(bufu, id) do
    bufu
    |> HTTP.get("game", to_string(id))
    |> parse
  end

  defp parse({:ok, response}) do
    {success, parsed_body} = Poison.decode(response, as: %{"results" => Game})
    {success, parsed_body["results"]}
  end

  defp parse({status, response}) do
    {status, response}
  end
end
