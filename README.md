# Bufu

Giant Bomb API client for Elixir. Not useful yet.

## Usage

```elixir
bufu = Bufu.new(api_key)
Bufu.Game.get(bufu, 8825)
```

You can also use a default API key in the system environment (probably the
application environment too, at some point).

```elixir
System.put_env("GIANT_BOMB_API_KEY", "abc123")
Bufu.Game.get(21373)
```

## TODO
1. test, find a request mocking lib?
2. extract game to generic resource, implement other resources
3. search endpoint
