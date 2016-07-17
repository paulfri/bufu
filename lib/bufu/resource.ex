# The `Bufu.Resource` macro defines functions for retrieving and decoding data
# from API responses based on the `schema/0` function that should be overridden
# in the including resource module.
defmodule Bufu.Resource do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      alias Bufu.HTTP

      @doc """
      Retrieve a resource by passing in a previously-loaded `resource` of the
      same type.

      This is most useful when retrieving details of a partially-loaded
      resource returned by the API.

      The resource must have a valid `id` key for details to be
      loaded.  Some resource types (specifically, `Bufu.Resource.Chat`,
      `Bufu.Resource.Review` and `Bufu.Resource.UserReview`) do not pass back
      their `id` attributes from the API, and therefore can't be retrieved or
      refreshed by this method.

      ## Examples

          Bufu.Game.get(1) |> Map.get(:similar_games) |> hd |> Bufu.Game.load
          {:ok, %{Bufu.Game ...}
      """
      def load(%__MODULE__{} = resource, bufu \\ Bufu.new), do: get(resource.id, bufu)

      @doc """
      Retrieve a resource by passing in a previously-loaded `resource` of the
      same type. Raises an exception upon error.

      See `load/2`.
      """
      def load!(%__MODULE__{} = resource, bufu \\ Bufu.new), do: get!(resource.id, bufu)

      @doc """
      Retrieves the resource by `id`.

      All options passed to `query` are appended to the query string. See the
      [Giant Bomb API documentation](http://www.giantbomb.com/api/documentation)
      for available options.
      """
      def get(id, query \\ [], bufu \\ Bufu.new) do
        case id do
          nil -> {:err, "Can't fetch resource without ID"}
          _   ->
            bufu
            |> HTTP.fetch(@singular, resource_id(id), query)
            |> parse(%{"results" => schema})
        end
      end

      @doc """
      Retrieves the resource by `id`. Throws an exception upon error.

      See `get/3`.
      """
      def get!(id, query \\ [], bufu \\ Bufu.new) do
        case id do
          nil -> raise "Can't fetch resource without ID"
          _   ->
            bufu
            |> HTTP.fetch!(@singular, resource_id(id), query)
            |> parse!(%{"results" => schema})
        end
      end

      @doc """
      Lists the resource.

      All options passed to `query` are appended to the query string. See the
      [Giant Bomb API documentation](http://www.giantbomb.com/api/documentation)
      for available options.
      """
      def list(query \\ [], bufu \\ Bufu.new) do
        bufu
        |> HTTP.fetch(@plural, query)
        |> parse(%{"results" => [schema]})
      end

      @doc """
      Lists the resource. Throws an exception upon error.

      See `list/2`.
      """
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

      # `schema/0` should be overridden in each resource module to identify
      # which keys in the API response should be decoded as resources
      defp schema do
        %__MODULE__{}
      end

      defoverridable [schema: 0]
    end
  end
end
