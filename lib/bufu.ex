defmodule Bufu do
  use GenServer

  defmodule Config do
    defstruct [:api_key]
  end

  def new() do
    # TODO: Application.get_env
    System.get_env("GIANT_BOMB_API_KEY") |> new
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

  # GenServer callbacks
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
