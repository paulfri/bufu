# Bufu

Giant Bomb API client for Elixir
([Shadow Teddie-approved](https://youtu.be/C2n0T_2SM_4?t=3m52s)).

See [Giant Bomb API information](http://www.giantbomb.com/api) and
[documentation](http://www.giantbomb.com/api/documentation) for more details.

## Usage

```elixir
iex> Bufu.Game.get 8825
{:ok, %Bufu.Game{name: "Final Fantasy IX", ...}}

iex> Bufu.Game.get! 8825
%Bufu.Game{name: "Final Fantasy IX", ...}

iex> Bufu.Location.list! filter: "name:ivalice"
[%Bufu.Location{name: "Ivalice", ...}, ...]

iex> Bufu.Game.get!(8825) |> Map.get(:developers) |> hd |> Bufu.Company.load! |> Map.get(:name)
"Squaresoft"
```

See the documentation for more details.

## Potential improvements

1. The search endpoint is not currently implemented. It would take some work to
get it to correctly serialize each resource it returns. You can still search for
a single resource by providing the `filter` option (see examples).
2. Per-client or global response caching could be implemented using ETS or a
pluggable data store.
