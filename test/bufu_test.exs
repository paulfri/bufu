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

  test "get list of games" do
    use_cassette "get_games" do
      games = Bufu.Game.list!
      [first | _] = games

      assert is_list(games)
      assert is_map(first)
      assert first.name == "Desert Strike: Return to the Gulf"
      assert length(games) == 100
    end
  end
end
