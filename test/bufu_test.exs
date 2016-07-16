defmodule BufuTest do
  use ExUnit.Case
  use ExVCR.Mock
  doctest Bufu

  test "get a game" do
    use_cassette "get_game" do
      game = Bufu.Game.get! 30486

      assert is_map(game)
      assert game.name == "Persona 5"
    end
  end
end
