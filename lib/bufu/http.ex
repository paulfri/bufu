defmodule Bufu.HTTP do
  use HTTPotion.Base

  def get(bufu, endpoint, id) do
    response = get "#{endpoint}/#{id}/?api_key=#{Bufu.api_key(bufu)}"

    {:ok, response_body} = response.body |> Poison.decode

    # http://www.giantbomb.com/api/documentation#toc-0-0
    case response_body["status_code"] do
      1 ->
        # return unparsed body, so we can decode as a record
        {:ok, response.body}
      _ ->
        {:err, response_body["error"]}
    end
  end

  def process_url(url) do
    "http://www.giantbomb.com/api/#{url}&format=json"
  end

  def process_request_headers(headers) do
    headers
    |> Dict.put :"User-Agent", "bufu #{Bufu.version}"
  end
end
