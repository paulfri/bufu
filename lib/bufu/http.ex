defmodule Bufu.HTTP do
  use HTTPotion.Base

  @base_url "http://www.giantbomb.com/api/"

  def get(bufu, endpoint, id) do
    response = bufu
    |> build_url(endpoint, to_string(id))
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

  def get!(bufu, endpoint, id) do
    case get(bufu, endpoint, id) do
      {:err, message} -> raise message
      {:ok, response} -> response
    end
  end

  defp build_url(bufu, endpoint, id) do
    bufu |> build_query_string(@base_url <> endpoint <> "/" <> id <> "/")
  end

  defp build_query_string(bufu, url) do
    url <> "?" <> URI.encode_query(format: "json", api_key: Bufu.api_key(bufu))
  end

  def process_request_headers(headers) do
    headers
    |> Dict.put :"User-Agent", "bufu #{Bufu.version}"
  end
end
