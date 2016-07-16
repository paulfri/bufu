defmodule Bufu.Game do
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
    |> Bufu.HTTP.get("game", to_string(id))
    |> parse
  end

  defp parse({:ok, response}) do
    {success, parsed_body} = Poison.decode(response, as: %{"results" => Bufu.Game})
    {success, parsed_body["results"]}
  end

  defp parse({status, response}) do
    {status, response}
  end
end
