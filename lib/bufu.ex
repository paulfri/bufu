defmodule Bufu do
  @moduledoc """
  Giant Bomb API client library.

  See the [Giant Bomb API documentation](http://www.giantbomb.com/api/) for more
  details on the Giant Bomb API, including terms of use, obtaining an API key,
  and rate limit restrictions.
  """
  use GenServer
  alias Mix.Project

  @version Project.config[:version]
  @doc """
  Returns the current Bufu version.
  """
  def version, do: @version

  defmodule Config do
    @moduledoc false

    defstruct [:api_key]
  end

  @doc """
  Generates a new Bufu client with an inferred API key, from either the Mix
  (application) config or the system environment (`GIANT_BOMB_API_KEY`).

  Raises an error if it cannot infer an API key, as the Giant Bomb API does not
  allow unauthenticated access.
  """
  def new do
    cond do
      key = Application.get_env(:bufu, :api_key) -> key |> new
      key = System.get_env("GIANT_BOMB_API_KEY") -> key |> new
      true -> raise ~s"""
        The Giant Bomb API does not allow unauthenticated access. You must
        provide an API key via the `:api_key` Mix configuration or the
        `GIANT_BOMB_API_KEY` system environment variable.
        """
    end
  end

  @doc """
  Generates a new Bufu client with the given API key. Generally, you will not
  need to use this variant, but it is provided in case you need to support
  multiple clients in the same process (e.g. with a standard API key and a
  premium API key).
  """
  def new(api_key) do
    {:ok, bufu} = start_link(%Config{api_key: api_key})
    bufu
  end

  def config(bufu) do
    GenServer.call(bufu, :get_config)
  end

  def api_key(bufu) do
    config(bufu).api_key
  end

  def init(config) do
    {:ok, config}
  end

  def start_link(config) do
    GenServer.start_link(__MODULE__, config)
  end

  def handle_call(:get_config, _from, config) do
    {:reply, config, config}
  end
end
