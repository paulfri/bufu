defmodule Bufu.HTTP do
  @moduledoc false

  use HTTPotion.Base
  alias Poison.Parser

  @base_url "http://www.giantbomb.com/api/"

  def fetch(bufu, endpoint, id, opts), do: fetch(bufu, endpoint <> "/" <> to_string(id), opts)
  def fetch(bufu, endpoint, opts) do
    bufu
    |> build_url(endpoint, opts)
    |> get
    |> parse_response
  end

  def fetch!(bufu, endpoint, id, opts), do: fetch!(bufu, endpoint <> "/" <> to_string(id), opts)
  def fetch!(bufu, endpoint, opts) do
    case fetch(bufu, endpoint, opts) do
      {:err, message} -> raise message
      {:ok, response} -> response
    end
  end

  defp parse_response(%HTTPotion.ErrorResponse{} = e), do: {:err, "HTTP error: #{e.message}"}
  defp parse_response(%{status_code: 401}), do: {:err, "Invalid API key"}
  defp parse_response(%{status_code: 404}), do: {:err, "Endpoint not found"}
  defp parse_response(%{status_code: 200} = response) do
    with result <- Parser.parse!(response.body) do
      # http://www.giantbomb.com/api/documentation#toc-0-0
      case result["status_code"] do
        1 -> {:ok,  response.body}
        _ -> {:err, result["error"]}
      end
    end
  end

  defp build_url(bufu, endpoint, opts) do
    bufu |> build_query_string(@base_url <> endpoint <> "/", opts)
  end

  defp build_query_string(bufu, url, opts) do
    string = opts
    |> Keyword.merge(format: "json", api_key: Bufu.api_key(bufu))
    |> URI.encode_query

    url <> "?" <> string
  end

  def process_request_headers(headers) do
    Dict.put(headers, :"User-Agent", "bufu #{Bufu.version}")
  end
end
