# Bufu

Giant Bomb API client for Elixir ([Shadow Teddie-approved](https://youtu.be/C2n0T_2SM_4?t=3m52s)). Not useful yet.

## Usage

Response keys and error messages all map to those in the documentation (http://www.giantbomb.com/api/documentation).

```elixir
bufu = Bufu.new(api_key)
Bufu.Game.get(bufu, 8825)
# => {:ok, %Bufu.Game{...}}
Bufu.Game.get(bufu, 0)
# => {:err, "Object Not Found"}
```

You can also use a default API key in the system environment (probably the application environment too, at some point).

```elixir
System.put_env("GIANT_BOMB_API_KEY", "abc123")
Bufu.Game.get(21373)
```

## TODO
1. test, find a request mocking lib?
2. extract game to generic resource, implement other resources
3. associations
4. search endpoint
