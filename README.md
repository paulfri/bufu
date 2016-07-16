# Bufu

Giant Bomb API client for Elixir ([Shadow Teddie-approved](https://youtu.be/C2n0T_2SM_4?t=3m52s)).

## Usage

Response keys and error messages all map to those in the [API documentation](http://www.giantbomb.com/api/documentation).

```elixir
iex> Bufu.Game.get! 8825
%Bufu.Game{name: "Final Fantasy IX", ...}
```

## TODO

1. associations
2. sort and filter abstractions
3. search endpoint
4. documentation
