defmodule Bufu.Resource do
  defmacro __using__(_) do
    quote do
      alias Bufu.HTTP

      @derive [Poison.Encoder]

      # TODO: safe versions (with {:err, reason} return)
      def get!(id, query \\ [], bufu \\ Bufu.new) do
        bufu
        |> HTTP.fetch!(@singular, resource_id(id), add_field_list(query))
        |> parse!(%{"results" => %__MODULE__{}})
      end

      def list!(query \\ [], bufu \\ Bufu.new) do
        bufu
        |> HTTP.fetch!(@plural, add_field_list(query))
        |> parse!(%{"results" => [%__MODULE__{}]})
      end

      defp resource_id(id) do
        to_string(@type_id) <> "-" <> to_string(id)
      end

      defp parse!(response, format) do
        response
        |> Poison.decode!(as: format)
        |> (&(&1["results"])).()
      end

      # adds a query param to limit fields in the response to only those
      # contained in the resource struct. not super necessary, but the API
      # can be kind of slow and this helps a bit
      defp add_field_list(query) do
        fields = Map.keys(%__MODULE__{})
        |> List.delete(:__struct__)
        |> Enum.join(",")

        Keyword.merge(query, field_list: fields)
      end
    end
  end
end
