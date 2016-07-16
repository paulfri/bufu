defmodule Bufu.Resource do
  defmacro __using__(_) do
    quote do
      alias Bufu.HTTP

      @derive [Poison.Encoder]

      # TODO: safe versions (with {:err, reason} return)
      def get!(id, query \\ [], bufu \\ Bufu.new) do
        bufu
        |> HTTP.fetch!(@endpoint, id, query)
        |> parse!(%{"results" => %__MODULE__{}})
      end

      def list!(query \\ [], bufu \\ Bufu.new) do
        bufu
        |> HTTP.fetch!(@endpoint <> "s", query)
        |> parse!(%{"results" => [%__MODULE__{}]})
      end

      defp parse!(response, format) do
        response
        |> Poison.decode!(as: format)
        |> (&(&1["results"])).()
      end
    end
  end
end