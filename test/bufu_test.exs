defmodule BufuTest do
  use ExUnit.Case
  use ExVCR.Mock
  doctest Bufu

  setup_all do
    HTTPotion.start
    :ok
  end

  test "get a game" do
    use_cassette "get_game" do
      {:ok, game} = Bufu.Game.get 30486

      assert is_map(game)
      assert game["name"] == "Persona 5"
    end
  end
end
