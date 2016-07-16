defmodule Bufu.HTTP do
  use HTTPotion.Base

  @base_url "http://www.giantbomb.com/api/"

  def fetch(bufu, endpoint, id, opts) do
    fetch(bufu, endpoint <> "/" <> to_string(id), opts)
  end

  def fetch(bufu, endpoint, opts) do
    response = bufu
    |> build_url(endpoint, opts)
    |> get

    response_body = response.body |> Poison.decode!

    # http://www.giantbomb.com/api/documentation#toc-0-0
    case response_body["status_code"] do
      1 ->
        # return unparsed body, so we can decode as a record
        {:ok, response.body}
      _ ->
        {:err, response_body["error"]}
    end
  end

  def fetch!(bufu, endpoint, id, opts) do
    fetch!(bufu, endpoint <> "/" <> to_string(id), opts)
  end

  def fetch!(bufu, endpoint, opts) do
    case fetch(bufu, endpoint, opts) do
      {:err, message} -> raise message
      {:ok, response} -> response
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
    headers
    |> Dict.put :"User-Agent", "bufu #{Bufu.version}"
  end
end
