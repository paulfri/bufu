# Bufu

Giant Bomb API client for Elixir ([Shadow Teddie-approved](https://youtu.be/C2n0T_2SM_4?t=3m52s)). Not useful yet.

## Usage

Response keys and error messages all map to those in the [API documentation](http://www.giantbomb.com/api/documentation).

```elixir
bufu = Bufu.new(api_key)
Bufu.Game.get(bufu, 8825)
# => {:ok, %Bufu.Game{...}}
Bufu.Game.get(bufu, 0)
# => {:err, "Object Not Found"}
```

You can also use a default API key in the Mix config (application environment) or system environment.

```elixir
config :bufu, :api_key, "abc123"
System.put_env("GIANT_BOMB_API_KEY", "abc123")
```

## TODO

1. extract game to generic resource, implement other resources
2. associations
3. search endpoint
