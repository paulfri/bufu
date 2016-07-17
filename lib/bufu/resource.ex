defmodule Bufu.Resource do
  defmacro __using__(_) do
    quote do
      alias Bufu.HTTP

      def get(%__MODULE__{} = resource), do: get(resource.id)
      def get(id, query \\ [], bufu \\ Bufu.new) do
        case id do
          nil -> {:err, "Can't fetch resource without ID"}
          _   ->
            bufu
            |> HTTP.fetch(@singular, resource_id(id), query)
            |> parse(%{"results" => schema})
        end
      end

      def get!(%__MODULE__{} = resource), do: get!(resource.id)
      def get!(id, query \\ [], bufu \\ Bufu.new) do
        case id do
          nil -> raise "Can't fetch resource without ID"
          _   ->
            bufu
            |> HTTP.fetch!(@singular, resource_id(id), query)
            |> parse!(%{"results" => schema})
        end
      end

      def list(query \\ [], bufu \\ Bufu.new) do
        bufu
        |> HTTP.fetch(@plural, query)
        |> parse(%{"results" => [schema]})
      end

      def list!(query \\ [], bufu \\ Bufu.new) do
        bufu
        |> HTTP.fetch!(@plural, query)
        |> parse!(%{"results" => [schema]})
      end

      defp resource_id(id) do
        to_string(@type_id) <> "-" <> to_string(id)
      end

      defp parse({:err, message}, _format), do: {:err, message}
      defp parse({:ok, response}, format) do
        try do
          {:ok, parse!(response, format)}
        rescue
          e in SyntaxError -> {:err, e.message}
        end
      end

      defp parse!(response, format) do
        response
        |> Poison.decode!(as: format)
        |> (&(&1["results"])).()
      end

      defp schema do
        %__MODULE__{}
      end

      defoverridable [schema: 0]
    end
  end
end
