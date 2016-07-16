defmodule Bufu do
  use GenServer

  @version Mix.Project.config[:version]
  def version, do: @version

  defmodule Config do
    defstruct [:api_key]
  end

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
