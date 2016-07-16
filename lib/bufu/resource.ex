defmodule Bufu.Resource do
  defmacro __using__(_) do
    quote do
      alias Bufu.HTTP

      @derive [Poison.Encoder]

      # TODO: safe version (with {:err, reason} return)
      def get!(id, bufu \\ Bufu.new) do
        bufu
        |> HTTP.get!(@endpoint, id)
        |> parse!
      end

      defp parse!(response) do
        response
        |> Poison.decode!(as: %{"results" => %__MODULE__{}})
        |> (&(&1["results"])).()
      end
    end
  end
end
