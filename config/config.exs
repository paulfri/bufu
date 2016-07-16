use Mix.Config

config :exvcr, [
  vcr_cassette_library_dir: "fixture/vcr",
  filter_sensitive_data: [
    [pattern: "api_key=.+$", placeholder: "api_key=TEST_API_KEY"]
  ],
  filter_url_params: false
]
